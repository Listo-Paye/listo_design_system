## Libellés de formulaire

### FormLabel
Permet d'afficher un texte avec son hint associé
```dart
FormLabel(
  text: 'Libellé',
  hint: 'Valeur de libellé',
)
```

### FormPeriodLabel
Permet d'afficher une date ou une période
Voici pour l'affichage d'une période
```dart
  FormPeriodLabel(
    hint: 'Période',
    startDate: DateTime.now().add(const Duration(days: -200)),
    endDate: DateTime.now(),
  ),
```

Voici pour l'affichage d'une date
```dart
  FormPeriodLabel(
    hint: 'Date',
    startDate: DateTime.now(),
  ),
```
La différence est dans le fait de passer ou non une date de fin

### FormKeyValueLabel
Permet d'afficher un ensemble de clés/valeurs
```dart
FormKeyValueList(hint: 'Liste de valeurs', values: {
    'Partie A': '50 %',
    'Partie B': '25 %',
    'Partie C': '25%',
}),
```

## FormList
Permet d'afficher une liste de FormLabels
```dart
FormList(
    children: [
      const FormLabel(
        hint: 'Hint',
        value: 'Value',
      ),
      FormPeriodLabel(
        hint: 'Période avec date de fin',
        startDate: DateTime.now().add(const Duration(days: -200)),
        endDate: DateTime.now(),
      ),
      FormPeriodLabel(
        hint: 'Période sans date de fin',
        startDate: DateTime.now().add(const Duration(days: -200)),
      ),
      const FormKeyValueList(hint: 'Liste de valeurs', values: {
        'Partie A': '50 %',
        'Partie B': '25 %',
        'Partie C': '25%',
      }),
    ],
)
```

### Créer votre propre FormLabel
Pour créer votre propre FormLabel, vous pouvez utiliser le Widget `FormBaseLabels` et implémenter son child
```dart
class FormLabel extends StatelessWidget {
  final String hint;
  final String? value;
  const FormLabel({
    super.key,
    required this.hint,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return FormBaseLabels(
      hint: hint,
      child: Text(
        value ?? '-',
        style: SepteoTextStyles.bodyMediumInterBold.copyWith(
          color: SepteoColors.grey.shade900,
        ),
      ),
    );
  }
}
```
