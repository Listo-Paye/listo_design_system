import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/layout/cards/components/clientcard_presenter.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent cardsMolecule(BuildContext context) {
  return WidgetbookComponent(name: "Cards", useCases: [
    usercaseWithMarkdown(
      "ClientCard",
      (context) => const ClientCardPresenter(),
      "markdown/card_carteclient.md",
    ),
  ]);
}
