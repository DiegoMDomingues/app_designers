import 'dart:async';

import 'package:biologix_base_lib/shared/utils/blx_logger.dart';
import 'package:bxutility3/i18n/strings.g.dart';
import 'package:bxutility3/src/app_module.dart';
import 'package:bxutility3/src/app_widget.dart';
import 'package:bxutility3/src/shared/firebase_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      LocaleSettings.useDeviceLocale(); //Set system default language
      await initFirebaseLocal(); // precisa vir antes de qualquer blxLogger

      // Pass all uncaught errors from the framework to BlxLogger.
      FlutterError.onError = (flutterDetails) {
        blxLogger.error(
          'Method "main" caught an unhandled Flutter error',
          error: flutterDetails.exception,
          stackTrace: flutterDetails.stack,
          detail: flutterDetails.summary.toDescription(),
        );
      };

      // Native UI configuration
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      runApp(
        ResponsiveSizer(
          builder: (context, orientation, deviceType) {
            return TranslationProvider(
              child: ModularApp(
                module: appModule,
                defaultTransition: CustomTransition(
                  duration: const Duration(milliseconds: 150),
                  transitionsBuilder: (_, animation, _, child) =>
                      FadeTransition(opacity: animation, child: child),
                ),
                child: const AppWidget(),
              ),
            );
          },
        ),
      );
    },
    (error, stack) {
      if (error is Error) {
        blxLogger.fatal(
          'Method "main" caught a fatal error.',
          error: error,
          stackTrace: stack,
        );
      } else {
        blxLogger.error(
          'Method "main" caught an unhandled exception.',
          error: error,
          stackTrace: stack,
        );
      }
    },
  );
}
