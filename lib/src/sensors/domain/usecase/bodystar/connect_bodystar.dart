import 'package:biologix_base_lib/scheduler.dart';
import 'package:biologix_base_lib/device.dart';
import 'package:bxutility3/src/sensors/domain/event/bodystar_event.dart';

abstract interface class ConnectBodystar {
  Future<void> call(
    void Function(BodystarEvent) onEvent, {
    required String sensorId,
    required void Function(BodystarPayload event) onData,
  });
}

class ConnectBodystarImpl implements ConnectBodystar {
  ConnectBodystarImpl({required this.manager, required this.scheduler});
  final DeviceManager manager;
  final Scheduler scheduler;

  @override
  Future<void> call(
    void Function(BodystarEvent) onEvent, {
    required String sensorId,
    required void Function(BodystarPayload event) onData,
  }) async {
    manager.keepScreenOn(true);

    bool isRunning = false;
    try {
      final event = BodystarEventConnection(
        manager.bodystarConnect(sensorId, (payload) {
            switch (payload) {
              case BodystarPayloadState():
                if (!payload.connected) {
                  if (isRunning) {
                    isRunning = false;
                    onEvent(const BodystarEventDisconnect());
                  } else {
                    scheduler.schedule(() {
                      isRunning = false;
                      onEvent(const BodystarEventNotFound());
                    });
                  }
                } else {
                  isRunning = true;
                  scheduler.cancel();
                  onData(payload);
                }
              case BodystarPayloadView():
                onData(payload);
            }
          })
          ..onDone(() {
            onEvent(const BodystarEventDisconnect());
          })
          ..onError((error) {
            onEvent(
              BodystarEventConnectionStatus(DeviceConnectionStatus.error),
            );
          }),
      );
      onEvent(event);
    } catch (e) {
      onEvent(BodystarEventConnectionStatus(DeviceConnectionStatus.error));
      rethrow;
    }
  }
}
