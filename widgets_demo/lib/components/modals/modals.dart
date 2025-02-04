import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/modals/modal_presenter.dart';

WidgetbookCategory mmodalsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Modales", children: [
    confirmationModalComponent(context),
  ]);
}
