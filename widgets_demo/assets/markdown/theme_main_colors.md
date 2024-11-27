# Utilisation des couleurs

Les couleurs de l'application sont définies dans le package `septeo_design_system`. Toutes les couleurs sont des `MaterialColor` et sont accessibles via la classe `SepteoColors`.

## Couleurs de base

La première couleur de base est la `blue` :

```dart
import 'package:listo_design_system/themes/colors.dart';

var colorBase = SepteoColors.blue.shade900;
```

Cette couleur est utilisée pour les éléments de premier niveau de l'application, comme le titre de la page, le texte de l'application, etc.

## Couleurs secondaires

Les couleurs secondaires sont utilisées pour les éléments secondaires de l'application, comme les boutons, les cards, etc.
La couleur `grey` est utilisée pour le texte.

```dart
var orange = SepteoColors.orange.shade400;
var green = SepteoColors.green.shade600;
var red = SepteoColors.red.shade600;
var grey = SepteoColors.grey.shade600;
var purple = SepteoColors.purple.shade600;
var yellow = SepteoColors.yellow.shade600;
```
