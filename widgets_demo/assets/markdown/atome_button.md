# Utiliser les boutons

Les boutons sont des éléments qui permettent d'effectuer une action. Ils sont utilisés pour valider un formulaire, pour naviguer vers une autre page, etc.

## Utilisation

Pour utiliser un bouton, il faut utiliser le widget `Button` :

```dart
class ButtonPresenter extends StatelessWidget {
  final String title;
  final ButtonType type;
  const ButtonPresenter({
    super.key,
    this.title = "Primary",
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: FormTitle(data: title),
        ),
        Expanded(
          child: Center(
            child: Button(
              style: type,
              image: const Icon(
                Icons.login,
              ),
              width: 150,
              onPressed: () {},
              enabled: true,
              text: "Button",
            ),
          ),
        )
      ],
    );
  }
}
```
