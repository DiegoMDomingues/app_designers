import 'package:biologix_base_lib/device.dart';
import 'package:biologix_base_lib/scheduler.dart';
import 'package:biologix_base_lib/shared/utils/retry_delayed.dart';
import 'package:bxutility3/src/sensors/domain/usecase/bodystar/connect_bodystar.dart';
import 'package:bxutility3/src/sensors/domain/usecase/bodystar/scan_bodystars.dart';
import 'package:bxutility3/src/sensors/domain/usecase/fetch_sensor_data.dart';
import 'package:bxutility3/src/sensors/domain/usecase/has_sensor_permission.dart';
import 'package:bxutility3/src/sensors/domain/usecase/open_settings.dart';
import 'package:bxutility3/src/sensors/domain/usecase/oxistar/connect_sensor.dart';
import 'package:bxutility3/src/sensors/domain/usecase/oxistar/scan_sensors.dart';
import 'package:bxutility3/src/sensors/view/cubit/bodystar/bodystar_cubit.dart';
import 'package:bxutility3/src/sensors/view/cubit/oxistar/oxistar_cubit.dart';
import 'package:bxutility3/src/sensors/view/page/sensors_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

// coverage:ignore-file
final sensorsModule = createModule(
  path: '/sensores',
  register: (i) {
    // Permissão de Bluetooth e atalho para as configurações do celular.
    i.addLazySingleton<HasSensorPermission>(HasSensorPermissionImpl.new);
    i.addLazySingleton<OpenSettings>(OpenSettingsImpl.new);

    // Oxistar (oxímetro): procurar e conectar.
    i.addLazySingleton<ScanSensors>(
      (DeviceManager manager) => ScanSensorsImpl(
        manager: manager,
        oxistarResultMapper: OxistarScanResult.fromResult,
      ),
    );
    i.addLazySingleton<ConnectSensor>(
      (DeviceManager manager) => ConnectSensorImpl(
        manager: manager,
        scheduler: SchedulerTimerImpl.duration(const Duration(seconds: 15)),
      ),
    );

    // Bodystar (posição do corpo): procurar e conectar.
    i.addLazySingleton<ScanBodystars>(
      (DeviceManager manager) => ScanBodystarsImpl(
        manager: manager,
        bodystarResultMapper: BodystarScanResult.fromResult,
      ),
    );
    i.addLazySingleton<ConnectBodystar>(
      (DeviceManager manager) => ConnectBodystarImpl(
        manager: manager,
        scheduler: SchedulerTimerImpl.duration(const Duration(seconds: 15)),
      ),
    );

    // Lê número de série e firmware do sensor depois de conectar (os dois).
    i.addLazySingleton<FetchSensorData>(
      (DeviceManager manager) => FetchSensorDataImpl(
        manager: manager,
        retryDelayed: const RetryDelayed(),
      ),
    );

    i.addLazySingleton<OxistarCubit>(OxistarCubit.new);
    i.addLazySingleton<BodystarCubit>(BodystarCubit.new);

    i.route('/', child: (context, state) => const SensorsPage());
  },
);
