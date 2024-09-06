import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/colors.dart';
import 'package:listo_design_system/themes/text_style.dart';

class FormTitle extends StatelessWidget {
  final String data;
  const FormTitle({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: TextStyles.headingMedium
            .copyWith(color: ListoMainColors.neutral.shade900));
  }
}
