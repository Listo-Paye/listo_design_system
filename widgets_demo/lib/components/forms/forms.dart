import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'components/saisie.dart';
import 'labels/components/all_in_one.dart';
import 'labels/labels.dart';
import 'tables_and_lists/tables_and_lists.dart';
import 'upload/upload.dart';

WidgetbookCategory formsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Formulaires", children: [
    uploadComponent(context),
    searchbarAtom(context),
    labelsMolecule(context),
    tablesAndListsMolecule(context),
    allInOneComponent(context),
  ]);
}
