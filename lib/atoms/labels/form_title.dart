import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class FormTitle extends StatelessWidget {
  final String data;

  const FormTitle({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: SepteoTextStyles.bodyLargeInter);
  }
}
