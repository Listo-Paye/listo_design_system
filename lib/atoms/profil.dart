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
          splashColor: SepteoColors.blue.shade50,
          hoverColor: Colors.transparent,
          icon: Icon(
            Icons.help_outline,
            color: SepteoColors.blue.shade900,
          ),
        ),
        MenuAnchor(
          style: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SepteoSpacings.xs),
              ),
            ),
          ),
          menuChildren: [
            SizedBox(
              width: 330,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SepteoSpacings.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SepteoSpacings.md),
                    Text("Compte",
                        style: SepteoTextStyles.headingMediumInter.copyWith(
                          color: SepteoColors.grey.shade900,
                        )),
                    SizedBox(height: SepteoSpacings.md),
                    Text(
                      email,
                      style: SepteoTextStyles.bodyMediumInter,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SepteoSpacings.xs),
                      decoration: BoxDecoration(
                        color: SepteoColors.orange.shade200,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(SepteoSpacings.xl)),
                      ),
                      child: Text(
                        label.toLowerCase(),
                        style: SepteoTextStyles.captionInter.copyWith(
                          color: SepteoColors.grey.shade700,
                        ),
                      ),
                    ),
                    SizedBox(height: SepteoSpacings.md),
                    Divider(),
                    SizedBox(height: SepteoSpacings.xs),
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
                    color: SepteoColors.blue.shade900,
                  ),
                  const SizedBox(width: SepteoSpacings.xl),
                  Text(
                    'Déconnexion',
                    style: SepteoTextStyles.bodyMediumInter.copyWith(
                      color: SepteoColors.grey.shade900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SepteoSpacings.md),
          ],
          builder: (_, controller, __) => IconButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            splashColor: SepteoColors.blue.shade50,
            hoverColor: Colors.transparent,
            icon: IconAccount(),
          ),
        ),
      ],
    );
  }
}
