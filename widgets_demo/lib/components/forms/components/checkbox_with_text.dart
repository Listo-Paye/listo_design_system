import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class CheckBoxWithTextPresenter extends StatefulWidget {
  const CheckBoxWithTextPresenter({super.key});

  @override
  CheckBoxWithTextPresenterState createState() =>
      CheckBoxWithTextPresenterState();
}

class CheckBoxWithTextPresenterState extends State<CheckBoxWithTextPresenter> {
  bool checkboxValue1 = false;
  bool? checkboxValue2;
  bool checkboxValue3 = true;

  void _onCheckboxChanged1(bool? newValue) {
    if (newValue != null) {
      setState(() {
        checkboxValue1 = newValue;
      });
    }
  }

  void _onCheckboxChanged2(bool? newValue) {
    setState(() {
      checkboxValue2 = newValue;
    });
  }

  void _onCheckboxChanged3(bool? newValue) {
    if (newValue != null) {
      setState(() {
        checkboxValue3 = newValue;
      });
    }
  }

  void _resetCheckboxValue2() {
    setState(() {
      checkboxValue2 = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth * 0.5,
            child: Column(
              children: [
                CheckBoxWithText(
                  value: checkboxValue1,
                  onChanged: _onCheckboxChanged1,
                  text: 'CheckBox 1 (initialement false)',
                ),
                SizedBox(height: SepteoSpacings.lg),
                Row(
                  children: [
                    Expanded(
                      child: CheckBoxWithText(
                        value: checkboxValue2,
                        onChanged: _onCheckboxChanged2,
                        text: 'CheckBox 2 (initialement null)',
                      ),
                    ),
                    SizedBox(width: SepteoSpacings.sm),
                    ElevatedButton(
                      onPressed: _resetCheckboxValue2,
                      child: const Text('Repasser la valeur à null'),
                    ),
                  ],
                ),
                SizedBox(height: SepteoSpacings.lg),
                CheckBoxWithText(
                  value: checkboxValue3,
                  onChanged: _onCheckboxChanged3,
                  text: 'CheckBox 3 (initialement true)',
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}
