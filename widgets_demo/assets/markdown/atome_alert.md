# Utiliser les alertes

Les alertes sont des éléments qui permettent d'afficher des informations à l'utilisateur. Elles sont utilisées pour afficher des messages d'erreur, des messages de succès, des messages d'information, etc.

## Utilisation

Pour utiliser une alerte, il faut utiliser le widget `*Alert` :

```dart
import 'package:listo_design_system/atoms/alert.dart';

var alertes = Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ErrorAlert(
          text: "Erreur"),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: SuccessAlert(
          text: "Sucess"),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: WarningAlert(
          text: "Attention",
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: InfoAlert(
          text: "Information"),
    ),
  ],
);
```

Vous pouvez aussi définir spécifiquement la taille de l'alerte :

```dart
import 'package:listo_design_system/atoms/alert.dart';

var alerte = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ErrorAlert(
      text: "Erreur",
      width: 200,
      height: 100,
  ),
);
```