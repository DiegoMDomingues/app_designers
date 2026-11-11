import 'package:biologix_base_lib/shared/views/styles/blx_colors.dart';
import 'package:flutter/material.dart';

class BLXColorsImpl extends BLXColors {
  const BLXColorsImpl({
    required this.identity,
    required this.accent,
    required this.semantic,
    required this.auxiliary,
    required this.surface,
    required this.content,
    required this.base,
    required this.background,
    required this.isDarkMode,
    required this.shimmer,
  });
  factory BLXColorsImpl.dark() => const BLXColorsImpl(
    identity: BLXColorIdentity(
      container: Color(0xFF00392C),
      onAction: Color(0xFF00634C),
      brand: Color(0xFF009B77),
      action: Color(0xFF00CD9D),
      onContainer: Color(0xFFBFFFF7),
    ),
    accent: BLXColorAccent(
      container: Color(0xFF0F3241),
      onAction: Color(0xFF1D5775),
      brand: Color(0xFF70B7DC),
      action: Color(0xFFA6D2E9),
      onContainer: Color(0xFFDFEDF5),
    ),
    semantic: BLXColorSemantic(
      successText: Color(0xFF56ED94),
      successSurface: Color(0xFF0B5E30),
      informationText: Color(0xFF6DA7F4),
      informationSurface: Color(0xFF164E97),
      warningText: Color(0xFFF7DF65),
      warningSurface: Color(0xFFE1C42B),
      dangerText: Color(0xFFFF9D50),
      dangerSurface: Color(0xFFF7700A),
      errorText: Color(0xFFFB8585),
      errorSurface: Color(0xFF9F1D1D),
    ),
    auxiliary: BLXColorAuxiliary(
      yellow: Color(0xFFE7BD39),
      red: Color(0xFFD36F52),
      violet: Color(0xFF34267A),
      blueOxford: Color(0xFF242738),
      blueOcean: Color(0xFF35217D),
      blueBaby: Color(0xFF92DBE7),
      blueFrancia: Color(0xFF5FB0D4),
      blueSky: Color(0xFF6DE9F7),
    ),
    surface: BLXColorSurface(
      highlight: Color(0xFF111C21),
      hight: Color(0xFF182429),
      medium: Color(0xFF202D33),
      low: Color(0xFF2A3B42),
    ),
    base: BLXColorBase(black: Color(0xFF000000), white: Color(0xFFFFFFFF)),
    content: BLXColorContent(
      highlight: Color(0xFFF1F2F2),
      hight: Color(0xFFE2E6E7),
      medium: Color(0xFFC9D3D6),
      low: Color(0xFFB2C0C3),
    ),
    background: Color(0xFF0A1215),
    shimmer: LinearGradient(
      colors: [Color(0xFF182429), Color(0xFF202D33), Color(0xFF182429)],
      stops: [0.1, 0.3, 0.4],
      begin: Alignment(-1.0, -0.3),
      end: Alignment(1.0, 0.3),
    ),
    isDarkMode: true,
  );

  factory BLXColorsImpl.light() => const BLXColorsImpl(
    identity: BLXColorIdentity(
      container: Color(0xFFBFFFF7),
      onAction: Color(0xFF00CD9D),
      brand: Color(0xFF009B77),
      action: Color(0xFF00634C),
      onContainer: Color(0xFF00392C),
    ),
    accent: BLXColorAccent(
      container: Color(0xFFDFEDF5),
      onAction: Color(0xFFA6D2E9),
      brand: Color(0xFF70B7DC),
      action: Color(0xFF1D5775),
      onContainer: Color(0xFF0F3241),
    ),
    semantic: BLXColorSemantic(
      successText: Color(0xFF0B5E30),
      successSurface: Color(0xFF56ED94),
      informationText: Color(0xFF164E97),
      informationSurface: Color(0xFF6DA7F4),
      warningText: Color(0xFFE1C42B),
      warningSurface: Color(0xFFF7DF65),
      dangerText: Color(0xFFF7700A),
      dangerSurface: Color(0xFFFF9D50),
      errorText: Color(0xFF9F1D1D),
      errorSurface: Color(0xFFFB8585),
    ),
    auxiliary: BLXColorAuxiliary(
      yellow: Color(0xFFE7BD39),
      red: Color(0xFFD36F52),
      violet: Color(0xFF34267A),
      blueOxford: Color(0xFF242738),
      blueOcean: Color(0xFF35217D),
      blueBaby: Color(0xFF92DBE7),
      blueFrancia: Color(0xFF5FB0D4),
      blueSky: Color(0xFF6DE9F7),
    ),
    surface: BLXColorSurface(
      highlight: Color(0xFFF1F2F2),
      hight: Color(0xFFE2E6E7),
      medium: Color(0xFFC9D3D6),
      low: Color(0xFFB2C0C3),
    ),
    base: BLXColorBase(black: Color(0xFFFFFFFF), white: Color(0xFF000000)),
    content: BLXColorContent(
      highlight: Color(0xFF111C21),
      hight: Color(0xFF182429),
      medium: Color(0xFF202D33),
      low: Color(0xFF2A3B42),
    ),
    background: Color(0xFFFEFAFA),
    shimmer: LinearGradient(
      colors: [Color(0xFFE2E6E7), Color(0xFFF1F2F2), Color(0xFFE2E6E7)],
      stops: [0.1, 0.3, 0.4],
      begin: Alignment(-1.0, -0.3),
      end: Alignment(1.0, 0.3),
    ),
    isDarkMode: false,
  );

  @override
  final BLXColorIdentity identity;
  @override
  final BLXColorAccent accent;
  @override
  final BLXColorSemantic semantic;
  @override
  final BLXColorAuxiliary auxiliary;
  @override
  final BLXColorSurface surface;
  @override
  final BLXColorContent content;
  @override
  final BLXColorBase base;
  @override
  final Color background;
  @override
  final bool isDarkMode;
  @override
  final LinearGradient shimmer;

  @override
  BLXColorChart get chart => const BLXColorChart(
    mild: Color(0xFF2181FF),
    normal: Color(0xFF16CB33),
    moderate: Color(0xFFF3CC03),
    risk: Color(0xFFF7700A),
    severe: Color(0xFFFF2B2B),
  );

  @override
  Gradient get shadow => const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0xFF0C1015), Color.fromARGB(0, 12, 16, 21)],
  );
  @override
  MaterialColor get neutral => const MaterialColor(0xFF6D6D6C, <int, Color>{
    100: Color(0xFFF1F2F2),
    200: Color(0xFFE2E6E7),
    300: Color(0xFFC9D3D6),
    400: Color(0xFFB2C0C3),
    500: Color(0xFF67787E),
    600: Color(0xFF2A3B42),
    700: Color(0xFF202D33),
    800: Color(0xFF182429),
    900: Color(0xFF111C21),
  });
}
