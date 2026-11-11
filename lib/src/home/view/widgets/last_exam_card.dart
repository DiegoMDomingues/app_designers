import 'dart:math' as math;

import 'package:bxutility3/src/home/domain/home_mock.dart';
import 'package:bxutility3/src/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

/// Cartão do carrossel "Últimos exames": medidor do IAH, data, tipo, idade e
/// IMC.
class LastExamCard extends StatelessWidget {
  const LastExamCard({super.key, required this.exam, this.onTap});

  final ExamPreview exam;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 12, 18),
          child: Row(
            children: [
              IahGauge(value: exam.iah),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      formatExamDate(exam.date),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      exam.type,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.account_circle_outlined,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text('${exam.age} anos', style: _detailStyle),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('•', style: _detailStyle),
                        ),
                        const Icon(
                          Icons.speed,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text('${exam.bmi} IMC', style: _detailStyle),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.textSecondary,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const _detailStyle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 15,
  );
}

/// Medidor circular do IAH, colorido pela gravidade.
class IahGauge extends StatelessWidget {
  const IahGauge({super.key, required this.value, this.size = 58});

  final double value;
  final double size;

  /// IAH em que o arco fica cheio.
  static const maxValue = 50.0;

  static Color colorFor(double iah) {
    if (iah >= 30) return AppColors.severe;
    if (iah >= 15) return AppColors.moderate;
    if (iah >= 5) return AppColors.mild;
    return AppColors.normal;
  }

  @override
  Widget build(BuildContext context) {
    final label = value.toStringAsFixed(1).replaceAll('.', ',');
    return Semantics(
      label: 'IAH $label',
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _GaugePainter(
            fraction: (value / maxValue).clamp(0.02, 1.0),
            color: colorFor(value),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  _GaugePainter({required this.fraction, required this.color});

  final double fraction;
  final Color color;

  // Arco de 270 graus, aberto embaixo.
  static const _start = math.pi * 0.75;
  static const _sweep = math.pi * 1.5;
  static const _stroke = 7.0;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final arcRect = rect.deflate(_stroke / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      arcRect,
      _start,
      _sweep,
      false,
      paint..color = AppColors.gaugeTrack,
    );
    canvas.drawArc(
      arcRect,
      _start,
      _sweep * fraction,
      false,
      paint..color = color,
    );
  }

  @override
  bool shouldRepaint(_GaugePainter old) =>
      old.fraction != fraction || old.color != color;
}

const _weekdays = ['Seg.', 'Ter.', 'Qua.', 'Qui.', 'Sex.', 'Sáb.', 'Dom.'];
const _months = [
  'Janeiro',
  'Fevereiro',
  'Março',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro',
];

/// "Qui. 25 Janeiro 2024".
String formatExamDate(DateTime d) =>
    '${_weekdays[d.weekday - 1]} ${d.day} ${_months[d.month - 1]} ${d.year}';
