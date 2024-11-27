# Utiliser les checkboxs

Les `CheckBox` sont des éléments d'interface utilisateur qui permettent à l'utilisateur de sélectionner ou désélectionner une option. Elles peuvent être utilisées en version à 2 états (true/false) ou à 3 états (true/false/null), selon vos besoins.

## Utilisation

Pour utiliser une `CheckBox`, vous devez utiliser le widget `CheckBox` du design system. Ce widget est contrôlé par son parent, ce qui signifie que vous gérez l'état de la `CheckBox` dans votre propre widget, en passant la valeur actuelle et une fonction de rappel pour les changements.
### Version 2 états

Dans cette version, la CheckBox alterne entre true et false lorsque l'utilisateur clique dessus. Vous gérez l'état de la CheckBox dans votre widget en utilisant une variable de type bool.
```dart
import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/checkbox.dart';

class BinaryCheckboxDemo extends StatefulWidget {
  @override
  _BinaryCheckboxDemoState createState() => _BinaryCheckboxDemoState();
}

class _BinaryCheckboxDemoState extends State<BinaryCheckboxDemo> {
  bool isChecked = false;

  void _onCheckboxChanged(bool? newValue) {
    setState(() {
      isChecked = newValue ?? false; // Assure que isChecked est toujours true ou false
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckBox(
      value: isChecked,
      onChanged: _onCheckboxChanged,
    );
  }
}
```
 - **Variable d'état** : isChecked est de type bool et ne peut être que true ou false.
 - **Fonction onChanged** : Met à jour isChecked avec la nouvelle valeur reçue. L'opérateur ?? assure que isChecked n'est jamais null.
 - **Widget CheckBox** : Vous passez isChecked à la propriété value, et _onCheckboxChanged à la propriété onChanged.
### Version 3 états

Dans cette version, la CheckBox alterne entre true et false lorsqu'elle est cliquée, mais vous avez la possibilité de passer la valeur à null sous certaines conditions spécifiques de votre application.

```dart
import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/checkbox.dart';

class ConditionalCheckboxDemo extends StatefulWidget {
  @override
  _ConditionalCheckboxDemoState createState() => _ConditionalCheckboxDemoState();
}

class _ConditionalCheckboxDemoState extends State<ConditionalCheckboxDemo> {
  bool? checkboxValue = false;

  void _onCheckboxChanged(bool? newValue) {
    setState(() {
      checkboxValue = newValue;
    });
  }

  void _resetCheckboxValue() {
    // if( Vos conditions pour passer la valeur à null) {
    setState(() {
      checkboxValue = null;
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckBox(
          value: checkboxValue,
          onChanged: _onCheckboxChanged,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _resetCheckboxValue,
          child: const Text('Réinitialiser la CheckBox à null'),
        ),
      ],
    );
  }
}
```

 - **Variable d'état** : checkboxValue est de type bool? et peut être true, false ou null.
 - **Fonction onChanged** : Met à jour checkboxValue avec la nouvelle valeur reçue.
 - **Fonction _resetCheckboxValue** : Assigne null à checkboxValue lorsqu'elle est appelée. Vous pouvez ajouter vos propres conditions avant de passer la valeur à null.
 - **Widget CheckBox** : Vous passez checkboxValue à la propriété value, et _onCheckboxChanged à la propriété onChanged.
 - **Bouton pour réinitialiser** : Un bouton permet de réinitialiser la CheckBox à null en appelant _resetCheckboxValue.