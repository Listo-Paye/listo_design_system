### Utilisation

Pour utiliser les différentes valeurs de radius, il faut directement les importer depuis le fichier `ListoRadius` :

```dart

import 'package:listo_design_system/themes/radius.dart';

var radiusSmall = SepteoSpacings.xs;
var radiusMedium = SepteoSpacings.sm;
var radiusLarge = SepteoSpacings.xl;

```

### Règle border radius et padding

La valeur du radius extérieur doit être égale à la valeur du padding intérieur + la valeur du radius intérieur.

![Règle border radius et padding](resource:assets/images/padding_and_radius_rule.png)