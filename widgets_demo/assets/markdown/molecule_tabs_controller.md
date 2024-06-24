# TabsController

Le widget ListoTabController est un widget qui permet de gérer les onglets de manière simple et efficace, afin
d'afficher différentes pages au sein de la même section.

## Utilisation

Pour utiliser une section à onglets, il faut utiliser le widget `ListoTabsController` et lui passer en paramètre
un `Map<String, Widget>` où la clé est le nom de l'onglet et la valeur est le widget à afficher.

```dart
import 'package:listo_design_system/lib/molecules/tabs/tabs.dart';

var listoTabsController = ListoTabsController(
  tabs: {
    "Accueil": Center(
      child: Text("Accueil"),
    ),
    "Paramètres": Center(
      child: Text("Paramètres"),
    )
  },
);
```