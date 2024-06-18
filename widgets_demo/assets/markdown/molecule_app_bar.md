# Utiliser l'AppBar

L'AppBar est un widget permettant de créer une barre d'application en haut de l'écran.

## Utilisation

Pour utiliser une barre d'application, il faut utiliser le widget `ListoAppBar` et nécéssite les information
utilisateurs suivantes :
- `email`: L'adresse email de l'utilisateur
- `firstName`: Le prénom de l'utilisateur (optionnel)
- `lastName`: Le nom de famille de l'utilisateur (optionnel)

```dart
import 'package:listo_design_system/molecules/app_bar.dart';

var appBar = ListoAppBar(
  email: 'john.doe@mail.com',
  firstName: 'John',
  lastName: 'Doe',
  onLogout: () {
    // Do Logout logic here
  },
);
```