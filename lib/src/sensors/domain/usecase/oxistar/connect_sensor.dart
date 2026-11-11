import 'package:biologix_base_lib/scheduler.dart';
import 'package:biologix_base_lib/device.dart';
import 'package:bxutility3/src/sensors/domain/event/sensor_event.dart';

abstract interface class ConnectSensor {
  Future<void> call(
    void Function(SensorEvent) onEvent, {
    required String sensorId,
    required void Function(OxistarPayload event) onData,
  });
}

class ConnectSensorImpl implements ConnectSensor {
  ConnectSensorImpl({required this.manager, required this.scheduler});
  final DeviceManager manager;
  final Scheduler scheduler;

  @override
  Future<void> call(
    void Function(SensorEvent) onEvent, {
    required String sensorId,
    required void Function(OxistarPayload event) onData,
  }) async {
    manager.keepScreenOn(true);

    bool isRunning = false;

    try {
      final event = SensorEventConnection(
        manager.oxistarConnect(sensorId, (payload) {
            switch (payload) {
              case OxistarPayloadState():
                if (!payload.connected) {
                  if (isRunning) {
                    isRunning = false;
                    onEvent(const SensorEventDisconnect());
                  } else {
                    scheduler.schedule(() {
                      isRunning = false;
                      onEvent(const SensorEventNotFound());
                    });
                  }
                } else {
                  isRunning = true;
                  scheduler.cancel();
                  onData(payload);
                }
              case OxistarPayloadView():
                onData(payload);
            }
          })
          ..onDone(() {
            onEvent(const SensorEventDisconnect());
          })
          ..onError((error) {
            onEvent(SensorEventConnectionStatus(DeviceConnectionStatus.error));
          }),
      );
      onEvent(event);
    } catch (e) {
      onEvent(SensorEventConnectionStatus(DeviceConnectionStatus.error));
      rethrow;
    }
  }
}
