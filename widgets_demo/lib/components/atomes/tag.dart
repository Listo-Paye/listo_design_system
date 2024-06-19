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

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  Tag(
                    type: TagTypes.defaultType,
                    label: 'Default',
                  ),
                  const SizedBox(width: 8),
                  Tag(
                    type: TagTypes.ghost,
                    label: 'Ghost',
                  ),
                  const SizedBox(width: 8),
                  Tag(
                    type: TagTypes.success,
                    label: "Success",
                  ),
                  const SizedBox(width: 8),
                  Tag(
                    type: TagTypes.info,
                    label: "Info",
                  ),
                  const SizedBox(width: 8),
                  Tag(
                    type: TagTypes.danger,
                    label: "Danger",
                  ),
                  const SizedBox(width: 8),
                  Tag(
                    type: TagTypes.warning,
                    label: "Warning",
                  ),
                ],
              ),
            );
          },
          "markdown/atome_tag.md"
      ),
    ],
  );
}