import 'package:bxutility3/src/exam/domain/exam_flow.dart';
import 'package:flutter_modular/flutter_modular.dart';

// coverage:ignore-file
/// Rotas do fluxo do Exame do Sono: uma por tela de `examSteps`.
final examModule = createModule(
  path: ExamFlow.basePath,
  register: (i) {
    for (final step in examSteps) {
      i.route('/${step.id}', child: (context, state) => step.page());
    }
  },
);
