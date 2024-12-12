import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/status/service_status/service_status.dart';

WidgetbookCategory statusServiceCategory(BuildContext context) {
  return WidgetbookCategory(name: "Environment", children: [
    statusService(context),
  ]);
}
