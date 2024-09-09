import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

class ButtonPresenter extends StatelessWidget {
  final String title;
  final ButtonType type;
  const ButtonPresenter({
    super.key,
    this.title = "Primary",
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: FormTitle(data: title),
        ),
        Expanded(
          child: Center(
            child: Button(
              style: type,
              image: const Icon(
                Icons.login,
              ),
              width: context.knobs.double.slider(
                  label: "Largeur", initialValue: 200, min: 150, max: 700),
              onPressed: () {},
              enabled: context.knobs.boolean(
                label: "Enabled",
                initialValue: true,
              ),
              text:
                  context.knobs.string(label: "Texte", initialValue: "Button"),
            ),
          ),
        )
      ],
    );
  }
}
