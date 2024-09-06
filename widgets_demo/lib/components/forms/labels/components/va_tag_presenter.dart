import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

import 'container.dart';

class VaTagPresenter extends StatelessWidget {
  const VaTagPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    VaInfoCardType type = context.knobs.list(
      label: "Type",
      options: VaInfoCardType.values,
      initialOption: VaInfoCardType.calculated,
      labelBuilder: (option) => option.name,
    );
    return FormContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          type.toTag(),
          const SizedBox(width: 16),
          type.toTag(large: true),
        ],
      ),
    );
  }
}
