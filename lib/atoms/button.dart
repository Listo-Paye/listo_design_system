import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

enum ButtonType {
  primary,
  secondary,
}

class ButtonStyles {
  static final ButtonStyle primary = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(SepteoColors.blue.shade900),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SepteoSpacings.xs),
      ),
    ),
  );

  static final ButtonStyle secondary = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.white),
    foregroundColor: WidgetStateProperty.all(SepteoColors.blue.shade900),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SepteoSpacings.xs),
      ),
    ),
  );
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
    this.style = ButtonType.primary,
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
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            // style: SepteoTextStyles.headingLargeInter,
          ),
        ),
      ],
    );
  }

  Widget getButton() {
    if (!enabled) {
      return FilledButton(
          onPressed: null,
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all(SepteoColors.grey.shade200),
            foregroundColor:
                WidgetStateProperty.all(SepteoColors.grey.shade400),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SepteoSpacings.xs),
              ),
            ),
          ),
          child: getContent());
    }

    return switch (style) {
      ButtonType.primary => FilledButton(
          onPressed: onPressed,
          style: ButtonStyles.primary,
          child: getContent(),
        ),
      ButtonType.secondary => OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyles.secondary,
          child: getContent(),
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: getButton(),
    );
  }
}
