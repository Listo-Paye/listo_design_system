import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/cards_v2/client_card_v2.dart';

WidgetbookCategory cardsV2Category(BuildContext context) {
  return WidgetbookCategory(name: "Cards V2", children: [
    clientCardV2(context),
  ]);
}
