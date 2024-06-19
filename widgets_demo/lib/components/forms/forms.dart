import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'components/button.dart';
import 'components/searchbar.dart';

WidgetbookCategory formsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Formulaires", children: [
    searchbarAtom(context),
    buttonsAtom(context),
  ]);
}
