import 'dart:math';

class SensorFirmware {
  SensorFirmware({
    required this.updatePriority,
    required this.imageName,
    required this.currentVersion,
    required this.latestVersion,
  }) {
    _x = Random().nextInt(100);
  }

  final int updatePriority;
  final String? imageName;
  final String? currentVersion;
  final String? latestVersion;

  int _x = 0;

  bool get hasUpdate =>
      imageName != null &&
      currentVersion != null &&
      latestVersion != null &&
      latestVersion != currentVersion;

  bool get isForcedUpdate {
    return hasUpdate && (updatePriority == 100 || _x < updatePriority);
  }
}
