import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

class ListoAppBarPresenter extends StatelessWidget {
  const ListoAppBarPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    final email =
        context.knobs.string(label: "Email", initialValue: "john.doe@mail.com");
    final firstName =
        context.knobs.stringOrNull(label: "First name", initialValue: "John");
    final lastName =
        context.knobs.stringOrNull(label: "Last name", initialValue: "Doe");

    return Center(
      child: ListoAppBar(
        email: email,
        firstName: firstName,
        lastName: lastName,
        onLogout: () {
          // Add your logout logic here
        },
      ),
    );
  }
}
