import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class Profil extends StatelessWidget {
  final VoidCallback? onHelpPressed;
  final VoidCallback? onProfilPressed;
  final String label;

  const Profil({
    super.key,
    required this.label,
    this.onHelpPressed,
    this.onProfilPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onHelpPressed,
          splashColor: ListoMainColors.primary.ultraLight,
          hoverColor: Colors.transparent,
          icon: Icon(
            Icons.help_outline,
            color: ListoMainColors.primary.base,
          ),
        ),
        const SizedBox(width: Spacings.md),
        InkWell(
          splashColor: ListoMainColors.primary.ultraLight,
          hoverColor: Colors.transparent,
          onTap: onProfilPressed,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: Spacings.xs),
                decoration: BoxDecoration(
                  color: ListoMainColors.secondary.light,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(Radiuses.md)),
                ),
                child: Text(
                  label.toLowerCase(),
                  style: TextStyles.bodySmall.copyWith(
                    color: ListoMainColors.neutral[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.account_circle,
                size: 38,
                color: ListoMainColors.primary.base,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
