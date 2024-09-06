import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/forms/labels/components/container.dart';

class TitleLabelPresenter extends StatelessWidget {
  const TitleLabelPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      child: FormTitle(
        data: context.knobs.string(
          label: "Titre",
          initialValue: "Titre",
        ),
      ),
    );
  }
}
