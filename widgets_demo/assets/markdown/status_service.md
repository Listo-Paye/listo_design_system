#  Status Service

Le Status Service est un widget qui permet pour chaque environnement, d'afficher le statut de chaque service ou micro service.

## Utilisation

À l'heure actuelle, il faut considérer que c'est une version bêta, voire alpha. Design simple, mais qui pourra être retouché si besoin lord de l'implémentation.

Il faudra pour l'utiliser, récupérer les états de chaque service et de chaque environnement, puis les passer en paramètre du widget:

```dart
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


    import 'package:flutter/material.dart';
    import 'package:listo_design_system/molecules/status_service/environment.dart';
    
    class ServicesStatus extends StatelessWidget {
      final List<Environment> environments;
    
      const ServicesStatus({super.key, required this.environments});
    
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
```

Si tous les services sont healthy, le voyant dans le header sera vert, si il y a un seul service qui est unhealthy, le voyant sera rouge.

