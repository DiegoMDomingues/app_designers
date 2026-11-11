import 'package:biologix_base_lib/device.dart';
import 'package:biologix_base_lib/shared/utils/retry_delayed.dart';
import 'package:bxutility3/src/sensors/domain/event/sensor_event.dart';

abstract interface class FetchSensorData {
  Future<void> call(
    void Function(SensorEvent) onEvent, {
    required String sensorId,
    required DeviceType deviceType,
  });
}

class FetchSensorDataImpl implements FetchSensorData {
  FetchSensorDataImpl({required this.manager, required this.retryDelayed});
  final DeviceManager manager;
  final RetryDelayed retryDelayed;

  @override
  Future<void> call(
    void Function(SensorEvent) onEvent, {
    required String sensorId,
    required DeviceType deviceType,
  }) async {
    await retryDelayed.call(() async {
      final fwVersion = await manager.getFwVersion(
        sensorId: sensorId,
        deviceType: deviceType,
      );
      final serialNumber = await manager.getSerialNumber(
        sensorId: sensorId,
        deviceType: deviceType,
      );
      onEvent(
        SensorEventFetchData(fwVersion: fwVersion, serialNumber: serialNumber),
      );
    });
  }
}
