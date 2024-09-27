import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/colors.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  final double? height;

  const FormContainer({super.key, required this.child, this.height = 300});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: ListoMainColors.primary.medium,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SizedBox(
            width: 411,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
