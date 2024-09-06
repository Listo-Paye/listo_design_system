import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/atoms_module.dart';
import 'package:widgetbook/widgetbook.dart';

import 'container.dart';

class AmountTitlePresenter extends StatelessWidget {
  const AmountTitlePresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      child: AmountTitle(
        amount: context.knobs.double.input(
          label: "Montant",
          initialValue: 3864,
        ),
      ),
    );
  }
}
