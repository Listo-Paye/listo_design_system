import 'package:flutter/material.dart';
import 'package:listo_design_system/molecules/status_service/environment.dart';

class EnvironmentsPresenter extends StatelessWidget {
  final List<Environment> environments;

  const EnvironmentsPresenter({super.key, required this.environments});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      child: ListView(
        shrinkWrap: true,
        children: environments
            .map((env) => EnvironmentWidget(
                environment: env,
                areHealthy: env.services.every((service) => service.isHealthy)))
            .toList(),
      ),
    );
  }
}
