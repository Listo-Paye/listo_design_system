# ConfirmationModal

La `ConfirmationModal` est un composant qui affiche une fenêtre modale afin de confirmer une action ou d’informer l’utilisateur. Elle peut s’utiliser avec ou sans logo.

## Présentation

La modale comprend :
- Un titre
- Un texte explicatif
- Deux boutons (primaire et secondaire)
- Une icône de fermeture (pour close/dismiss la modale)

### Avec ou sans logo
Le paramètre `withLogo` permet de définir si la modale doit afficher un logo (représenté par une icône de type “bulle” au-dessus du titre) ou non :
- `withLogo: true` : affiche le logo centré, le titre et le texte sont également centrés.
- `withLogo: false` : n’affiche pas le logo. Le titre et le texte sont alignés à gauche.

## Propriétés

| Propriété                  | Type         | Description                                                                                       |
|---------------------------|-------------|---------------------------------------------------------------------------------------------------|
| **withLogo**              | `bool`      | Affiche ou non le logo au-dessus du titre.                                                        |
| **title**                 | `String`    | Le titre de la modale.                                                                            |
| **body**                  | `String`    | Le texte explicatif affiché sous le titre.                                                        |
| **isDisabledPrimaryButton**   | `bool?`   | Permet de désactiver le bouton primaire (par défaut `false`).                                     |
| **isDisabledSecondaryButton** | `bool?`   | Permet de désactiver le bouton secondaire (par défaut `false`).                                   |
| **primaryButtonLabel**    | `String?`   | Personnalise le texte du bouton primaire (par défaut "Enregistrer").                              |
| **secondaryButtonLabel**  | `String?`   | Personnalise le texte du bouton secondaire (par défaut "Annuler").                                |
| **onClose**               | `VoidCallback` | Action exécutée lors de la fermeture de la modale (icône en haut à droite).                       |
| **primaryButtonAction**   | `VoidCallback` | Action liée au bouton primaire.                                                                   |
| **secondaryButtonAction** | `VoidCallback` | Action liée au bouton secondaire.                                                                 |

## Utilisation

1. Pour afficher la modale, vous pouvez simplement appeler la méthode `showDialog` et retourner un `CustomModal` :

```dart
void _showCustomModal({required bool withLogo}) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return ConfirmationModal(
        withLogo: withLogo,
        title: withLogo ? "Modale avec logo" : "Modale sans logo",
        body: "Voici le texte explicatif de la modale.",
        onClose: () {
          Navigator.of(dialogContext).pop();
        },
        secondaryButtonAction: () {
          Navigator.of(dialogContext).pop();
        },
        primaryButtonAction: () {
          Navigator.of(dialogContext).pop();
        },
      );
    },
  );
}
```


## Bonnes pratiques
 - Ne pas oublier de gérer la fermeture de la modale via le callback onClose si vous avez besoin de faire un traitement particulier avant sa fermeture.
 - Configurer les labels des boutons (primaryButtonLabel, secondaryButtonLabel) pour une meilleure accessibilité.
 - Utiliser les paramètres isDisabledPrimaryButton et isDisabledSecondaryButton si vous avez besoin de désactiver un bouton dans certains cas (par exemple, tant qu’un champ n’est pas renseigné).