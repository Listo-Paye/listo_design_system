import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listo_design_system/themes/colors.dart';
import 'package:listo_design_system/themes/text_style.dart';

class AmountTitle extends StatelessWidget {
  final double amount;
  const AmountTitle({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Text(
      formatedValue,
      style: TextStyles.headingLarge.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: ListoMainColors.neutral.shade900,
      ),
    );
  }

  String get formatedValue => NumberFormat.currency(
        locale: 'fr_FR',
        symbol: '€',
        decimalDigits: 2,
      ).format(amount);
}
