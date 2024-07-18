### Utilisation du mode DropDownButton

Pour afficher un `DropDownButton`, il suffit de lui passer une liste de valeurs {id, value} qui contiennent l'identifiant unique et le texte à afficher.
La récupération de la valeur sélectionnée se fait en passant une fonction de callback `onValueSelected` qui prend en paramètre la valeur sélectionnée.

```dart
TitleLine(
  title: 'Établissement - Paramètres',
  label: 'Période',
  selectedValue: 'Juillet 2024 (En cours)',
  values: [
    (id: "2024-07", value: "Juillet 2024 (En cours)"),
    (id: "2024-06", value: "Juin 2024"),
    (id: "2024-05", value: "Mai 2024"),
    (id: "2024-04", value: "Avril 2024"),
    (id: "2024-03", value: "Mars 2024"),
    (id: "2024-02", value: "Février 2024"),
  ],
),
```

> **Note**: Il est important de noter que le TitleLine est adaptatif et s'ajuste automatiquement à la taille de l'écran (jusqu'à une certaine limite).