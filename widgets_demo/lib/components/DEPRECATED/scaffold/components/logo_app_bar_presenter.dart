import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class LogoAppBarPresenter extends StatelessWidget {
  const LogoAppBarPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 700,
        decoration: BoxDecoration(
          border: Border.all(
            color: ListoDesignSystem.themes.main.primaryColor,
            width: 3,
          ),
        ),
        child: Scaffold(
          appBar: LogoAppBar(
            title: Text('Listo'),
            logo: AssetImage('assets/images/logo.png'),
          ),
          body: Container(
            color: ListoMainColors.primary.ultraLight,
          ),
        ),
      ),
    );
  }
}
