# Popin (Modale de dialogue)

Un widget de dialogue modal personnalisé qui affiche des messages d'information ou d'alerte.

## Types

```dart
enum PopinType {
  info,    // Style informatif (bleu)
  danger,  // Style d'alerte (rouge)
}
```

## Paramètres

| Paramètre | Type | Requis | Description |
|-----------|------|--------|-------------|
| title | String | Oui | Titre de la modale |
| message | String | Oui | Message principal |
| actionButtonText | String | Oui | Texte du bouton d'action principal |
| cancelButtonText | String | Oui | Texte du bouton d'annulation |
| type | PopinType | Non | Type de la popin (défaut: info) |

## Utilisation

```dart
showPopin(
  context: context,
  title: 'Confirmation',
  message: 'Voulez-vous continuer ?',
  actionButtonText: 'Confirmer',
  cancelButtonText: 'Annuler',
  type: PopinType.info,
);
```

## Notes Techniques

- Largeur fixe de 450px
- Boutons disposés horizontalement avec espacement
- Styles personnalisés selon le type (info/danger)
- Utilise le système de design Listo pour les couleurs et styles
