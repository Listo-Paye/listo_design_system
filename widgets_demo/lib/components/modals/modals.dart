import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/modals/modal_presenter.dart';

WidgetbookCategory dialogsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Dialogs", children: [
    confirmationModalComponent(context),
  ]);
}
