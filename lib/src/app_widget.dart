import 'package:biologix_base_lib/shared/utils/base_lib_locale.dart';
import 'package:biologix_base_lib/shared/utils/blx_scroll_behavior.dart';
import 'package:biologix_base_lib/shared/utils/environment.dart';
import 'package:biologix_base_lib/shared/utils/theme_notifier.dart';
import 'package:biologix_base_lib/shared/views/styles/blx_colors.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_application.dart';
import 'package:bxutility3/i18n/strings.g.dart';
import 'package:bxutility3/src/shared/utils/blx_colors_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart' show ModularApp;
import 'package:provider/provider.dart';

// coverage:ignore-file
class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();

    // Set locale to baselib
    BaseLibLocale.setLocale(LocaleSettings.currentLocale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, theme, child) {
          final BLXColors colorsTheme = theme.isDarkMode
              ? BLXColorsImpl.dark()
              : BLXColorsImpl.light();
          return MaterialApp.router(
            routerConfig: ModularApp.routerConfigOf(context),
            builder: (context, router) {
              return BLXApplication(
                colors: colorsTheme,
                environment: Environment.prod,
                child: router ?? const SizedBox.shrink(),
              );
            },
            title: t.app,
            scrollBehavior: BLXScrollBehavior(),
            theme: ThemeData(
              splashColor: colorsTheme.content.medium.withValues(alpha: 0.15),
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: colorsTheme.identity.action,
                primary: colorsTheme.identity.action,
              ),
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: colorsTheme.surface.highlight,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28.0),
                  ),
                ),
              ),
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  // Set the predictive back transitions for Android.
                  TargetPlatform.android:
                      PredictiveBackPageTransitionsBuilder(),
                },
              ),
            ),
            darkTheme: ThemeData(
              splashColor: colorsTheme.content.medium.withValues(alpha: 0.15),
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: colorsTheme.identity.action,
                brightness: Brightness.dark,
                primary: colorsTheme.identity.action,
              ),
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: colorsTheme.surface.highlight,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28.0),
                  ),
                ),
              ),
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  // Set the predictive back transitions for Android.
                  TargetPlatform.android:
                      PredictiveBackPageTransitionsBuilder(),
                },
              ),
            ),
            themeMode: theme.themeMode,
            locale: TranslationProvider.of(
              context,
            ).flutterLocale, // use provider
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
          );
        },
      ),
    );
  }
}
