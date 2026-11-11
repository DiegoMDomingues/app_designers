import 'package:flutter/painting.dart';

/// Cores das telas novas (home, exame). Mude aqui para testar outras paletas.
abstract final class AppColors {
  /// Fundo da tela.
  static const background = Color(0xFF0F181E);

  /// Faixa verde do topo (atrás do logo e da saudação).
  static const header = Color(0xFF053B2E);

  /// Fundo dos cartões.
  static const card = Color(0xFF18232A);

  /// Verde de destaque (ícones, avisos).
  static const accent = Color(0xFF1FD39B);

  /// Texto e ícone em cima do verde de destaque (botão principal).
  static const onAccent = Color(0xFF0F181E);

  /// Fundo das telas do fluxo do exame (um pouco mais escuro que a home).
  static const flowBackground = Color(0xFF0B1216);

  /// Fundo dos quadradinhos de ícone e dos banners no fluxo do exame.
  static const flowSurface = Color(0xFF152026);

  /// Fundo do círculo com as iniciais.
  static const avatar = Color(0xFF0B5E47);

  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFD3DADD);
  static const textMuted = Color(0xFFA9B4BA);

  /// Trilho cinza do medidor de IAH.
  static const gaugeTrack = Color(0xFF2A363D);

  /// Cores do IAH por gravidade.
  static const severe = Color(0xFFF2312B);
  static const moderate = Color(0xFFF28B2B);
  static const mild = Color(0xFFF2C12B);
  static const normal = Color(0xFF2BC93E);
}
