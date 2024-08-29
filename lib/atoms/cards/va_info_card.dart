import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listo_design_system/atoms/atoms_module.dart';
import 'package:listo_design_system/themes/colors.dart';

import '../../themes/radius.dart';
import '../../themes/spacing.dart';
import '../../themes/text_style.dart';

class VaInfoCard extends ListoCard {
  final String title;
  final double value;
  final VaInfoCardType type;
  final String? subtitle;
  const VaInfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.type,
    this.subtitle,
    super.isSelected = false,
    super.chevron,
    super.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: isSelected ? ListoMainColors.primary.light : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Semantics(
        label: getAllText(),
        button: true,
        child: InkWell(
          hoverColor: ListoMainColors.primary.ultraLight,
          highlightColor: ListoMainColors.primary.light,
          splashColor: ListoMainColors.primary.light,
          onTap: onSelect,
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.all(Spacings.xs),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.bodyMedium.copyWith(
                          color: ListoMainColors.neutral.shade900,
                        ),
                      ),
                    ),
                    const RowSeparator(),
                    Text(
                      formatedValue,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.bodyMediumSemibold
                          .copyWith(color: ListoMainColors.neutral.shade900),
                    ),
                    const RowSeparator(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Spacings.sm, vertical: Spacings.xs),
                      decoration: BoxDecoration(
                        color: type.color,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(Radiuses.md)),
                      ),
                      child: Text(
                        type.label,
                        style: TextStyles.bodyMediumSemibold.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const RowSeparator(),
                    Icon(
                      chevron,
                      color: ListoMainColors.secondary.base,
                    ),
                  ],
                ),
                (subtitle != null)
                    ? Text(
                        subtitle!,
                        style: TextStyles.bodySmall
                            .copyWith(color: ListoMainColors.neutral.shade700),
                      )
                    : const SizedBox(
                        height: 0,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get formatedValue => NumberFormat.currency(
        locale: 'fr_FR',
        symbol: '€',
        decimalDigits: 2,
      ).format(value);

  @override
  String getAllText() {
    return '$title $formatedValue ${subtitle ?? ''} ${type.label}';
  }
}

enum VaInfoCardType {
  manual('S'),
  calculated('C');

  final String label;
  const VaInfoCardType(this.label);

  Color get color => this == VaInfoCardType.manual
      ? ListoMainColors.error.dark
      : ListoMainColors.primary.dark;
}
