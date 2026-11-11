import 'dart:async';

import 'package:biologix_base_lib/device.dart';
import 'package:biologix_base_lib/shared/utils/blx_logger.dart';
import 'package:biologix_base_lib/shared/utils/msg_ble.dart';
import 'package:biologix_base_lib/shared/views/snackbar/blx_snackbar_delegate.dart';
import 'package:biologix_base_lib/state_manager.dart';
import 'package:bxutility3/i18n/strings.g.dart';
import 'package:bxutility3/src/sensors/domain/event/bodystar_event.dart';
import 'package:bxutility3/src/sensors/domain/event/sensor_event.dart';
import 'package:bxutility3/src/sensors/domain/usecase/bodystar/connect_bodystar.dart';
import 'package:bxutility3/src/sensors/domain/usecase/bodystar/scan_bodystars.dart';
import 'package:bxutility3/src/sensors/domain/usecase/fetch_sensor_data.dart';
import 'package:bxutility3/src/sensors/domain/usecase/has_sensor_permission.dart';
import 'package:bxutility3/src/sensors/domain/usecase/open_settings.dart';
import 'package:bxutility3/src/sensors/view/cubit/bodystar/bodystar_state.dart';
import 'package:bxutility3/src/shared/utils/blx_images_svg.dart';
import 'package:flutter/foundation.dart';

final class BodystarCubit extends BLXCubit<BodystarState> {
  BodystarCubit({
    required HasSensorPermission hasPermission,
    required ScanBodystars scanBodystars,
    required ConnectBodystar connectBodystar,
    required FetchSensorData fetchSensorData,
    required OpenSettings openSettings,
  }) : _hasPermission = hasPermission,
       _scanBodystars = scanBodystars,
       _connectBodystar = connectBodystar,
       _fetchSensorData = fetchSensorData,
       _openSettings = openSettings,
       super(BodystarState.initial());

  final HasSensorPermission _hasPermission;
  final ScanBodystars _scanBodystars;
  final ConnectBodystar _connectBodystar;
  final FetchSensorData _fetchSensorData;
  final OpenSettings _openSettings;

  StreamSubscription<BodystarPayload>? _sub;

  bool isFetchingData = false;

  void Function(List<BodystarScanDevice> devices)? _showModalSelectDevice;

  Future<void> init({
    required BLXSnackbarDelegate snackbar,
    void Function(List<BodystarScanDevice> devices)? showModalSelectDevice,
  }) async {
    this.snackbar = snackbar;

    final bleTexts = await MsgBle.msgs(isPermissionNeed: false);
    if (!isClosed) {
      emit(state.copyWith(bleDisabled: bleTexts.a, bleDisabledMsg: bleTexts.b));
    }
    _showModalSelectDevice = showModalSelectDevice;

    await loadPermission();
  }

  @override
  Future<void> terminate() async {
    await resetState();
    await cancelSubscriptions();
    super.terminate();
  }

  @visibleForTesting
  StreamSubscription<BodystarPayload>? getSubscription() {
    return _sub;
  }

  @visibleForTesting
  void onEventSensor(SensorEvent event) {
    switch (event) {
      case SensorEventPermission():
        emit(state.copyWith(permission: event.permission));
      case SensorEventFetchData():
        emit(
          state.copyWith(
            fwVersion: event.fwVersion,
            serialNumber: event.serialNumber,
            connStatusDevice: DeviceConnectionStatus.connected,
          ),
        );
        snackbar?.success(t.connected_successfully);
      case SensorEventFirmwareOk():
        emit(state.copyWith(firmware: event.firmware));
      case _:
    }
  }

  @visibleForTesting
  void onEvent(BodystarEvent event) {
    switch (event) {
      case BodystarEventLoading():
        request = event.cancelRequest;
      case BodystarEventDevice():
        emit(
          state.copyWith(
            selectedDevice: event.device,
            connStatusDevice: event.connectionStatus,
          ),
        );
        _connectBodystar.call(
          onEvent,
          sensorId: event.device.id,
          onData: onData,
        );
      case BodystarEventDevices():
        emit(
          state.copyWith(
            devices: event.devices,
            connStatusDevice: event.connectionStatus,
          ),
        );
        _showModalSelectDevice?.call(event.devices);
      case BodystarEventNotFound():
        snackbar?.warning(t.bodystar.sensor_not_found);
        cancelSubscriptions();
        emit(state.copyWith(connStatusDevice: DeviceConnectionStatus.error));
      case BodystarEventConnectionStatus():
        // if (event.connectionStatus ==
        //     DeviceConnectionStatus.bluetoothNotEnabled) {
        //   emit(
        //     state.copyWith(permission: DeviceManager.permissionDeniedForever),
        //   );
        // }
        emit(state.copyWith(connStatusDevice: event.connectionStatus));
        if (event.connectionStatus == DeviceConnectionStatus.error) {
          snackbar?.warning(t.bodystar.error_connecting);
        }
      case BodystarEventConnection():
        setSubscription(event.subscription);
      case BodystarEventDisconnect():
        resetState();
    }
  }

  @visibleForTesting
  Future<void> setSubscription(StreamSubscription<BodystarPayload> sub) async {
    await _sub?.cancel();
    _sub = sub;
  }

  Future<void> onData(BodystarPayload payload) async {
    switch (payload) {
      case BodystarPayloadState():
        if (payload.connected) {
          if (state.fwVersion == null || state.serialNumber == null) {
            if (!isFetchingData) {
              try {
                isFetchingData = true;
                await _fetchSensorData.call(
                  onEventSensor,
                  sensorId: state.selectedDevice!.id,
                  deviceType: DeviceType.bodystar,
                );
              } catch (ex) {
                emit(
                  state.copyWith(
                    connStatusDevice: DeviceConnectionStatus.error,
                  ),
                );
                await cancelSubscriptions();
                rethrow;
              } finally {
                isFetchingData = false;
              }
            }
          }

          emit(
            state.copyWith(
              bodystarPayloadState: payload,
              connStatusDevice: DeviceConnectionStatus.connected,
            ),
          );
        } else {
          emit(
            state.copyWith(
              connStatusDevice: DeviceConnectionStatus.notConnected,
            ),
          );
          blxLogger.warn(t.sensor_not_connected);
        }
      case BodystarPayloadView():
        {
          emit(state.copyWith(bodystarPayloadView: payload));
        }
    }
  }

  bool get hasFirmwareUpdate =>
      state.firmware != null && state.firmware!.hasUpdate;

  bool get hasFirmwareUpdateForced =>
      state.firmware != null && state.firmware!.isForcedUpdate;

  bool get enableButtonExam => hasDeviceData && !hasFirmwareUpdateForced;

  Future<void> loadPermission() async {
    await _hasPermission.call(onEventSensor);
  }

  Future<void> scanDevice() async {
    if (isConnectedOrConnecting) {
      blxLogger.info(t.sensor_is_already_connected);
      return;
    }
    emit(state.copyWith(connStatusDevice: DeviceConnectionStatus.finding));

    await _scanBodystars.call(onEvent);
  }

  Future<void> connectDevice(String id) async {
    emit(
      state.copyWith(
        selectedDevice: BodystarScanDevice(
          name: 'Bodystar',
          id: id,
          mode: BodystarScanDevice.modeOperation,
          model: state.selectedDevice?.id == id
              ? state.selectedDevice?.model
              : null,
        ),
        connStatusDevice: DeviceConnectionStatus.connecting,
      ),
    );
    await _connectBodystar.call(onEvent, sensorId: id, onData: onData);
  }

  bool get hasDeviceData =>
      state.bodystarPayloadState != null &&
      state.bodystarPayloadView != null &&
      state.fwVersion != null &&
      state.serialNumber != null &&
      state.selectedDevice != null;

  int? get battery => state.bodystarPayloadState!.battPercentage;

  bool get hasLowBattery => hasDeviceData && battery != null && battery! < 50;

  String get formattedBatteryValue => '${battery ?? '-'}%';

  void selectDevice(BodystarScanDevice device) {
    emit(state.copyWith(selectedDevice: device));
  }

  void chooseDevice(BodystarScanDevice device) {
    selectDevice(device);
    _connectBodystar(onEvent, sensorId: device.id, onData: onData);
  }

  Future<void> resetState() async {
    await cancelSubscriptions();
    final bleTexts = await MsgBle.msgs(isPermissionNeed: false);
    if (!isClosed) {
      emit(
        BodystarState.initial().copyWith(
          bleDisabled: bleTexts.a,
          bleDisabledMsg: bleTexts.b,
          permission: state.permission,
        ),
      );
    }
  }

  Future<void> openSettings() async {
    await _openSettings.call();
  }

  Future<void> cancelSubscriptions() async {
    await _sub?.cancel();
    _sub = null;
  }

  String bodyPositionLabel() {
    return switch (state.bodystarPayloadView?.position) {
      BodyPosition.top => t.bodystar.positions.top,
      BodyPosition.bottom => t.bodystar.positions.bottom,
      BodyPosition.left => t.bodystar.positions.left,
      BodyPosition.right => t.bodystar.positions.right,
      _ => t.bodystar.positions.other,
    };
  }

  String iconPosition() {
    return switch (state.bodystarPayloadView?.position) {
      BodyPosition.top => BLXImagesSVG.bodystarSupine,
      BodyPosition.bottom => BLXImagesSVG.bodystarProne,
      BodyPosition.left => BLXImagesSVG.bodystarLeft,
      BodyPosition.right => BLXImagesSVG.bodystarRight,
      _ => '',
    };
  }

  bool get canBeEnabled =>
      state.permission == DeviceManager.permissionGranted &&
      state.connStatusDevice != DeviceConnectionStatus.notConnected &&
      state.connStatusDevice != DeviceConnectionStatus.error &&
      state.connStatusDevice != DeviceConnectionStatus.bluetoothNotEnabled;

  bool get isConnectedOrConnecting =>
      state.connStatusDevice == DeviceConnectionStatus.finding ||
      state.connStatusDevice == DeviceConnectionStatus.connected ||
      state.connStatusDevice == DeviceConnectionStatus.connecting;
}
