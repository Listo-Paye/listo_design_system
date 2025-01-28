# Utiliser les boutons

Les boutons sont des éléments qui permettent d'effectuer une action. Ils sont utilisés pour valider un formulaire, pour naviguer vers une autre page, etc.

## Utilisation

Le widget `DSSButton` est un composant de boutons avec plusieurs styles et tailles :

```dart
enum DSSButtonSize {
  small,
  medium,
  large,
}

enum DSSButtonStyle {
  primaryMain,
  primarySecond,
  secondaryMain,
  secondarySecond,
  linkMain,
  linkSecond,
}
```

```dart
DSSButton(
  label: 'Label',
  styleType: DSSButtonStyle.primaryMain,
  size: DSSButtonSize.medium,
  onPressed: () {
    // Do something
  }, 
),
```



