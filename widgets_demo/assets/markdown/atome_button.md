# Utiliser les boutons

Les boutons sont des éléments qui permettent d'effectuer une action. Ils sont utilisés pour valider un formulaire, pour naviguer vers une autre page, etc.

## Utilisation

Pour utiliser un bouton, il faut utiliser le widget `Button` :

```dart
import 'package:listo_design_system/atoms/button.dart';

var button = Button(
    label: "Valider",
    onClick: () {
        print("Clic !");
    },
);
```