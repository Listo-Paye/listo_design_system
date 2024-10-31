import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'alert.dart';
import 'popin.dart';
import 'profil.dart';
import 'progress_bar.dart';

WidgetbookCategory indicatorsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Indicateurs", children: [
    alertsAtom(context),
    progressBarAtom(context),
    popinAtom(context),
    profilAtom(context),
  ]);
}
