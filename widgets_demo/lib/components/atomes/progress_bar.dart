import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/progress_bar.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../use_case_with_markdown.dart';

WidgetbookComponent progressBarAtom(BuildContext context) {
  return WidgetbookComponent(name: "Progress Bar", useCases: [
    usercaseWithMarkdown(
      "ProgressBar",
      (context) => const ProgressBarPresenter(),
      "markdown/progress_bar.md",
    ),
  ]);
}

class ProgressBarPresenter extends StatelessWidget {
  const ProgressBarPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.knobs.double
        .slider(label: "Progress", min: 0, max: 1, initialValue: 0.5);
    final error = context.knobs.boolean(label: "Error", initialValue: false);
    final backgroundColor = context.knobs.color(
        label: "Background color",
        initialValue: ListoMainColors.neutral.shade100);
    final progressColor = context.knobs.color(
        label: "Progress color",
        initialValue: ListoMainColors.neutral.shade400);
    final errorColor = context.knobs.color(
        label: "Error color", initialValue: ListoMainColors.error.medium);

    return Center(
      child: Column(children: [
        SizedBox(
          width: 352,
          height: 20,
          child: ListoProgressBar(
            progress: progress,
            backgroundColor: backgroundColor,
            progressColor: progressColor,
            errorColor: errorColor,
            error: error,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 352,
          height: 20,
          child: ListoProgressBar(
            backgroundColor: backgroundColor,
            progressColor: progressColor,
            errorColor: errorColor,
            error: error,
          ),
        ),
      ]),
    );
  }
}
