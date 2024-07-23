import 'package:flutter/cupertino.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

import 'components/cardlist_presenter.dart';
import 'components/clientcard_presenter.dart';
import 'components/va_info_card_presenter.dart';

WidgetbookComponent cardsMolecule(BuildContext context) {
  return WidgetbookComponent(name: "Cards", useCases: [
    usercaseWithMarkdown(
      "Card List",
      (context) => Container(
          decoration: BoxDecoration(
            color: ListoMainColors.primary.medium,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
              child: SizedBox(
            width: 411,
            child: CardlistPresenter(),
          ))),
      "markdown/card_list.md",
    ),
    usercaseWithMarkdown(
      "Client Card",
      (context) => const ClientCardPresenter(),
      "markdown/card_carteclient.md",
    ),
    usercaseWithMarkdown(
      "VA Info Card",
      (context) => const VaInfoCardPresenter(),
      "markdown/card_va_info_card.md",
    ),
  ]);
}
