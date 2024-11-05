import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/atoms_module.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../use_case_with_markdown.dart';

WidgetbookComponent profilAtom(BuildContext context) {
  return WidgetbookComponent(name: "Profil", useCases: [
    usercaseWithMarkdown(
      "Profil",
      (context) => const PopinPresenter(),
      "markdown/atome_profil.md",
    ),
  ]);
}

class PopinPresenter extends StatelessWidget {
  const PopinPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Profil(
      label: "admin",
      // ignore: avoid_print
      onHelp: () => print("help"),
      // ignore: avoid_print
      onLogout: () => print("profil"),
      email: 'john.doe@septeo.com',
    );
  }
}
