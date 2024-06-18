import 'package:flutter/material.dart';

import 'profile_submenu_button.dart';

enum Variant { none }

class ListoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? firstName;
  final String? lastName;
  final String email;
  final VoidCallback onLogout;

  const ListoAppBar({
    super.key,
    required this.email,
    required this.onLogout,
    this.firstName,
    this.lastName,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
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
