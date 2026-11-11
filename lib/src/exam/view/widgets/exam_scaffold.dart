import 'package:bxutility3/src/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Moldura padrão das telas do fluxo do exame: barra com voltar e título,
/// conteúdo rolável e botão principal fixo embaixo.
class ExamScaffold extends StatelessWidget {
  const ExamScaffold({
    super.key,
    required this.body,
    this.title = 'Exame do Sono Biologix®',
    this.primaryLabel,
    this.onPrimary,
  });

  final String title;
  final Widget body;

  /// Texto do botão de baixo. Sem texto, o botão não aparece.
  final String? primaryLabel;
  final VoidCallback? onPrimary;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.flowBackground,
        appBar: AppBar(
          backgroundColor: AppColors.flowBackground,
          surfaceTintColor: Colors.transparent,
          foregroundColor: AppColors.textPrimary,
          centerTitle: true,
          leading: IconButton(
            tooltip: 'Voltar',
            icon: const Icon(Icons.chevron_left, size: 30),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  child: body,
                ),
              ),
              if (primaryLabel != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: ExamPrimaryButton(
                    label: primaryLabel!,
                    onPressed: onPrimary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Botão verde principal do fluxo.
class ExamPrimaryButton extends StatelessWidget {
  const ExamPrimaryButton({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.onAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        child: Text(label),
      ),
    );
  }
}

/// Item de orientação: ícone num quadradinho, título e texto.
class ExamTipRow extends StatelessWidget {
  const ExamTipRow({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  final IconData icon;
  final String title;

  /// Texto do item. Use [TextSpan] com negrito para destacar trechos.
  final InlineSpan text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 22),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.flowSurface,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, color: AppColors.accent, size: 18),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text.rich(
                text,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13.5,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
