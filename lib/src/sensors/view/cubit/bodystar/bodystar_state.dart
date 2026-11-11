import 'package:biologix_base_lib/device.dart';
import 'package:bxutility3/src/sensors/domain/model/sensor_firmware.dart';
import 'package:equatable/equatable.dart';

enum BodystarFlow { initial, connecting }

class BodystarState with Equatable {
  const BodystarState({
    required this.permission,
    required this.selectedDevice,
    required this.connStatusDevice,
    required this.devices,
    required this.bodystarPayloadState,
    required this.bodystarPayloadView,
    required this.serialNumber,
    required this.fwVersion,
    required this.countRetryFetch,
    required this.bleDisabled,
    required this.bleDisabledMsg,
    required this.flow,
    required this.firmware,
  });

  BodystarState.initial()
    : this(
        permission: DeviceManager.permissionDenied,
        selectedDevice: null,
        connStatusDevice: DeviceConnectionStatus.notConnected,
        devices: [],
        bodystarPayloadState: null,
        bodystarPayloadView: null,
        serialNumber: null,
        fwVersion: null,
        countRetryFetch: 0,
        bleDisabled: '',
        bleDisabledMsg: '',
        flow: BodystarFlow.initial,
        firmware: null,
      );

  final int permission;
  final BodystarScanDevice? selectedDevice;
  final DeviceConnectionStatus connStatusDevice;
  final List<BodystarScanDevice> devices;
  final BodystarPayloadState? bodystarPayloadState;
  final BodystarPayloadView? bodystarPayloadView;
  final int? serialNumber;
  final String? fwVersion;
  final int countRetryFetch;
  final String bleDisabled;
  final String bleDisabledMsg;
  final BodystarFlow flow;
  final SensorFirmware? firmware;

  @override
  List<Object?> get props => [
    permission,
    selectedDevice,
    connStatusDevice,
    devices,
    bodystarPayloadState,
    bodystarPayloadView,
    serialNumber,
    fwVersion,
    countRetryFetch,
    bleDisabled,
    bleDisabledMsg,
    flow,
    firmware,
  ];

  BodystarState copyWith({
    int? permission,
    BodystarScanDevice? selectedDevice,
    DeviceConnectionStatus? connStatusDevice,
    List<BodystarScanDevice>? devices,
    BodystarPayloadState? bodystarPayloadState,
    BodystarPayloadView? bodystarPayloadView,
    int? serialNumber,
    String? fwVersion,
    int? countRetryFetch,
    String? bleDisabled,
    String? bleDisabledMsg,
    BodystarFlow? flow,
    SensorFirmware? firmware,
  }) {
    return BodystarState(
      permission: permission ?? this.permission,
      selectedDevice: selectedDevice ?? this.selectedDevice,
      connStatusDevice: connStatusDevice ?? this.connStatusDevice,
      devices: devices ?? this.devices,
      bodystarPayloadState: bodystarPayloadState ?? this.bodystarPayloadState,
      bodystarPayloadView: bodystarPayloadView ?? this.bodystarPayloadView,
      serialNumber: serialNumber ?? this.serialNumber,
      fwVersion: fwVersion ?? this.fwVersion,
      countRetryFetch: countRetryFetch ?? this.countRetryFetch,
      bleDisabled: bleDisabled ?? this.bleDisabled,
      bleDisabledMsg: bleDisabledMsg ?? this.bleDisabledMsg,
      flow: flow ?? this.flow,
      firmware: firmware ?? this.firmware,
    );
  }
}
