import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ChartIndicator extends StatelessWidget {
  const ChartIndicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 14,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Flexible(
          child: Text(
            text,
            style: SepteoTextStyles.captionInter.copyWith(
              color: textColor,
            ),
          ),
        )
      ],
    );
  }
}
