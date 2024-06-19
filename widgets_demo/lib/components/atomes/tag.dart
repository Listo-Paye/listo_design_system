import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/tag.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent tagAtom(BuildContext context) {
  return WidgetbookComponent(
    name: 'Tag',
    useCases: [
      usercaseWithMarkdown('Tag', (context) {
        final label = context.knobs.string(
          label: 'Text',
          initialValue: 'Tag',
        );

        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tag(
                type: TagColors.base,
                label: 'Base',
              ),
              SizedBox(width: 8),
              Tag(
                type: TagColors.ghost,
                label: 'Ghost',
              ),
              SizedBox(width: 8),
              Tag(
                type: TagColors.success,
                label: "Success",
              ),
              SizedBox(width: 8),
              Tag(
                type: TagColors.info,
                label: "Info",
              ),
              SizedBox(width: 8),
              Tag(
                type: TagColors.danger,
                label: "Danger",
              ),
              SizedBox(width: 8),
              Tag(
                type: TagColors.warning,
                label: "Warning",
              ),
            ],
          ),
        );
      }, "markdown/atome_tag.md"),
    ],
  );
}
