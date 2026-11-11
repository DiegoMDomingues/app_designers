import 'dart:async';

import 'package:biologix_base_lib/device.dart';
import 'package:biologix_base_lib/shared/utils/blx_logger.dart';
import 'package:biologix_base_lib/shared/utils/msg_ble.dart';
import 'package:biologix_base_lib/shared/views/snackbar/blx_snackbar_delegate.dart';
import 'package:biologix_base_lib/shared/views/widgets/pleth_view.dart';
import 'package:biologix_base_lib/state_manager.dart';
import 'package:bxutility3/i18n/strings.g.dart';
import 'package:bxutility3/src/sensors/domain/event/sensor_event.dart';
import 'package:bxutility3/src/sensors/domain/usecase/fetch_sensor_data.dart';
import 'package:bxutility3/src/sensors/domain/usecase/has_sensor_permission.dart';
import 'package:bxutility3/src/sensors/domain/usecase/open_settings.dart';
import 'package:bxutility3/src/sensors/domain/usecase/oxistar/connect_sensor.dart';
import 'package:bxutility3/src/sensors/domain/usecase/oxistar/scan_sensors.dart';
import 'package:bxutility3/src/sensors/view/cubit/oxistar/oxistar_state.dart';
import 'package:flutter/foundation.dart';

/// 1. Check the permission status and save it.
/// 2. Upon clicking connect, check the permission status.
///   2.1. If permitted, scan for sensors via Bluetooth.
///     2.1.1. If a sensor is found, establish the connection.
///     2.1.2. If more than one sensor is found, show a sensor selection screen.
///     2.1.3. If no sensor is found or an error occurs, show the "not found" screen.
///   2.2. If not permitted, show the system's native modal requesting permission.
///     2.2.1. If denied, show a custom modal leading to settings.
/// 3. With the sensor connected, listen for events sent by the sensor.
///   3.1. If the event is `state`;
///     3.1.1. If connected to the sensor, check if the firmware number and serial number are available.
///       3.1.1.1. If not available, fetch the sensor data and update the firmware and serial numbers.
///       3.1.1.2. If available, check if a firmware update is available.
///                if yes, display a card on the screen asking to update the sensor.
///     3.1.2. If not connected to the sensor, reset the screen to its initial state and unsubscribe from the events.
///   3.2. If the event is `view`.
///     3.2.1. Update the graph on the screen with the value that came with the event.
/// 4. Disconnect from the sensor.
///   4.1. Upon closing the screen, disconnect from the sensor.
///   4.2. When the app is minimized, disconnect from the sensor.
/// 5. Disable screen sleep when starting and re-enable it when leaving the screen.
final class OxistarCubit extends BLXCubit<OxistarState> {
  OxistarCubit({
    required HasSensorPermission hasPermission,
    required ScanSensors scanSensors,
    required ConnectSensor connectSensor,
    required FetchSensorData fetchSensorData,
    required OpenSettings openSettings,
  }) : _hasPermission = hasPermission,
       _scanSensors = scanSensors,
       _connectSensor = connectSensor,
       _fetchSensorData = fetchSensorData,
       _openSettings = openSettings,
       super(OxistarState.initial());

  final HasSensorPermission _hasPermission;
  final ScanSensors _scanSensors;
  final ConnectSensor _connectSensor;
  final FetchSensorData _fetchSensorData;
  final OpenSettings _openSettings;

  StreamSubscription<OxistarPayload>? _sub;

  bool isFetchingData = false;

  void Function(List<OxistarScanDevice> devices)? _showModalSelectDevice;

  Future<void> init({
    required BLXSnackbarDelegate snackbar,
    required void Function(List<OxistarScanDevice> devices)
    showModalSelectDevice,
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

  void onEvent(SensorEvent event) {
    switch (event) {
      case SensorEventFirmwareOk():
        emit(state.copyWith(firmware: event.firmware));
      case SensorEventLoading():
        request = event.cancelRequest;
      case SensorEventPermission():
        emit(state.copyWith(permission: event.permission));
      case SensorEventDevice():
        emit(
          state.copyWith(
            selectedDevice: event.device,
            connStatusDevice: event.connectionStatus,
          ),
        );
        _connectSensor(onEvent, sensorId: event.device.id, onData: onData);
      case SensorEventDevices():
        emit(
          state.copyWith(
            devices: event.devices,
            connStatusDevice: event.connectionStatus,
          ),
        );
        _showModalSelectDevice?.call(event.devices);
      case SensorEventNotFound():
        snackbar?.warning(t.sensor_not_found);
        cancelSubscriptions();
        emit(state.copyWith(connStatusDevice: DeviceConnectionStatus.error));
      case SensorEventConnectionStatus():
        // print('connectionStatus: ${event.connectionStatus}');
        // if (event.connectionStatus ==
        //     DeviceConnectionStatus.bluetoothNotEnabled) {
        //   emit(
        //     state.copyWith(permission: DeviceManager.permissionDeniedForever),
        //   );
        // }
        emit(state.copyWith(connStatusDevice: event.connectionStatus));
        if (event.connectionStatus == DeviceConnectionStatus.error) {
          snackbar?.warning(t.error_connecting_to_sensor);
        }
      case SensorEventConnection():
        setSubscription(event.subscription);
      case SensorEventFetchData():
        {
          emit(
            state.copyWith(
              fwVersion: event.fwVersion,
              serialNumber: event.serialNumber,
              connStatusDevice: DeviceConnectionStatus.connected,
            ),
          );
          snackbar?.success(t.connected_successfully);
        }
      case SensorEventDisconnect():
        resetState();
    }
  }

  Future<void> openSettings() async {
    await _openSettings.call();
  }

  void chooseDevice(OxistarScanDevice device) {
    selectDevice(device);
    _connectSensor(onEvent, sensorId: device.id, onData: onData);
  }

  @visibleForTesting
  Future<void> setSubscription(StreamSubscription<OxistarPayload> sub) async {
    await _sub?.cancel();
    _sub = sub;
  }

  @visibleForTesting
  StreamSubscription<OxistarPayload>? getSubscription() {
    return _sub;
  }

  Future<void> onData(OxistarPayload payload) async {
    switch (payload) {
      case OxistarPayloadState():
        if (payload.connected) {
          if (state.fwVersion == null || state.serialNumber == null) {
            if (!isFetchingData) {
              try {
                if (state.selectedDevice != null) {
                  isFetchingData = true;
                  await _fetchSensorData(
                    onEvent,
                    sensorId: state.selectedDevice!.id,
                    deviceType: DeviceType.oxistar,
                  );
                }
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
              oxistarPayloadState: payload,
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
      case OxistarPayloadView():
        {
          emit(
            state.copyWith(
              plethData: (state.plethData ?? PlethData.empty(250)).copyWith(
                payload,
              ),
              oxistarPayloadView: payload,
            ),
          );
        }
    }
  }

  bool get hasFirmwareUpdate =>
      state.firmware != null && state.firmware!.hasUpdate;

  bool get hasFirmwareUpdateForced =>
      state.firmware != null && state.firmware!.isForcedUpdate;

  bool get enableButtonExam => hasDeviceData && !hasFirmwareUpdateForced;

  Future<void> loadPermission() async {
    await _hasPermission.call(onEvent);
  }

  Future<void> scanDevice() async {
    if (isConnectedOrConnecting) {
      blxLogger.info(t.sensor_is_already_connected);
      return;
    }
    emit(state.copyWith(connStatusDevice: DeviceConnectionStatus.finding));

    await _scanSensors.call(onEvent);
  }

  Future<void> connectDevice(String id) async {
    emit(
      state.copyWith(
        selectedDevice: OxistarScanDevice(
          id: id,
          name: OxistarScanDevice.nameDevice,
          mode: OxistarScanDevice.modeOximeter,
          model: state.selectedDevice?.id == id
              ? state.selectedDevice?.model
              : null,
        ),
        connStatusDevice: DeviceConnectionStatus.connecting,
      ),
    );
    await _connectSensor.call(onEvent, sensorId: id, onData: onData);
  }

  bool get hasDeviceData =>
      state.oxistarPayloadState != null &&
      state.plethData != null &&
      state.fwVersion != null &&
      state.serialNumber != null &&
      state.selectedDevice != null;

  bool get isBx1 =>
      state.fwVersion != null &&
      RegExp(r'^(0[1-2])\.\d{3}\.\d{3}').firstMatch(state.fwVersion!) != null;

  void selectDevice(OxistarScanDevice device) {
    emit(state.copyWith(selectedDevice: device));
  }

  Future<void> resetState() async {
    await cancelSubscriptions();
    final bleTexts = await MsgBle.msgs(isPermissionNeed: false);
    if (!isClosed) {
      emit(
        OxistarState.initial().copyWith(
          bleDisabled: bleTexts.a,
          bleDisabledMsg: bleTexts.b,
          permission: state.permission,
        ),
      );
    }
  }

  Future<void> closeAndReset() async {
    await resetState();
  }

  Future<void> cancelSubscriptions() async {
    await _sub?.cancel();
    _sub = null;
  }

  String get formattedBatteryValue => '${state.battery ?? '-'}%';

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
