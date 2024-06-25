### Utiliser le scaffold avec AppBar et NavigationMenu

Voici le code d'exemple utilisé ici :
```dart
Scaffold(
  appBar: ListoAppBar(
    onMenuClick: () {
      NavigationMenu.of(context).toggleMenu();
    },
    email: email,
    firstName: firstName,
    lastName: lastName,
    onChangePassword: () {
      // Add your change password logic here
    },
    onLogout: () {
      // Add your logout logic here
    },
  ),
  body: NavigationMenu(
    onSettings: () {
      // ignore: avoid_print
      print("Settings");
    },
    body: Container(
      color: ListoMainColors.primary.ultraLight,
    ),
    destinations: [
      DestinationData(icon: Icons.grid_view, label: "Tableau de bord"),
      DestinationData(icon: Icons.person, label: "Employés"),
      DestinationData(icon: Icons.content_paste, label: "Contrats"),
      DestinationData(
        icon: Icons.insert_chart_outlined,
        label: "Variables",
        children: [
          DestinationData(
            icon: Icons.radar,
            label: "Radar",
          ),
        ],
      ),
      DestinationData(icon: Icons.euro, label: "Bulletins de paie"),
      DestinationData(
        icon: Icons.emoji_flags,
        label: "Périodes clôturées",
      ),
    ],
    showRail: true,
    showMenuIcon: false,
  ),
)
```

Le Scaffold est un widget qui permet de structurer une page en utilisant un AppBar et un NavigationMenu. Il est très utile pour créer des pages avec une barre de navigation et un menu latéral.
Dans cet exemple, nous utilisons un Scaffold avec un AppBar et un NavigationMenu. L'AppBar contient un bouton de menu qui permet d'ouvrir et de fermer le menu latéral. Le NavigationMenu contient une liste de destinations qui permettent de naviguer entre les différentes pages de l'application.
Le Scaffold est un widget très flexible qui permet de personnaliser l'apparence et le comportement de la page en fonction des besoins de l'application. Il est très utile pour créer des pages avec une barre de navigation et un menu latéral.

> **ATTENTION** : Le NavigatiopnMenu ne peut être utilisé dans le drawer, il a été conçu pour être utilisé dans le body du Scaffold.