import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listo_design_system/listo_design_system.dart';

class AmountTitle extends StatelessWidget {
  final double amount;
  const AmountTitle({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Text(
      formatedValue,
      style: SepteoTextStyles.headingSmallInterBold,
    );
  }

  String get formatedValue => NumberFormat.currency(
        locale: 'fr_FR',
        symbol: '€',
        decimalDigits: 2,
      ).format(amount);
}
