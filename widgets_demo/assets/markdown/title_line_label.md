### Ligne de titre avec Libellé

Le TitleLine peut s'utiliser avec un libellé si vous ne souhaitez pas d'interaction.

```dart
TitleLine(
  title: title,
  label: label,
  selectedValue: value,
)
```

Sans renseigner les valeurs possibles, le `TitleLine` comprendra que le libellé est un texte simple.

Vous pouvez forcer le mode mobile en ajoutant le paramètre `forcedMobile: true`.

```dart
TitleLine(
  title: title,
  label: label,
  selectedValue: value,
  forcedMobile: true,
)
```

> **Note**: Il est important de noter que le TitleLine est adaptatif et s'ajuste automatiquement à la taille de l'écran (jusqu'à une certaine limite).