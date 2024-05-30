import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/colors.dart';

enum ButtonType {
  filled,
}

class Button extends StatelessWidget {
  final String text;
  final Icon? image;
  final ButtonType style;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final bool enabled;

  const Button({
    super.key,
    this.style = ButtonType.filled,
    required this.onPressed,
    this.width,
    this.height,
    this.enabled = true,
    required this.text,
    this.image,
  });

  Widget getContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (image != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: image,
          ),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var onPressedOrNull = enabled ? onPressed : null;
    return SizedBox(
      width: width,
      height: height,
      child: switch (style) {
        ButtonType.filled => FilledButton(
            onPressed: onPressedOrNull,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith(
                (states) => enabled
                    ? ListoMainColors.primary.base
                    : ListoMainColors.neutral.shade200,
              ),
              foregroundColor: WidgetStateProperty.all(Colors.white),
            ),
            child: getContent(),
          ),
      },
    );
  }
}
