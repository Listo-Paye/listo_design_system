import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

class TriStateCheckboxDemo extends StatefulWidget {
  const TriStateCheckboxDemo({Key? key}) : super(key: key);

  @override
  TriStateCheckboxDemoState createState() => TriStateCheckboxDemoState();
}

class TriStateCheckboxDemoState extends State<TriStateCheckboxDemo> {
  bool? checkboxValue1 = false;
  bool? checkboxValue2;
  bool? checkboxValue3 = true;
  bool? checkboxValue4 = false;

  // Fonctions de mise à jour pour chaque CheckBox
  void onCheckboxChanged1(bool? newValue) {
    setState(() {
      checkboxValue1 = newValue;
    });
  }

  void onCheckboxChanged2(bool? newValue) {
    setState(() {
      checkboxValue2 = newValue;
    });
  }

  void onCheckboxChanged3(bool? newValue) {
    setState(() {
      checkboxValue3 = newValue;
    });
  }

  void onCheckboxChanged4(bool? newValue) {
    setState(() {
      checkboxValue4 = newValue;
    });
  }

  void resetCheckboxValue4() {
    setState(() {
      checkboxValue4 = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Usage à 2 états:  '),
        // Première CheckBox
        CheckBox(
          value: checkboxValue1,
          onChanged: onCheckboxChanged1,
        ),
        const SizedBox(width: 16),
        // Deuxième CheckBox
        CheckBox(
          value: checkboxValue2,
          onChanged: onCheckboxChanged2,
        ),
        const SizedBox(width: 16),
        // Troisième CheckBox
        CheckBox(
          value: checkboxValue3,
          onChanged: onCheckboxChanged3,
        ),
        const SizedBox(width: 16),
        // Quatrième CheckBox avec bouton de réinitialisation
        Text('Usage à 3 états:  '),
        CheckBox(
          value: checkboxValue4,
          onChanged: onCheckboxChanged4,
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: resetCheckboxValue4,
          child: const Text('Réinitialiser  à null'),
        ),
      ],
    );
  }
}

WidgetbookComponent checkbox(BuildContext context) {
  return WidgetbookComponent(
    name: "CheckBoxs",
    useCases: [
      usercaseWithMarkdown(
        "CheckBox",
        (context) {
          return const TriStateCheckboxDemo();
        },
        "markdown/checkbox.md",
      ),
    ],
  );
}
