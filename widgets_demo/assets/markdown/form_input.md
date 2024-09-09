## Saisie de texte

### InputText

```dart
InputText(hintText: "Texte", initialValue: "Initial value", onChanged: (value) => print(value)))
```

### InputAmount

```dart
InputAmount(hintText: "Montant", initialValue: "Initial value", onChanged: (value) => print(value)))
```

### TextArea

```dart
TextArea(hintText: "Commentaire", initialValue: "Initial value", onChanged: (value) => print(value))))
```

### Créer son propre Input
Pour l'utiliser, il suffit de créer un Widget qui utilise le BaseInputText.

En voici le code source :

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/colors.dart';
import '../../themes/spacing.dart';

class BaseInputText extends StatelessWidget {
  final String hintText;
  final List<TextInputFormatter> formatters;
  final InputDecoration decoration;
  final String? initialValue;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  const BaseInputText({
    super.key,
    this.hintText = '',
    this.initialValue,
    this.onChanged,
    this.formatters = const [],
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ListoMainColors.primary.ultraLight,
      child: TextField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: decoration.copyWith(
          labelText: hintText,
          alignLabelWithHint: maxLines != null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Spacings.sm,
            vertical: Spacings.xs,
          ),
        ),
        textAlignVertical: (maxLines != null) ? TextAlignVertical.top : null,
        inputFormatters: [...formatters],
        onChanged: onChanged,
        controller: TextEditingController(text: initialValue),
      ),
    );
  }
}
```

et un exemple d'utilisation :
    
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../themes/colors.dart';
import 'base_input_text.dart';

class InputAmount extends StatelessWidget {
  final String hintText;
  final double? initialValue;
  final void Function(double?)? onChanged;

  const InputAmount({
    super.key,
    required this.hintText,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInputText(
      key: key ?? ValueKey('InputAmount_$hintText'),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      hintText: hintText,
      initialValue: (initialValue == null)
          ? null
          : AmountFormatter.formatter.format(initialValue),
      formatters: [AmountFormatter()],
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.euro),
        prefixIconColor: ListoMainColors.primary.base,
      ),
      onChanged: (value) {
        if (value.isEmpty) {
          onChanged?.call(null);
        } else {
          onChanged?.call(AmountFormatter.formatter.parse(value));
        }
      },
    );
  }
}

class AmountFormatter extends TextInputFormatter {
  static get formatter => NumberFormat.decimalPatternDigits(
        locale: 'fr_FR',
        decimalDigits: 2,
      );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }
    var value = formatter.tryParse(newValue.text)?.toDouble();
    if (value == null) {
      return oldValue;
    }
    return newValue.copyWith(
      text: formatter.format(value),
    );
  }
}
```

Vous remarquerez que j'utilise ici un TextInputFormatter custom pour formater les montants. Vous pouvez créer vos propres formatters pour formater les données saisies dans vos champs de texte.

Mais vous pouvez aussio utiliser les formatters fournis par Flutter, comme par exemple :

```dart
FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
FilteringTextInputFormatter.digitsOnly,
FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z]')),
FilteringTextInputFormatter.singleLineFormatter,
FilteringTextInputFormatter.deny(RegExp(r'[ ]')),
```

Vous pouvez en apprendre plus sur les RegExp sur ce [lien](https://en.wikipedia.org/wiki/Regular_expression#POSIX_basic_and_extended).
