import 'package:flutter/foundation.dart';

/// Situação simulada do paciente e do celular durante o exame.
///
/// Cada condição liga ou desliga telas do fluxo (ver exam_flow.dart). Para
/// criar uma condição nova: adicionar o campo aqui, no `copyWith` e, se fizer
/// sentido, num dos cenários prontos em `examScenarios`.
@immutable
class ExamScenario {
  const ExamScenario({required this.name, this.description = ''});

  /// Nome que aparece no seletor de cenários.
  final String name;

  /// Explicação curta do que o cenário simula.
  final String description;

  // Condições: vão entrando aqui conforme as telas condicionais chegam.

  ExamScenario copyWith({String? name, String? description}) {
    return ExamScenario(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}

/// Cenários prontos, para testar e demonstrar o fluxo.
const examScenarios = [
  ExamScenario(
    name: 'Padrão',
    description: 'Caminho feliz: nenhuma tela de exceção aparece.',
  ),
];

/// Cenário em uso agora. As telas leem daqui para decidir o que mostrar.
final currentExamScenario = ValueNotifier<ExamScenario>(examScenarios.first);
