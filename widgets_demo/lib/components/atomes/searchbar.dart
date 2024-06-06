import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/search/search_anchor.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../use_case_with_markdown.dart';

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
