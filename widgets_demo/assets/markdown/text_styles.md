--- 
### Installation

Pour utiliser les fonts rajouter dans votre pubspeck.yaml : 

```yaml
  fonts:
    - family: Inter
      fonts:
        - asset: packages/listo_design_system/fonts/Inter-Regular.ttf
          weight: 400
        - asset: packages/listo_design_system/fonts/Inter-Medium.ttf
          weight: 500
        - asset: packages/listo_design_system/fonts/Inter-SemiBold.ttf
          weight: 600
        - asset: packages/listo_design_system/fonts/Inter-Bold.ttf
          weight: 700
        - asset: packages/listo_design_system/fonts/Inter-ExtraBold.ttf
          weight: 800
```

A l'utilisation il faut passer par la class `TextStyles` pour utiliser les fonts. 

```dart
Text(
  'Hello World',
  style: TextStyles.headingLarge,
),
```

On peut faire une copyWith pour changer les propriétés du text. 

```dart
Text(
  'Hello World',
  style: TextStyles.headingLarge.copyWith(
    color: ListoMainColors.primary.base,
  ),
),
```
