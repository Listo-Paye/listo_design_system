### Utilisation

Celle-ci s'utilise comme une Card standard, mais avec un titre et un contenu spécifique.

```dart
Center(
    child: SizedBox(
      width: 411,
      child: ClientCard(
        onSelect: () {},
        nomPrenomContrat: "Nom Prénom contrat",
        dateDebut: DateTime.now(),
        typeContrat: "CDI",
      ),
    ),
)
```

Il est à noter que le `onSelect` est une fonction qui sera appelée lorsqu'on appuie sur la carte.
Si celle-ci est nulle, alors la carte ne sera pas cliquable.