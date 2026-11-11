import 'package:biologix_base_lib/device.dart';
import 'package:biologix_base_lib/shared/views/widgets/pleth_view.dart';
import 'package:bxutility3/src/sensors/domain/model/sensor_firmware.dart';
import 'package:equatable/equatable.dart';

enum OximeterFlow { initial, connecting }

class OxistarState with Equatable {
  const OxistarState({
    required this.permission,
    required this.selectedDevice,
    required this.connStatusDevice,
    required this.devices,
    required this.oxistarPayloadState,
    required this.oxistarPayloadView,
    required this.serialNumber,
    required this.fwVersion,
    required this.plethData,
    required this.countRetryFetch,
    required this.bleDisabled,
    required this.bleDisabledMsg,
    required this.flow,
    required this.firmware,
  });

  OxistarState.initial()
    : this(
        permission: DeviceManager.permissionDenied,
        selectedDevice: null,
        connStatusDevice: DeviceConnectionStatus.notConnected,
        devices: [],
        oxistarPayloadState: null,
        oxistarPayloadView: null,
        serialNumber: null,
        fwVersion: null,
        plethData: null,
        countRetryFetch: 0,
        bleDisabled: '',
        bleDisabledMsg: '',
        flow: OximeterFlow.initial,
        firmware: null,
      );

  final int permission;
  final OxistarScanDevice? selectedDevice;
  final DeviceConnectionStatus connStatusDevice;
  final List<OxistarScanDevice> devices;
  final OxistarPayloadState? oxistarPayloadState;
  final OxistarPayloadView? oxistarPayloadView;
  final int? serialNumber;
  final String? fwVersion;
  final PlethData? plethData;
  final int countRetryFetch;
  final String bleDisabled;
  final String bleDisabledMsg;
  final OximeterFlow flow;
  final SensorFirmware? firmware;

  int? get battery => oxistarPayloadState?.battPercentage;

  bool get hasLowBattery => battery != null && battery! < 50;

  @override
  List<Object?> get props => [
    permission,
    selectedDevice,
    connStatusDevice,
    devices,
    oxistarPayloadState,
    oxistarPayloadView,
    serialNumber,
    fwVersion,
    plethData,
    countRetryFetch,
    bleDisabled,
    bleDisabledMsg,
    flow,
    firmware,
  ];

  OxistarState copyWith({
    int? permission,
    OxistarScanDevice? selectedDevice,
    DeviceConnectionStatus? connStatusDevice,
    List<OxistarScanDevice>? devices,
    OxistarPayloadState? oxistarPayloadState,
    OxistarPayloadView? oxistarPayloadView,
    int? serialNumber,
    String? fwVersion,
    PlethData? plethData,
    int? countRetryFetch,
    String? bleDisabled,
    String? bleDisabledMsg,
    OximeterFlow? flow,
    SensorFirmware? firmware,
  }) {
    return OxistarState(
      permission: permission ?? this.permission,
      selectedDevice: selectedDevice ?? this.selectedDevice,
      connStatusDevice: connStatusDevice ?? this.connStatusDevice,
      devices: devices ?? this.devices,
      oxistarPayloadState: oxistarPayloadState ?? this.oxistarPayloadState,
      oxistarPayloadView: oxistarPayloadView ?? this.oxistarPayloadView,
      serialNumber: serialNumber ?? this.serialNumber,
      fwVersion: fwVersion ?? this.fwVersion,
      plethData: plethData ?? this.plethData,
      countRetryFetch: countRetryFetch ?? this.countRetryFetch,
      bleDisabled: bleDisabled ?? this.bleDisabled,
      bleDisabledMsg: bleDisabledMsg ?? this.bleDisabledMsg,
      flow: flow ?? this.flow,
      firmware: firmware ?? this.firmware,
    );
  }
}
