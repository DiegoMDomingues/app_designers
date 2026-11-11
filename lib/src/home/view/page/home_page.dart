import 'package:bxutility3/src/exam/domain/exam_flow.dart';
import 'package:bxutility3/src/home/domain/home_mock.dart';
import 'package:bxutility3/src/shared/utils/app_colors.dart';
import 'package:bxutility3/src/home/view/widgets/home_header.dart';
import 'package:bxutility3/src/home/view/widgets/home_menu_card.dart';
import 'package:bxutility3/src/home/view/widgets/last_exam_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Tela inicial no estilo do app do paciente: topo verde com saudação, lista
/// de atalhos e carrossel dos últimos exames.
///
/// Os dados são de mentira (ver home_mock.dart). "Exame do Sono" abre o fluxo
/// do exame e "Oxímetro" a tela de sensores; os outros mostram "Em breve".
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _sidePadding = 20.0;

  void _open(BuildContext context, String? route) {
    if (route == ExamFlow.basePath) {
      ExamFlow.start(context); // primeira tela que vale no cenário atual
      return;
    }
    if (route != null) {
      context.pushNamed(route);
      return;
    }
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Em breve')));
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTop(context, topInset),
              // Carrossel: vai de ponta a ponta da tela.
              SizedBox(
                height: 126,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: _sidePadding),
                  itemCount: mockExams.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 14),
                  itemBuilder: (context, i) => SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: LastExamCard(
                      exam: mockExams[i],
                      onTap: () => _open(context, null),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32 + MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTop(BuildContext context, double topInset) {
    return Stack(
      children: [
        // Faixa verde do topo. Vai até a metade do primeiro cartão.
        Container(height: topInset + 200, color: AppColors.header),
        Padding(
          padding: EdgeInsets.fromLTRB(
            _sidePadding,
            topInset + 16,
            _sidePadding,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HomeHeader(
                userName: mockUserName,
                userInitials: mockUserInitials,
                hasNotification: true,
                onHelp: () => _open(context, null),
                onSensor: () => _open(context, '/sensores'),
                onNotifications: () => _open(context, null),
                onProfile: () => _open(context, null),
              ),
              const SizedBox(height: 22),
              for (final item in mockMenu) ...[
                HomeMenuCard(
                  icon: item.icon,
                  title: item.title,
                  subtitle: item.subtitle,
                  onTap: () => _open(context, item.route),
                ),
                const SizedBox(height: 14),
              ],
              const SizedBox(height: 10),
              const Text(
                'ÚLTIMOS EXAMES',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 14,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ],
    );
  }
}
