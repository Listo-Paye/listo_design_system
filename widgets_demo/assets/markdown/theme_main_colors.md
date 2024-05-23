# Utilisation des couleurs

Pour utiliser les couleurs, il faut directement les importer depuis le fichier `ListoMainColors` :

```dart
import 'package:listo_design_system/themes/colors.dart';

var colorBase = ListoMainColors.primary.base;
var colorUltraLight = ListoMainColors.primary.ultraLight;
var colorLight = ListoMainColors.primary.light;
var colorMedium = ListoMainColors.primary.medium;
var colorDark = ListoMainColors.primary.dark;
var colorDarker = ListoMainColors.primary.darker;
```

Vous pouvez aussi convertir ces couleurs en `MaterialColor` pour les utiliser dans les `ThemeData` :

```dart
import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/colors.dart';

var theme = ThemeData(
  primarySwatch: ListoMainColors.primary.materialColor,
  primaryColor: ListoMainColors.primary.base,
  useMaterial3: true,
);
```