import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class Profil extends StatelessWidget {
  final VoidCallback? onHelp;
  final VoidCallback? onLogout;
  final String email;
  final String label;

  const Profil({
    super.key,
    required this.email,
    required this.label,
    this.onHelp,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onHelp,
          splashColor: ListoMainColors.primary.ultraLight,
          hoverColor: Colors.transparent,
          icon: Icon(
            Icons.help_outline,
            color: ListoMainColors.primary.base,
          ),
        ),
        MenuAnchor(
          style: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Spacings.xs),
              ),
            ),
          ),
          menuChildren: [
            SizedBox(
              width: 330,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacings.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Spacings.sm),
                    Text("Compte",
                        style: TextStyles.headingLarge.copyWith(
                          color: ListoMainColors.neutral.shade900,
                        )),
                    SizedBox(height: Spacings.sm),
                    Text(
                      email,
                      style: TextStyles.labelLarge.copyWith(
                        color: ListoMainColors.neutral.shade900,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Spacings.xs),
                      decoration: BoxDecoration(
                        color: ListoMainColors.secondary.light,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(Radiuses.md)),
                      ),
                      child: Text(
                        label.toLowerCase(),
                        style: TextStyles.headingSmall.copyWith(
                          color: ListoMainColors.neutral[700],
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: Spacings.sm),
                    Divider(),
                    SizedBox(height: Spacings.xs),
                  ],
                ),
              ),
            ),
            MenuItemButton(
              onPressed: onLogout,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.power_settings_new,
                    color: ListoMainColors.primary.base,
                  ),
                  const SizedBox(width: Spacings.md),
                  Text(
                    'Déconnexion',
                    style: TextStyles.labelLarge.copyWith(
                      color: ListoMainColors.neutral.shade900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Spacings.sm),
          ],
          builder: (_, controller, __) => IconButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            splashColor: ListoMainColors.primary.ultraLight,
            hoverColor: Colors.transparent,
            icon: IconAccount(),
          ),
        ),
      ],
    );
  }
}
