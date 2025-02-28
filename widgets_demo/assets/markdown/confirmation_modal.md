# ConfirmationModal

La `ConfirmationModal` est un composant qui affiche une fenêtre modale afin de confirmer une action ou d’informer l’utilisateur. Elle peut s’utiliser avec ou sans logo et offre également un mode "chargement" avec affichage d’un indicateur visuel.

## Présentation

La modale comprend :
- Un titre
- Un message explicatif
- Deux boutons d’action (annulation et validation)
- Une icône de fermeture de la modale (activable/désactivable)
- Une gestion optionnelle d’un état de chargement

### Avec ou sans logo
Le paramètre `withLogo` permet de définir si la modale doit afficher un logo (représenté par une icône de type “bulle” au-dessus du titre) ou non :
- `withLogo: true` : affiche le logo centré, le titre et le message sont également centrés.
- `withLogo: false` : n’affiche pas le logo. Le titre et le message sont alignés à gauche.

## Propriétés

| Propriété                      | Type          | Description                                                                                                           |
|--------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------------|
| **withLogo**                   | `bool`       | Affiche ou non le logo au-dessus du titre.                                                                            |
| **title**                      | `String`     | Le titre de la modale.                                                                                                |
| **message**                    | `String`     | Le message explicatif affiché sous le titre.                                                                          |
| **isLoading**                  | `bool`       | Active ou non le mode chargement (désaffichage des boutons d'action et de la croix de fermeture). Par défaut `false`. |
| **loadingTitle**                | `String?`    | Titre affiché en mode chargement. Par défaut : "En cours..."                                                          |
| **loadingMessage**              | `String?`    | Message affiché en mode chargement. Par défaut : "Veuillez patienter"                                                 |
| **isDisabledValidateButton**    | `bool?`      | Permet de désactiver le bouton de validation (par défaut `false`).                                                    |
| **isDisabledCancelButton**      | `bool?`      | Permet de désactiver le bouton d’annulation (par défaut `false`).                                                     |
| **isDisabledCloseIcon**         | `bool?`      | Permet de désactiver l’icône de fermeture (par défaut `false`).                                                       |
| **validateButtonLabel**         | `String?`    | Personnalise le texte du bouton de validation (par défaut "Enregistrer").                                             |
| **cancelButtonLabel**           | `String?`    | Personnalise le texte du bouton d'annulation (par défaut "Annuler").                                                  |
| **onValidate**                  | `VoidCallback` | Action liée au bouton de validation.                                                                                  |
| **onCancel**                    | `VoidCallback` | Action liée au bouton d’annulation.                                                                                   |

## Utilisation

1. **Modale avec loader** : au clic sur "Enregistrer", la modale passe en mode chargement pendant 2 secondes avant de se fermer.
2. **Modale sans loader** : au clic sur "Enregistrer", les boutons et la croix sont désactivés pendant 2 secondes avant la fermeture.

```dart
void _showCustomModalWithLoader(BuildContext context) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      bool isLoading = false;

      return StatefulBuilder(
        builder: (ctx, setState) {
          return ConfirmationModal(
            withLogo: true,
            title: "Modale avec loader",
            message: "Cliquez sur 'Enregistrer' pour valider avec affichage d'un loader.",
            isLoading: isLoading,
            onValidate: () {
              setState(() {
                isLoading = true;
              });
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.of(dialogContext).pop();
              });
            },
            onCancel: () {
              Navigator.of(dialogContext).pop();
            },
          );
        },
      );
    },
  );
}

void _showCustomModalWithoutLoader(BuildContext context) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      bool isDisabled = false;

      return StatefulBuilder(
        builder: (ctx, setState) {
          return ConfirmationModal(
            withLogo: false,
            title: "Modale sans loader",
            message: "Cliquez sur 'Enregistrer' pour valider sans affichage de loader.",
            isDisabledCloseIcon: isDisabled,
            isDisabledCancelButton: isDisabled,
            isDisabledValidateButton: isDisabled,
            onValidate: () {
              setState(() {
                isDisabled = true;
              });
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.of(dialogContext).pop();
              });
            },
            onCancel: () {
              Navigator.of(dialogContext).pop();
            },
          );
        },
      );
    },
  );
}
```

## Bonnes pratiques

- **Utiliser le mode chargement** (`isLoading`) lorsque l’action de validation implique un traitement long.
- **Désactiver les boutons et la croix** (`isDisabledValidateButton`, `isDisabledCancelButton`, `isDisabledCloseIcon`) si vous voulez empêcher l’utilisateur d'effectuer l'action correspondante au bouton.
- **Personnaliser les labels** (`validateButtonLabel`, `cancelButtonLabel`) pour une meilleure accessibilité.
- **Ne pas oublier de fermer la modale** via `Navigator.of(context).pop()` après une action.


