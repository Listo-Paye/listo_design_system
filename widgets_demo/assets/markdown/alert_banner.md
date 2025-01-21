# Alert Banner Widget

## Description

Le **AlertBanner** est un composant visuel conçu pour afficher des notifications contextuelles ou des messages temporaires en haut de l'écran. Il offre une interface élégante et animée qui permet de transmettre rapidement des informations aux utilisateurs. Le widget prend en charge quatre types d'alertes : succès, information, avertissement et erreur.

## Fonctionnalités

- **Types d'alertes** :
    - Succès
    - Information
    - Avertissement
    - Erreur
- **Animations fluides** : Une animation de transition (slide) rend l'apparition et la disparition du widget naturelles et agréables.
- **Personnalisable** :
    - Titre optionnel
    - Texte principal obligatoire
    - Couleurs et styles adaptés au type d'alerte
- **Durée configurable** : Vous pouvez définir combien de temps le message reste visible avant de disparaître.
- **Bouton de fermeture** : Une croix permet de fermer manuellement la notification avant la fin de la durée.

## Comment utiliser le widget ?

### Exemple d'implémentation

Voici un exemple de création et d'utilisation du widget **AlertBanner** dans une application Flutter :

```dart
import 'package:flutter/material.dart';
import 'package:listo_design_system/molecules/notifications/alert_banner.dart';

class DemoAlertBanner extends StatelessWidget {
  const DemoAlertBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo Alert Banner")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => Stack(
                children: const [
                  AlertBanner(
                    title: "Succès",
                    text: "Votre action a été réalisée avec succès.",
                    status: AlertStatus.success,
                    duration: Duration(seconds: 3),
                  ),
                ],
              ),
            );
          },
          child: const Text("Afficher une alerte"),
        ),
      ),
    );
  }
}
```

### Paramètres disponibles

| Propriété | Type | Description |
|-----------|------|-------------|
| **title** | `String?` | (Optionnel) Le titre de l'alerte. Si non défini, seul le texte principal est affiché. |
| **text** | `String` | (Obligatoire) Le contenu principal de l'alerte. |
| **status** | `AlertStatus` | Le type d'alerte (success, info, warning, error). |
| **duration** | `Duration` | La durée pendant laquelle l'alerte est affichée avant de disparaître. |
| **onClose** | `VoidCallback?` | Une fonction appelée lorsque l'alerte est fermée manuellement ou automatiquement. |

### Explications des types d'alerte

| Type | Description | Couleur principale |
|------|-------------|-------------------|
| **success** | Indique une action réussie ou une validation. | Vert clair |
| **info** | Donne une information neutre ou informative. | Violet clair |
| **warning** | Alerte l'utilisateur d'une potentielle action risquée. | Orange clair |
| **error** | Indique qu'une erreur ou un problème est survenu. | Rouge clair |

## Accessibilité et bonnes pratiques

- **Labels accessibles** : Les textes affichés dans l'alerte sont accessibles aux lecteurs d'écran.
- **Durée adaptée** : Les messages d'information ou de succès peuvent disparaître rapidement (~3 secondes), tandis que les messages critiques (erreurs ou avertissements) peuvent rester visibles plus longtemps (~5 secondes).
- **Responsive** : Le widget est conçu pour fonctionner sur tous les types d'écrans.