import 'package:biologix_base_lib/device.dart';
import 'package:bxutility3/src/sensors/domain/event/bodystar_event.dart';

abstract interface class ScanBodystars {
  Future<void> call(void Function(BodystarEvent) onEvent);
}

class ScanBodystarsImpl implements ScanBodystars {
  ScanBodystarsImpl({
    required this.manager,
    required this.bodystarResultMapper,
  });
  final DeviceManager manager;
  final BodystarScanResult Function(ScanResult) bodystarResultMapper;

  @override
  Future<void> call(void Function(BodystarEvent) onEvent) async {
    final scanResult = bodystarResultMapper.call(
      await manager.startScan(type: DeviceType.bodystar),
    );

    if (scanResult.error != null) {
      _handleDeviceError(onEvent, scanResult.error!);
    } else {
      _handleDevices(onEvent, scanResult.devices);
    }
  }

  void _handleDevices(
    void Function(BodystarEvent) onEvent,
    List<BodystarScanDevice> devicesResult,
  ) {
    final devices = devicesResult
        .where((e) => e.mode == BodystarScanDevice.modeOperation)
        .toList();

    if (devices.isNotEmpty) {
      if (devices.length == 1) {
        onEvent(
          BodystarEventDevice(
            device: devices.first,
            connectionStatus: DeviceConnectionStatus.connecting,
          ),
        );
      } else {
        onEvent(
          BodystarEventDevices(
            devices: devices,
            connectionStatus: DeviceConnectionStatus.listing,
          ),
        );
      }
    } else {
      onEvent(const BodystarEventNotFound());
    }
  }

  void _handleDeviceError(void Function(BodystarEvent) onEvent, String error) {
    if (error == DeviceManager.bluetoothNotEnabled) {
      onEvent(
        const BodystarEventConnectionStatus(
          DeviceConnectionStatus.bluetoothNotEnabled,
        ),
      );
    } else {
      onEvent(
        const BodystarEventConnectionStatus(DeviceConnectionStatus.error),
      );
    }
  }
}
