## Navigation Tabs

Un composant de navigation horizontal qui affiche une liste d'onglets avec un indicateur animé mettant en évidence l'onglet sélectionné.

## Props

| Prop | Type | Required | Description |
|------|------|-------|-------------|
| selectedTab | String | Oui   | Identifiant de l'onglet actuellement sélectionné |
| tabs | List<String> | Oui   | Liste des libellés d'onglets à afficher |
| onTabSelected | Function(String) | Oui   | Rappel déclenché lors de la sélection d'un onglet |

## Usage

```dart
NavigationTabs(
  selectedTab: 'Home',
  tabs: ['Home', 'Profile', 'Settings'],
  onTabSelected: (tab) => print('Selected: $tab'),
)
```

## Notes d'Implémentation

La largeur de l'indicateur est calculée dynamiquement à 50% de la largeur de l'onglet sélectionné
Les calculs de position utilisent les mesures RenderBox pour un positionnement précis
Le premier rendu est différé pour garantir des mesures précises
