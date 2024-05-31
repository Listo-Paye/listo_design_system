# Listo Design System

Le Listo Design System est une bibliothèque de composants UI/UX pour l'application de gestion de la paie Listo Paye.

## Comment Utiliser le Projet

### Installation

Pour utiliser le package `listo_design_system`, ajoutez-le comme dépendance dans votre fichier `pubspec.yaml` :

```yaml
dependencies:
  listo_design_system:
```

Copier cette dépendance telle quelle dans votre fichier `pubspec.yaml`. L'utilisateur associé n'a que le droit de
lecture sur le contenu du repository.

### Utiliser le Main Theme
Pour utiliser le thème principal de Listo Design System, ajoutez le widget `ListoTheme` à votre application :

```dart
import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'router.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: F.title,
        theme: ListoDesignSystem.themes.main,
        home: const Scaffold(
          body: Center(
            child: Text('Hello World!'),
          ),
        ),
      );
  }
}
```
