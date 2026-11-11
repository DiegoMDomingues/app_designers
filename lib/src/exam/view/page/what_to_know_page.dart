import 'package:bxutility3/src/exam/domain/exam_flow.dart';
import 'package:bxutility3/src/exam/view/widgets/exam_scaffold.dart';
import 'package:bxutility3/src/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

/// Tela 1 do fluxo (entra sempre): cuidados antes do exame.
class WhatToKnowPage extends StatelessWidget {
  const WhatToKnowPage({super.key});

  static const id = 'o-que-saber';

  static const _bold = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  @override
  Widget build(BuildContext context) {
    return ExamScaffold(
      primaryLabel: 'Continuar para o preparo',
      onPrimary: () => ExamFlow.next(context, id),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _VideoBanner(
            onTap: () => ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(content: Text('Em breve'))),
          ),
          const SizedBox(height: 28),
          const Text(
            'O que você precisa saber?',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Cuidados para realizar o exame com tranquilidade:',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14.5),
          ),
          const SizedBox(height: 8),
          const ExamTipRow(
            icon: Icons.nightlight_round,
            title: 'Durma como de costume',
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      'Mantenha seu horário habitual. Você precisa dormir '
                      'pelo menos ',
                ),
                TextSpan(text: '4 horas', style: _bold),
                TextSpan(text: ' para gerar o resultado.'),
              ],
            ),
          ),
          const ExamTipRow(
            icon: Icons.mobile_screen_share,
            title: 'Deixe o carregador por perto',
            text: TextSpan(
              text:
                  'A gravação pode consumir bastante bateria. Deixe o celular '
                  'conectado durante o exame.',
            ),
          ),
          const ExamTipRow(
            icon: Icons.directions_walk,
            title: 'Precisou levantar?',
            text: TextSpan(
              text:
                  'Sem problemas! Retire o sensor e coloque-o novamente ao '
                  'voltar. O exame segue normalmente.',
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoBanner extends StatelessWidget {
  const _VideoBanner({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.flowSurface,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Row(
            children: [
              Icon(
                Icons.play_circle_outline,
                color: AppColors.accent,
                size: 24,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Assista ao vídeo sobre o exame',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
