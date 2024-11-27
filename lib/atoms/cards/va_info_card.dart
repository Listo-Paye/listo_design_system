import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listo_design_system/listo_design_system.dart';

@Deprecated('Ce composant sera bientôt supprimé.')
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
      color: isSelected ? SepteoColors.blue.shade200 : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Semantics(
        label: getAllText(),
        button: true,
        child: InkWell(
          hoverColor: SepteoColors.blue.shade50,
          highlightColor: SepteoColors.blue.shade200,
          splashColor: SepteoColors.blue.shade200,
          onTap: onSelect,
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.all(SepteoSpacings.xs),
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
                        style: SepteoTextStyles.bodySmallInter,
                      ),
                    ),
                    const RowSeparator(),
                    Text(
                      formatedValue,
                      overflow: TextOverflow.ellipsis,
                      style: SepteoTextStyles.bodySmallInterBold,
                    ),
                    const RowSeparator(),
                    type.toTag(),
                    const RowSeparator(),
                    Icon(
                      chevron,
                      color: SepteoColors.orange.shade600,
                    ),
                  ],
                ),
                (subtitle != null)
                    ? Text(
                        subtitle!,
                        style: SepteoTextStyles.captionInter
                            .copyWith(color: SepteoColors.grey.shade700),
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

class VaTypeTag extends StatelessWidget {
  final VaInfoCardType type;
  final bool large;
  const VaTypeTag({
    super.key,
    required this.type,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: SepteoSpacings.md, vertical: SepteoSpacings.xs),
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: const BorderRadius.all(Radius.circular(SepteoSpacings.xl)),
      ),
      child: Text(
        large ? type.largeLabel : type.label,
        semanticsLabel: type.largeLabel,
        style: SepteoTextStyles.bodySmallInterBold.copyWith(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}

enum VaInfoCardType {
  manual('S', 'Saisi'),
  calculated('C', 'Calculé');

  final String label;
  final String largeLabel;
  const VaInfoCardType(this.label, this.largeLabel);

  Color get color => this == VaInfoCardType.manual
      ? SepteoColors.red.shade600
      : SepteoColors.blue.shade600;
}

extension VaInfoCardTypeExtension on VaInfoCardType {
  Widget toTag({bool large = false}) {
    return VaTypeTag(
      type: this,
      large: large,
    );
  }
}
