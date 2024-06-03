
import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/progress_bar.dart';
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
    final progress = context.knobs.double.slider(label: "Progress", min: 0, max: 1, initialValue: 0.5);

    return Center(
      child: ProgressBar(progress: progress),

    );
  }
}