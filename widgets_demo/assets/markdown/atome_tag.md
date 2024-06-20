# Utiliser les tags

Les tags sont des éléments ...

## Utilisation

Pour utiliser un tag, il faut utiliser le widget `Tag`.
Ses attributs 'backgroundColor' et 'textColor' sont de type MaterialColor.
Une nuance 200 sera appliquée au background, et une nuance 800 sera appliquée au texte.

```dart
import 'package:listo_design_system/atoms/tag.dart';

var tag = Tag(
  label: "Oui",
  color: Colors.blue,
  textColor: Colors.blue,
);
```