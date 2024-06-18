import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/tag.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent tagAtom(BuildContext context) {
  return WidgetbookComponent(
    name: 'Tag',
    useCases: [
      usercaseWithMarkdown(
          'Tag',
              (context) {
            final label = context.knobs.string(
              label: 'Text',
              initialValue: 'Tag',
            );

            return Center(
              child: Tag(
                backgroundColor: Colors.blue,
                textColor: Colors.blue,
                label: label,
              ),
            );
          },
          "markdown/atome_tag.md"
      ),
    ],
  );
}