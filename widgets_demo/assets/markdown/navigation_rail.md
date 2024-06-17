### Quelques règles

Le `ListoNavigationRail` est un widget qui permet de créer un menu de navigation latéral. Il est composé de plusieurs éléments de navigation appelés `DestinationData`. Chaque `DestinationData` est composé d'une icône, d'une icône sélectionnée, d'un label, d'une liste d'enfants permettant de créer un menu déroulant et d'un indicateur de positionnement (en haut ou en bas du menu).

Le principe d'affichage est différent selon le device :
- Sur mobile, seul le bouton de menu est affiché par défaut. Le click sur le bouton de menu affiche le menu de navigation.
- Sur tablette et desktop, le menu de navigation est affiché par défaut en mode rail et nous avons un bouton pour indiquer le format menu ou le format bouton.
- Lorsque l'on clique sur un élément avec des enfants, le menu se déroule pour afficher les enfants.
    
### Utilisation

Pour utiliser le `ListoNavigationRail`, il suffit de l'ajouter à votre arbre de widget. Voici un exemple de code :

```dart
class NavigationRailPresenter extends StatelessWidget {
  const NavigationRailPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListoNavigationRail(
      destinationData: [],
    );
  }
}
```

Chaque `DestinationData` est composé des éléments suivants :
- `icon` : l'icône de l'élément de navigation
- `selectedIcon` : l'icône de l'élément de navigation lorsqu'il est sélectionné
- `label` : le label de l'élément de navigation
- `children` : la liste des enfants de l'élément de navigation
- `extended` : un booléen permettant de déterminer si le menu est étendu ou non

```dart
class NavigationRailPresenter extends StatelessWidget {
  const NavigationRailPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListoNavigationRail(
      destinationData: [
        DestinationData(
          icon: Icons.home,
          selectedIcon: Icons.home,
          label: 'Home',
          children: [],
          extended: false,
        ),
        DestinationData(
          icon: Icons.settings,
          selectedIcon: Icons.settings,
          label: 'Settings',
          children: [
            DestinationData(
              icon: Icons.notifications,
              selectedIcon: Icons.notifications,
              label: 'Notifications',
              children: [],
              extended: false,
            ),
            DestinationData(
              icon: Icons.account_circle,
              selectedIcon: Icons.account_circle,
              label: 'Profile',
              children: [],
              extended: false,
            ),
          ],
          extended: false,
        ),
      ],
    );
  }
}
```
