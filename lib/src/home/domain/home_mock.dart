import 'package:flutter/material.dart';

/// Dados de mentira para desenhar a tela inicial. Nada aqui é de paciente real.

const mockUserName = 'José';
const mockUserInitials = 'JS';

/// Um atalho da lista principal.
class HomeMenuItem {
  const HomeMenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.route,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  /// Tela que abre ao tocar. Sem rota, mostra "Em breve".
  final String? route;
}

const mockMenu = [
  HomeMenuItem(
    icon: Icons.touch_app,
    title: 'Exame do Sono Biologix®',
    subtitle: 'Exame de apneia do sono completo com avaliação do ronco',
    route: '/exame',
  ),
  HomeMenuItem(
    icon: Icons.record_voice_over,
    title: 'Teste do Ronco Biologix®',
    subtitle: 'Teste simplificado de avaliação do ronco',
  ),
  HomeMenuItem(
    icon: Icons.bar_chart,
    title: 'Resultados',
    subtitle: 'Veja e compartilhe os resultados dos exames.',
  ),
  HomeMenuItem(
    icon: Icons.monitor_heart,
    title: 'Oxímetro',
    subtitle: 'Utilize o sensor Oxistar® como um oxímetro convencional',
    route: '/sensores',
  ),
  HomeMenuItem(
    icon: Icons.file_copy,
    title: 'Questionário de sono',
    subtitle: 'Informações úteis para você e seu profissional de saúde',
  ),
];

/// Resumo de um exame para o carrossel "Últimos exames".
class ExamPreview {
  const ExamPreview({
    required this.date,
    required this.type,
    required this.iah,
    required this.age,
    required this.bmi,
  });

  final DateTime date;
  final String type;

  /// Índice de apneia e hipopneia (eventos por hora).
  final double iah;
  final int age;
  final int bmi;
}

final mockExams = [
  ExamPreview(
    date: DateTime(2024, 1, 25),
    type: 'Exame do Sono',
    iah: 38.5,
    age: 45,
    bmi: 24,
  ),
  ExamPreview(
    date: DateTime(2023, 8, 12),
    type: 'Exame do Sono',
    iah: 3.6,
    age: 44,
    bmi: 25,
  ),
  ExamPreview(
    date: DateTime(2023, 2, 3),
    type: 'Teste do Ronco',
    iah: 12.1,
    age: 44,
    bmi: 26,
  ),
];
