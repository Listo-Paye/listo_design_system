import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ListoProgressBar extends StatelessWidget {
  final double? progress;
  late final Color backgroundColor;
  late final Color progressColor;
  late final Color errorColor;
  final bool error;

  ListoProgressBar({
    super.key,
    this.progress,
    backgroundColor,
    progressColor,
    errorColor,
    this.error = false,
  }) {
    this.backgroundColor = backgroundColor ?? ListoMainColors.neutral.shade100;
    this.progressColor = progressColor ?? ListoMainColors.neutral.shade400;
    this.errorColor = errorColor ?? ListoMainColors.error.medium;
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: backgroundColor,
      valueColor:
          AlwaysStoppedAnimation<Color>(error ? errorColor : progressColor),
      borderRadius: BorderRadius.circular(50),
    );
  }
}


// class TagColors {
//   final Color backgroundColor;
//   final Color textColor;
//
//   const TagColors({required this.backgroundColor, required this.textColor});
// }
//
// enum TagVariant {
//   ghost(
//     TagColors(backgroundColor: Colors.white, textColor: Colors.black),
//   ),
//   defaultt(
//   TagColors(backgroundColor: ListoMainColors.materialColor(), textColor: Color(0xFF424242)),
//   ),
//   danger(
//   TagColors(backgroundColor: Color(0xFFFFCDD2), textColor: Colors.white),
//   );
//
//   final TagColors colors;
//
//   const TagVariant(this.colors);
// }