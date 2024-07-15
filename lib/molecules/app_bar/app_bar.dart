import 'package:flutter/material.dart';
import 'package:listo_design_system/molecules/navigation_menu/menu_icon.dart';
import 'package:listo_design_system/themes/spacing.dart';

import 'profile_submenu_button.dart';

enum Variant { none }

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
              ProfileSubmenuButton(
                email: email,
                onLogout: onLogout,
                onChangePassword: onChangePassword,
                firstName: firstName,
                lastName: lastName,
              )
            ],
          ),
        ],
      ),
    );
  }
}
