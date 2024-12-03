# Utiliser le Widget ClientCardV2

Le **ClientCardV2** est un widget qui permet d'afficher les informations d'un employé dans une carte stylisée. Ce widget est utile pour présenter de manière compacte des informations essentielles sur un salarié.

Pour utiliser le **ClientCardV2**, il suffit d'importer le widget et de lui passer une instance de **EmployeeData**, contenant les informations nécessaires à afficher.

Cet objet doit inclure les informations suivantes sur l'employé :
 - **nom** : Le nom de famille de l'employé.
 - **prenom** : Le prénom de l'employé.
 - **dateDebut** : La date de début du contrat.
 - **dateFin** : La date de fin du contrat.
 - **type** : Le type de contrat (par exemple CDI, CDD).

## Exemple de Code
Voici un exemple simple d'utilisation du widget ClientCardV2 :

```dart
import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:listo_design_system/molecules/affiliations_oc/contrat_oc_entity.dart';

class ClientCardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Données fictives pour l'employé
    final employeeFictif = EmployeeData(
      nom: 'Norris',
      prenom: 'Chuck',
      dateDebut: '01/03/2023',
      dateFin: '30/06/2023',
      type: 'CDD',
    );

    return ClientCardV2(
      employee: employeeFictif,
    );
  }
}
```

