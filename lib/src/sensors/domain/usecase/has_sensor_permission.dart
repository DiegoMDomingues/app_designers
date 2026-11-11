import 'package:biologix_base_lib/device.dart';
import 'package:bxutility3/src/sensors/domain/event/sensor_event.dart';

abstract interface class HasSensorPermission {
  Future<void> call(void Function(SensorEvent) onEvent);
}

class HasSensorPermissionImpl implements HasSensorPermission {
  HasSensorPermissionImpl({required this.manager});
  final DeviceManager manager;

  @override
  Future<void> call(void Function(SensorEvent) onEvent) async {
    onEvent(SensorEventPermission(await manager.hasPermissions()));
  }
}
