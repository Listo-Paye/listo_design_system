# Utiliser les tags

Les tags sont des éléments ...

## Utilisation

Pour utiliser un tag, il faut utiliser le widget `Tag`.
Ses attributs 'backgroundColor' et 'textColor' sont de type MaterialColor.
Une nuance 200 sera appliquée au background, et une nuance 700 sera appliquée au texte.

```dart
import 'package:listo_design_system/atoms/tag.dart';

const MaterialColor customBlue = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);

var tag = Tag(
  label: "Oui",
  color: customBlue,
  textColor: customBlue,
);
```