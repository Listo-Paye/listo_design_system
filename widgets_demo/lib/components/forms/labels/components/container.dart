import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

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
          color: SepteoColors.blue.shade300,
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
