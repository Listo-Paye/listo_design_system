import 'package:flutter/material.dart';
import 'package:listo_design_system/svg/septeo_logo.dart';
import 'package:listo_design_system/themes/spacing.dart';

import 'profile_submenu_button.dart';

enum Variant { none }

class ListoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? firstName;
  final String? lastName;
  final String email;
  final VoidCallback? onMenuClick;
  final VoidCallback onLogout;

  const ListoAppBar({
    super.key,
    required this.email,
    required this.onLogout,
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
      leading: Builder(
        builder: (context) {
          return onMenuClick == null
              ? Padding(
                  padding: const EdgeInsets.only(left: Spacings.xs),
                  child: septeoLogo,
                )
              : InkWell(
                  onTap: onMenuClick,
                  child: Padding(
                    padding: const EdgeInsets.only(left: Spacings.xs),
                    child: septeoLogo,
                  ),
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
