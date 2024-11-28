# Utiliser les CheckBoxWithText
Les **CheckBoxWithText** sont des widgets combinant une **CheckBox** et un **Text**, le tout encapsulé dans un conteneur avec une bordure dont la couleur dépend de l'état de la **CheckBox**. Elles peuvent être utilisées en version à **2 états (true/false)** ou à **3 états (true/false/null)**, selon vos besoins.

Pour utiliser une **CheckBoxWithText**, vous devez utiliser le widget **CheckBoxWithText** du design system. Ce widget est contrôlé par son parent, ce qui signifie que vous gérez l'état de la **CheckBox** dans votre propre widget, en passant la valeur actuelle, une fonction de rappel pour les changements, et le texte à afficher.

## Version 2 états

Dans cette version, la **CheckBoxWithText** alterne entre true et false lorsque l'utilisateur clique dessus. Vous gérez l'état de la **CheckBoxWithText** dans votre widget en utilisant une variable de type **bool**.
```dart
import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class BinaryCheckBoxWithTextDemo extends StatefulWidget {
  @override
  _BinaryCheckBoxWithTextDemoState createState() => _BinaryCheckBoxWithTextDemoState();
}

class _BinaryCheckBoxWithTextDemoState extends State<BinaryCheckBoxWithTextDemo> {
  bool isChecked = false;

  void _onCheckboxChanged(bool? newValue) {
    if (newValue != null) {
      setState(() {
        isChecked = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CheckBoxWithText(
      value: isChecked,
      onChanged: _onCheckboxChanged,
      text: 'Accepter les termes et conditions',
    );
  }
}
```
## Explications
 - **Variable d'état :** **isChecked** est de type **bool** et ne peut être que **true** ou **false**.
 - **Fonction onChanged** : Met à jour **isChecked** en inversant sa valeur actuelle.
 - **Widget CheckBoxWithText** :
   - _**value**_ : Passe **isChecked** pour refléter l'état actuel.
   - _**onChanged**_ : Fournit la fonction de rappel _**onCheckboxChanged**.
   - _**text**_ : Le texte à afficher à côté de la **CheckBox**.

## Version 3 états

Dans cette version, la CheckBoxWithText peut également représenter une valeur null, en plus de true et false. Vous pouvez réinitialiser la valeur à null sous certaines conditions spécifiques de votre application.

```dart
import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class TriStateCheckBoxWithTextDemo extends StatefulWidget {
   @override
   _TriStateCheckBoxWithTextDemoState createState() => _TriStateCheckBoxWithTextDemoState();
}

class _TriStateCheckBoxWithTextDemoState extends State<TriStateCheckBoxWithTextDemo> {
   bool? checkboxValue = false;

   void _onCheckboxChanged(bool? newValue) {
      setState(() {
         checkboxValue = newValue;
      });
   }

   void _passCheckboxValueToNull() {
     // if(Vos conditions pour passer la valeur à null) {
      // Usage le plus courant, une liste d'enfants checkbox avec certains checkés et d'autres non
      setState(() {
         checkboxValue = null; // Réinitialise la valeur à null
      });
      // }
   }

   @override
   Widget build(BuildContext context) {
      return Column(
         children: [
            CheckBoxWithText(
               value: checkboxValue,
               onChanged: _onCheckboxChanged,
               text: 'Option avec 3 états',
            ),
            SizedBox(height: 16),
            ElevatedButton(
               onPressed: __passCheckboxValueToNull,
               child: const Text('Repasser la valeur à null'),
            ),
         ],
      );
   }
}
```
## Explications
**Variable d'état :** **checkboxValue** est de type **bool?** et peut être **true**, **false** ou **null**.
**Fonction onChanged** :
Si **checkboxValue** est **null**, elle est définie à **true**.
Sinon, elle bascule entre true et false.
**Fonction __passCheckboxValueToNull** : Assigne **null** à **checkboxValue** lorsqu'elle est appelée.
**Widget CheckBoxWithText** :
 - **_value_** : Passe **checkboxValue** pour refléter l'état actuel.
 - **_onChanged_** : Fournit la fonction de rappel _**onCheckboxChanged**.
 - **_text_** : Le texte à afficher à côté de la **CheckBox**.
**Bouton de réinitialisation :**
Un **ElevatedButton** appelle _**_passCheckboxValueToNull** pour réinitialiser la **CheckBoxWithText** à null.

