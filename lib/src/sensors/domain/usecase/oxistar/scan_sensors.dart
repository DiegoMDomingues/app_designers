import 'package:biologix_base_lib/device.dart';
import 'package:bxutility3/src/sensors/domain/event/sensor_event.dart';

abstract interface class ScanSensors {
  Future<void> call(void Function(SensorEvent) onEvent);
}

class ScanSensorsImpl implements ScanSensors {
  ScanSensorsImpl({required this.manager, required this.oxistarResultMapper});
  final DeviceManager manager;
  final OxistarScanResult Function(ScanResult) oxistarResultMapper;

  @override
  Future<void> call(void Function(SensorEvent) onEvent) async {
    final scanResult = oxistarResultMapper.call(
      await manager.startScan(type: DeviceType.oxistar),
    );

    if (scanResult.error != null) {
      _handleDeviceError(onEvent, scanResult.error!);
    } else {
      _handleDevices(onEvent, scanResult.devices);
    }
  }

  void _handleDevices(
    void Function(SensorEvent) onEvent,
    List<OxistarScanDevice> devicesResult,
  ) {
    final devices = devicesResult
        .where((e) => e.mode == OxistarScanDevice.modeOximeter)
        .toList();

    if (devices.isNotEmpty) {
      if (devices.length == 1) {
        onEvent(
          SensorEventDevice(
            device: devices.first,
            connectionStatus: DeviceConnectionStatus.connecting,
          ),
        );
      } else {
        onEvent(
          SensorEventDevices(
            devices: devices,
            connectionStatus: DeviceConnectionStatus.listing,
          ),
        );
      }
    } else {
      onEvent(const SensorEventNotFound());
    }
  }

  void _handleDeviceError(void Function(SensorEvent) onEvent, String error) {
    if (error == DeviceManager.bluetoothNotEnabled) {
      onEvent(
        const SensorEventConnectionStatus(
          DeviceConnectionStatus.bluetoothNotEnabled,
        ),
      );
    } else {
      onEvent(const SensorEventConnectionStatus(DeviceConnectionStatus.error));
    }
  }
}
