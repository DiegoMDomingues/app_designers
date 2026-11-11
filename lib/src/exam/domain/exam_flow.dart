import 'package:bxutility3/src/exam/domain/exam_scenario.dart';
import 'package:bxutility3/src/exam/view/page/what_to_know_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Uma tela do fluxo do Exame do Sono.
class ExamStep {
  const ExamStep({
    required this.id,
    required this.name,
    required this.page,
    this.showWhen = _always,
  });

  /// Pedaço da rota: a tela abre em `/exame/<id>`.
  final String id;

  /// Nome legível (aparece no atalho "pular para a tela").
  final String name;

  /// A tela em si.
  final Widget Function() page;

  /// Regra de quando a tela entra no fluxo, a partir do cenário.
  final bool Function(ExamScenario scenario) showWhen;

  static bool _always(ExamScenario _) => true;
}

/// O fluxo inteiro, na ordem. Para adicionar uma tela: criar a página em
/// `view/page/` e colocar um `ExamStep` na posição certa desta lista. Telas
/// que só aparecem às vezes ganham um `showWhen`, por exemplo:
/// `showWhen: (s) => s.bateriaBaixa`.
final examSteps = <ExamStep>[
  ExamStep(
    id: WhatToKnowPage.id,
    name: 'O que você precisa saber?',
    page: () => const WhatToKnowPage(),
  ),
];

/// Navegação entre as telas do fluxo, pulando as que não valem no cenário.
abstract final class ExamFlow {
  static const basePath = '/exame';

  /// Abre a primeira tela que vale no cenário atual.
  static void start(BuildContext context) => _openFrom(context, 0);

  /// Abre a próxima tela depois de [currentId] que vale no cenário atual.
  static void next(BuildContext context, String currentId) {
    final index = examSteps.indexWhere((s) => s.id == currentId);
    _openFrom(context, index + 1);
  }

  static void _openFrom(BuildContext context, int startIndex) {
    final scenario = currentExamScenario.value;
    for (var i = startIndex; i < examSteps.length; i++) {
      if (examSteps[i].showWhen(scenario)) {
        context.pushNamed('$basePath/${examSteps[i].id}');
        return;
      }
    }
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Fim do fluxo: próxima tela ainda não feita'),
        ),
      );
  }
}
