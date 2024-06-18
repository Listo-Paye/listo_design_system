import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/tag.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

const int _bluePrimaryValue = 0xFF2196F3;
const MaterialColor customBlue = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);

WidgetbookComponent tagAtom(BuildContext context) {
  return WidgetbookComponent(
    name: 'Tag',
    useCases: [
      usercaseWithMarkdown(
          'Tag',
              (context) {
            // Ajout des knobs pour la couleur et le texte
            final backgroundColor = context.knobs.color(
              label: 'Background Color',
              initialValue: customBlue,
            );
            final textColor = context.knobs.color(
              label: 'Text Color',
              initialValue: customBlue,
            );
            final label = context.knobs.string(
              label: 'Text',
              initialValue: 'Tag',
            );

            return Center(
              child: Tag(
                backgroundColor: MaterialColor(
                  backgroundColor.value,
                  {
                    50: backgroundColor.withOpacity(0.1),
                    100: backgroundColor.withOpacity(0.2),
                    200: backgroundColor.withOpacity(0.3),
                    300: backgroundColor.withOpacity(0.4),
                    400: backgroundColor.withOpacity(0.5),
                    500: backgroundColor,
                    600: backgroundColor.withOpacity(0.7),
                    700: backgroundColor.withOpacity(0.8),
                    800: backgroundColor.withOpacity(0.9),
                    900: backgroundColor.withOpacity(1.0),
                  },
                ),
                textColor: MaterialColor(
                  textColor.value,
                  {
                    50: textColor.withOpacity(0.1),
                    100: textColor.withOpacity(0.2),
                    200: textColor.withOpacity(0.3),
                    300: textColor.withOpacity(0.4),
                    400: textColor.withOpacity(0.5),
                    500: textColor,
                    600: textColor.withOpacity(0.7),
                    700: textColor.withOpacity(0.8),
                    800: textColor.withOpacity(0.9),
                    900: textColor.withOpacity(1.0),
                  },
                ),
                label: label,
              ),
            );
          },
          "markdown/atome_tag.md"
      ),
    ],
  );
}