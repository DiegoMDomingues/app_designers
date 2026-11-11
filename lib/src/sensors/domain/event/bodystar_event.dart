import 'dart:async';

import 'package:biologix_base_lib/http_client.dart';
import 'package:biologix_base_lib/device.dart';

sealed class BodystarEvent {
  const BodystarEvent();
}

class BodystarEventDevice extends BodystarEvent {
  BodystarEventDevice({required this.device, required this.connectionStatus});
  final BodystarScanDevice device;
  final DeviceConnectionStatus connectionStatus;
}

class BodystarEventDevices extends BodystarEvent {
  BodystarEventDevices({required this.devices, required this.connectionStatus});
  final List<BodystarScanDevice> devices;
  final DeviceConnectionStatus connectionStatus;
}

class BodystarEventConnection extends BodystarEvent {
  BodystarEventConnection(this.subscription);

  final StreamSubscription<BodystarPayload> subscription;
}

final class BodystarEventLoading extends BodystarEvent {
  const BodystarEventLoading(this.cancelRequest);

  final BLXCancelRequest cancelRequest;
}

final class BodystarEventConnectionStatus extends BodystarEvent {
  const BodystarEventConnectionStatus(this.connectionStatus);

  final DeviceConnectionStatus connectionStatus;
}

final class BodystarEventDisconnect extends BodystarEvent {
  const BodystarEventDisconnect();
}

final class BodystarEventNotFound extends BodystarEvent {
  const BodystarEventNotFound();
}
