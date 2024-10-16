import 'package:flutter/material.dart';
import 'package:listo_design_system/molecules/navigation_menu/menu_icon.dart';
import 'package:listo_design_system/themes/spacing.dart';
import 'package:listo_design_system/listo_design_system.dart';

enum Variant { none }

@Deprecated("Ce composant est déprécié. Merci d'utiliser plutôt `LogoAppBar`.")
class ListoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? firstName;
  final String? lastName;
  final String email;
  final VoidCallback? onMenuClick;
  final VoidCallback onLogout;
  final VoidCallback onChangePassword;

  const ListoAppBar({
    super.key,
    required this.email,
    required this.onLogout,
    required this.onChangePassword,
    this.firstName,
    this.lastName,
    this.onMenuClick,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading: Builder(
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.only(left: Spacings.sm),
            child: MenuIcon(),
          );
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MenuBar(
            style: const MenuStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              elevation: WidgetStatePropertyAll(0),
            ),
            children: [
              SizedBox(
                  width: 48,
                  height: 48,
                  child: Tooltip(
                    message: 'Se déconnecter',
                    child: MenuItemButton(
                      key: const Key('logoutButton'),
                      leadingIcon: Icon(Icons.exit_to_app,
                          color: ListoMainColors.neutral[700]),
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(Colors.white),
                        elevation: const WidgetStatePropertyAll(0),
                        padding: const WidgetStatePropertyAll(EdgeInsets.only(left: 12)),
                        shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      onPressed: onLogout,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
