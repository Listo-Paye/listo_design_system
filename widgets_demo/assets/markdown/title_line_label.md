### Ligne de titre avec ou sans sous-titre

Le TitleLine peut s'utiliser avec un libellé si vous ne souhaitez pas d'interaction.

```dart
TitleLine(
    title: title,
    label: label,
    selectedValue: value,
    actions: [
      IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          // Do something
        },
      ),
    ],
)
```

Vous pouvez forcer le mode mobile en ajoutant le paramètre `forcedMobile: true`.

```dart
TitleLine(
  title: title,
  label: label,
  selectedValue: value,
  forcedMobile: true,
)
```

> **Note**: Il est important de noter que le TitleLine est adaptatif mais que les actions ne sont pas disponibles en mobile.
