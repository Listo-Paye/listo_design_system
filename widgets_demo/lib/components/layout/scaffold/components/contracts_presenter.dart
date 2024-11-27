import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

import 'scaffold_presenter.dart';

class ContractsSelectorPresenter extends StatelessWidget {
  const ContractsSelectorPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    int delay = context.knobs.int
        .slider(label: "Delay", min: 0, max: 5000, initialValue: 1000);
    var key = GlobalKey<DashboardDesktopState>();
    var contractsKey = GlobalKey<ContractsSelectorState>();
    Future.delayed(Duration(milliseconds: delay), () {
      contractsKey.currentState?.setElements([
        ContractVisualElement(
          titre: "Contrat 1",
          soustitre: "Sous-titre 1",
          details: "Détails 1",
        ),
      ]);
    });
    return PresenterScaffold(
      child: DashboardDesktop(
        key: key,
        selector: ContractsSelector(
          nom: "contrats",
          key: contractsKey,
        ),
        initialFrame: Container(
          color: SepteoColors.orange.shade300,
        ),
      ),
    );
  }
}
