import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/button.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../../use_case_with_markdown.dart';

WidgetbookComponent buttonsAtom(BuildContext context) {
  return WidgetbookComponent(name: "Boutons", useCases: [
    usercaseWithMarkdown(
      "Default",
      (context) => Center(
          child: Button(
              image: const Icon(
                Icons.login,
                color: Colors.white,
              ),
              width: context.knobs.double.slider(
                  label: "Largeur", initialValue: 200, min: 50, max: 500),
              onPressed: () {},
              enabled: context.knobs.boolean(
                label: "Enabled",
                initialValue: true,
              ),
              text: context.knobs
                  .string(label: "Texte", initialValue: "Button"))),
      "markdown/atome_button.md",
    ),
  ]);
}
