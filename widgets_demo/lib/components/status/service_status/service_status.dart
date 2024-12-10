import 'package:flutter/material.dart';
import 'package:listo_design_system/molecules/status_service/environment.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/status/service_status/service_status_presenter.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent statusService(BuildContext context) {
  final List<MicroService> servicesPreprod = [
    MicroService(title: 'Agenda', isHealthy: true),
    MicroService(title: 'Backend', isHealthy: true),
    MicroService(title: 'Fiches OC', isHealthy: true),
    MicroService(title: 'Net-enterprise', isHealthy: true),
    MicroService(title: 'Suivi-Metier-Service', isHealthy: true),
    MicroService(title: 'Users-Mananger', isHealthy: true),
    MicroService(title: 'Variables Applicatives', isHealthy: true),
  ];

  final List<MicroService> servicesPreprod2 = [
    MicroService(title: 'Agenda', isHealthy: false),
    MicroService(title: 'Backend', isHealthy: false),
    MicroService(title: 'Fiches OC', isHealthy: true),
    MicroService(title: 'Net-enterprise', isHealthy: true),
    MicroService(title: 'Suivi-Metier-Service', isHealthy: true),
    MicroService(title: 'Users-Mananger', isHealthy: false),
    MicroService(title: 'Variables Applicatives', isHealthy: false),
  ];

  final List<MicroService> servicesProduction = [
    MicroService(title: 'Agenda', isHealthy: true),
    MicroService(title: 'Backend', isHealthy: true),
    MicroService(title: 'Fiches OC', isHealthy: true),
    MicroService(title: 'Net-enterprise', isHealthy: false),
    MicroService(title: 'Suivi-Metier-Service', isHealthy: false),
    MicroService(title: 'Users-Mananger', isHealthy: true),
    MicroService(title: 'Variables Applicatives', isHealthy: true),
  ];

  final List<Environment> environments = [
    Environment(name: 'Preprod', services: servicesPreprod),
    Environment(name: 'Preprod2', services: servicesPreprod2),
    Environment(name: 'Production', services: servicesProduction),
  ];

  return WidgetbookComponent(
    name: "Status service",
    useCases: [
      usercaseWithMarkdown(
        "Statut des services",
        (context) {
          return EnvironmentsPresenter(environments: environments);
        },
        "markdown/status_service.md",
      ),
    ],
  );
}
