import 'dart:async';

import 'package:biologix_base_lib/http_client.dart';
import 'package:biologix_base_lib/device.dart';
import 'package:bxutility3/src/sensors/domain/model/sensor_firmware.dart';

sealed class SensorEvent {
  const SensorEvent();
}

class SensorEventPermission extends SensorEvent {
  SensorEventPermission(this.permission);
  final int permission;
}

class SensorEventDevice extends SensorEvent {
  SensorEventDevice({required this.device, required this.connectionStatus});
  final OxistarScanDevice device;
  final DeviceConnectionStatus connectionStatus;
}

class SensorEventDevices extends SensorEvent {
  SensorEventDevices({required this.devices, required this.connectionStatus});
  final List<OxistarScanDevice> devices;
  final DeviceConnectionStatus connectionStatus;
}

class SensorEventConnection extends SensorEvent {
  SensorEventConnection(this.subscription);

  final StreamSubscription<OxistarPayload> subscription;
}

final class SensorEventFirmwareOk extends SensorEvent {
  const SensorEventFirmwareOk({required this.firmware});

  final SensorFirmware firmware;
}

final class SensorEventLoading extends SensorEvent {
  const SensorEventLoading(this.cancelRequest);

  final BLXCancelRequest cancelRequest;
}

final class SensorEventConnectionStatus extends SensorEvent {
  const SensorEventConnectionStatus(this.connectionStatus);

  final DeviceConnectionStatus connectionStatus;
}

final class SensorEventFetchData extends SensorEvent {
  const SensorEventFetchData({
    required this.fwVersion,
    required this.serialNumber,
  });

  final String fwVersion;
  final int serialNumber;
}

final class SensorEventDisconnect extends SensorEvent {
  const SensorEventDisconnect();
}

final class SensorEventNotFound extends SensorEvent {
  const SensorEventNotFound();
}
