import 'dart:math';

import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

@Deprecated("Ce composant est déprécié. Merci d'utiliser plutôt `LogoAppBar`.")
class ProfileSubmenuButton extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  final String email;
  final VoidCallback onLogout;
  final VoidCallback onChangePassword;

  const ProfileSubmenuButton({
    super.key,
    required this.email,
    required this.onLogout,
    required this.onChangePassword,
    this.firstName,
    this.lastName,
  });

  bool isNullOrEmpty(String? value) {
    return value?.isEmpty ?? true;
  }

  bool isNotNullNorEmpty(String? value) {
    return value?.isNotEmpty ?? false;
  }

  String getFirstXCharacters(int x, String value) {
    return value.substring(0, min(x, value.length)).toUpperCase();
  }

  String getInitials() {
    if (isNullOrEmpty(firstName) && isNullOrEmpty(lastName)) {
      return getFirstXCharacters(2, email);
    }

    if (isNullOrEmpty(firstName) && isNotNullNorEmpty(lastName)) {
      return getFirstXCharacters(2, lastName!);
    }

    if (isNullOrEmpty(lastName) && isNotNullNorEmpty(firstName)) {
      return getFirstXCharacters(2, firstName!);
    }

    return '${getFirstXCharacters(1, firstName!)}${getFirstXCharacters(1, lastName!)}';
  }

  String getUsername() {
    if (isNotNullNorEmpty(firstName) || isNotNullNorEmpty(lastName)) {
      return '${firstName ?? ""} ${lastName ?? ""}';
    }

    return email;
  }

  @override
  Widget build(BuildContext context) {
    return SubmenuButton(
      menuChildren: [
        MenuItemButton(
          leadingIcon:
              Icon(Icons.password, color: ListoMainColors.neutral[700]),
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            elevation: WidgetStatePropertyAll(0),
          ),
          onPressed: onChangePassword,
          child: const Text('Changer de mot de passe'),
        ),
        MenuItemButton(
          leadingIcon: Icon(Icons.logout, color: ListoMainColors.neutral[700]),
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            elevation: WidgetStatePropertyAll(0),
          ),
          onPressed: onLogout,
          child: const Text('Se déconnecter'),
        )
      ],
      child: AdaptiveDispatcher(
        desktop: Row(children: [
          CircleAvatar(
            child: Text(
              getInitials(),
              style: TextStyles.bodyLarge,
            ),
          ),
          const SizedBox(width: Spacings.sm),
          Text(getUsername(), style: TextStyles.bodyLarge),
          const SizedBox(width: Spacings.sm),
          const Icon(Icons.arrow_drop_down),
        ]),
        handset: CircleAvatar(
          child: Text(
            getInitials(),
            style: TextStyles.bodyLarge,
          ),
        ),
      ),
    );
  }
}
