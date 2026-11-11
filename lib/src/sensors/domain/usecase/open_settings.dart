import 'package:biologix_base_lib/device.dart';

abstract interface class OpenSettings {
  Future<void> call();
}

class OpenSettingsImpl implements OpenSettings {
  OpenSettingsImpl({required this.manager});
  final DeviceManager manager;

  @override
  Future<void> call() async {
    manager.openSettingsWhenPermissionDenied();
  }
}
