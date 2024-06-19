import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent searchbarAtom(BuildContext context) {
  return WidgetbookComponent(name: "Searchbar", useCases: [
    usercaseWithMarkdown(
      "Default",
      (context) => Center(
          child: ListoSearchAnchor(
        hintText: 'Placeholder',
        onChanged: (String value) {
          // ignore: avoid_print
          print(value);
        },
        onClear: () {},
        onSearch: (String value) {
          // ignore: avoid_print
          print('Search $value');
        },
        enabled: true,
        items: const <String>['Item 1', 'Item 2', 'Item 3'],
      )),
      "markdown/atome_searchbar.md",
    ),
    usercaseWithMarkdown(
      "Disabled",
      (context) => Center(
          child: ListoSearchAnchor(
        enabled: false,
        hintText: 'Placeholder',
        onChanged: (String value) {
          // ignore: avoid_print
          print(value);
        },
        onClear: () {},
        onSearch: (_) {},
      )),
      "markdown/atome_searchbar.md",
    ),
  ]);
}
