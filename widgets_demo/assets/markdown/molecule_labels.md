## Fonctionnement des Labels de Formulaires

### FormTitle
```dart
const FormTitle(data: "PMSS salarié");
```

Utilisation simple, pas de contrainte de taille.

### AmountTitle
```dart
const AmountTitle(amount: 8 896.21);
```

### VaTag
Les VaTAgs sont un élément particulier des tags. Ils sont une extension des types de variables applicatives :

```dart
enum VaInfoCardType {
  manual('S', 'Saisi'),
  calculated('C', 'Calculé');

  final String label;
  final String largeLabel;
  const VaInfoCardType(this.label, this.largeLabel);

  Color get color => this == VaInfoCardType.manual
      ? SepteoColors.red.shade600
      : SepteoColors.blue.shade600;
}

extension VaInfoCardTypeExtension on VaInfoCardType {
  Widget toTag({bool large = false}) {
    return VaTypeTag(
      type: this,
      large: large,
    );
  }
}
```

Voici le code source de l'extension VaInfoCardTypeExtension qui permet de transformer un VaInfoCardType en VaTypeTag.
Ce qui donne : 
```dart
Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      type.toTag(),
      const SizedBox(width: 16),
      type.toTag(large: true),
    ],
);
```
