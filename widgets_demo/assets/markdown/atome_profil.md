## Profil

Un widget permettant d'afficher un profil utilisateur avec un bouton d'aide et les informations du profil.

## Description

Le widget `Profil` est un composant de l'interface utilisateur qui affiche une barre de navigation contenant un bouton d'aide et les informations de profil de l'utilisateur. Il est conçu pour être utilisé dans l'en-tête de l'application.

## Propriétés

| Propriété | Type | Obligatoire | Description |
|-----------|------|-------------|-------------|
| `label` | `String` | Oui | Le texte à afficher comme identifiant du profil. Sera automatiquement converti en minuscules. |
| `onHelpPressed` | `VoidCallback?` | Non | Fonction appelée lors du clic sur le bouton d'aide. |
| `onProfilPressed` | `VoidCallback?` | Non | Fonction appelée lors du clic sur la zone du profil. |

## Exemple d'utilisation

```dart
Profil(
  label: 'Jean Dupont',
  onHelpPressed: () {
    // Action lors du clic sur le bouton d'aide
  },
  onProfilPressed: () {
    // Action lors du clic sur le profil
  },
)
```

## Structure

Le widget est composé de :
1. Un bouton d'aide avec une icône `help_outline`
2. Une zone cliquable contenant :
    - Un label dans un conteneur avec fond coloré
    - Une icône de profil `account_circle`
