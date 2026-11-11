import 'package:bxutility3/src/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Topo da tela inicial: logo, atalhos (ajuda, sensor, avisos, perfil) e a
/// saudação.
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.userName,
    required this.userInitials,
    this.hasNotification = false,
    this.onHelp,
    this.onSensor,
    this.onNotifications,
    this.onProfile,
  });

  final String userName;
  final String userInitials;
  final bool hasNotification;
  final VoidCallback? onHelp;
  final VoidCallback? onSensor;
  final VoidCallback? onNotifications;
  final VoidCallback? onProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/logo/logo_white.svg',
              height: 30,
              semanticsLabel: 'Biologix',
            ),
            const Spacer(),
            _HeaderButton(
              tooltip: 'Ajuda',
              onTap: onHelp,
              child: const Icon(
                Icons.help_outline,
                color: AppColors.textPrimary,
                size: 30,
              ),
            ),
            _HeaderButton(
              tooltip: 'Sensor',
              onTap: onSensor,
              child: const _SensorGlyph(),
            ),
            _HeaderButton(
              tooltip: 'Avisos',
              onTap: onNotifications,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(
                    Icons.notifications_none,
                    color: AppColors.textPrimary,
                    size: 30,
                  ),
                  if (hasNotification)
                    Positioned(
                      right: -1,
                      top: -1,
                      child: Container(
                        width: 11,
                        height: 11,
                        decoration: const BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Semantics(
              button: true,
              label: 'Perfil',
              child: GestureDetector(
                onTap: onProfile,
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: AppColors.avatar,
                  child: Text(
                    userInitials,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Text(
          'Olá, $userName',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({required this.tooltip, required this.child, this.onTap});

  final String tooltip;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onTap,
      icon: child,
      padding: const EdgeInsets.all(10),
    );
  }
}

/// Desenho simples do sensor Oxistar (cápsula com um traço no meio).
class _SensorGlyph extends StatelessWidget {
  const _SensorGlyph();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 26,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textPrimary, width: 2.2),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: const Alignment(0, -0.45),
      child: Container(
        width: 2.2,
        height: 6,
        decoration: BoxDecoration(
          color: AppColors.textPrimary,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
