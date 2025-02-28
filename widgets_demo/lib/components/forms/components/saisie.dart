import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/forms/components/components/input_presenter.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

import 'components/dss_button_presenter.dart';

WidgetbookComponent searchbarAtom(BuildContext context) {
  return WidgetbookComponent(name: "Saisie", useCases: [
    usercaseWithMarkdown(
      "Searchbar",
      (context) => Center(
          child: ListoSearchAnchor(
        hintText: 'Placeholder',
        enabled: context.knobs.boolean(
          label: "Enabled",
          initialValue: true,
        ),
        onChanged: (String value) {
          // ignore: avoid_print
          print(value);
        },
        onClear: () {},
        onSearch: (String value) {
          // ignore: avoid_print
          print('Search $value');
        },
        items: const <String>['Item 1', 'Item 2', 'Item 3'],
      )),
      "markdown/atome_searchbar.md",
    ),
    usercaseWithMarkdown(
      "Boutons",
      (context) => const DSSButtonPresenter(),
      "markdown/dss_button.md",
    ),
    usercaseWithMarkdown(
      "Saisie de texte",
      (context) => const InputPresenter(),
      "markdown/form_input.md",
    ),
  ]);
}
