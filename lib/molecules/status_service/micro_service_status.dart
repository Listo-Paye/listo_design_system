import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class StatusLineWidget extends StatelessWidget {
  final String title;
  final bool isHealthy;

  const StatusLineWidget({
    super.key,
    required this.title,
    required this.isHealthy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: SepteoColors.blue.shade400,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: SepteoSpacings.xs, horizontal: SepteoSpacings.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: SepteoTextStyles.bodyMediumInter,
            ),
          ),
          Row(
            children: [
              Text(isHealthy ? 'Healthy' : 'Unhealthy',
                  style: SepteoTextStyles.bodyMediumInter.copyWith(
                    color: isHealthy ? Colors.green : Colors.red,
                  )),
              SizedBox(width: SepteoSpacings.xs),
              Icon(
                size: 20,
                isHealthy ? Icons.check_circle : Icons.cancel,
                color: isHealthy ? Colors.green : Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
