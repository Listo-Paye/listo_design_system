# Listo Design System

Le Listo Design System est une bibliothèque de composants UI/UX pour l'application de gestion de la paie Listo Paye.

## Comment Utiliser notre Widgetbook ?

Vous pouvez l'utiliser directement à cette adresse. Voyagez entre les catégories et les composants pour découvrir notre design system.

Quelques définissions :
- **Widget** : Un widget est un élément d'interface utilisateur qui peut être affiché à l'écran. Les widgets sont des éléments de base de Flutter et sont utilisés pour créer des interfaces utilisateur.
- **Widgetbook** : Un widgetbook est un outil qui permet de visualiser et d'interagir avec les widgets d'une application Flutter. Il est utile pour explorer et tester les composants d'une application.
- **Device** : A droite de votre écran, vous pouvez choisir le device sur lequel vous souhaitez visualiser votre application. Il existe un large choix qui donne un aperçu de la plupart des devices existants.
- **Knob** : Un knob est un paramètre d'un widget qui peut être modifié pour changer son apparence ou son comportement. Les knobs sont utilisés pour tester les différentes variantes d'un widget.
- **Story** : Une story est une collection de widgets qui sont regroupés pour former un composant plus complexe. Les stories sont utilisées pour tester les interactions entre les widgets.
- **Code** : Le code d'un widget est affiché dans la partie inférieure de l'écran. Il peut être copié et collé dans votre projet Flutter pour une utilisation ultérieure.


## Design Moléculaire

Le design moléculaire au sein du Listo Design System est une approche méthodique pour construire des interfaces utilisateur qui s'alignent étroitement avec le design de l'application Listo Paye. Cette approche favorise la cohérence et la réutilisabilité des composants UI/UX à travers l'application.

### Principe

Dans notre système, chaque composant UI dans Flutter correspond directement à un élément de design dans Figma. Cette corrélation directe permet une traduction presque littérale des designs de Figma en composants Flutter.

#### Avantages

- **Uniformité et Consistance**: Cette méthodologie assure que l'interface utilisateur de l'application reflète fidèlement les designs créés dans Figma.
- **Facilité de Collaboration**: Les designers et développeurs peuvent travailler plus efficacement en ayant une source de vérité commune pour les composants UI.
- **Réduction des Erreurs**: Minimise les écarts entre le design et l'implémentation, réduisant ainsi les erreurs d'interprétation.

### Mise en Œuvre

#### Nomination des Composants

- Chaque composant dans Figma doit avoir un nom unique et descriptif.
- Les noms des composants dans Flutter doivent correspondre exactement à ceux de Figma pour faciliter la recherche et l'identification.

#### Structuration des Composants

- **Atomes**: Éléments de base comme les boutons, les icônes, et les champs de texte.
- **Molécules**: Combinaisons d'atomes pour former des composants plus complexes, comme un champ de recherche avec un bouton.
- **Organismes**: Combinaisons de molécules pour créer des sections d'interface utilisateur, comme un en-tête avec navigation intégrée.

#### Exemple Pratique

Prenons un bouton simple comme exemple. Dans Figma, le bouton est conçu avec des spécifications précises pour la couleur, la taille, la police, etc. Ce bouton est ensuite reproduit dans Flutter avec les mêmes spécifications, en veillant à utiliser le même nom pour le composant.

### Documentation et Standards

- Chaque composant doit être accompagné d'une documentation détaillant son utilisation, ses variantes, et ses paramètres.
- Les standards de design doivent être clairement définis et accessibles pour assurer une utilisation cohérente des composants.

En suivant ces principes, le Listo Design System s'assure que les équipes de design et de développement travaillent en harmonie, en réduisant le fossé entre la vision du design et sa mise en œuvre technique.

## Thème Material dans Flutter

Flutter utilise le Material Design comme langage de conception principal. Avec l'introduction de Material Design 3, de nouvelles possibilités s'ouvrent pour créer des applications encore plus modernes et visuellement attrayantes.

### Material Design 3

Material Design 3, la dernière itération du système de design de Google, apporte des améliorations significatives telles que :

- **Couleur Dynamique** : S'adapte automatiquement pour harmoniser avec les préférences de couleur de l'utilisateur, améliorant ainsi l'expérience utilisateur.
- **Composants Actualisés** : Des éléments de l'interface utilisateur redessinés pour une meilleure accessibilité et esthétique.
- **Personnalisation Renforcée** : Permet une personnalisation plus poussée des thèmes, y compris des typographies et des formes.

### Génération de Thème Material 3

Pour créer un thème Material Design 3 pour votre application Flutter, vous pouvez utiliser l'outil suivant :

#### Material Theme Builder

Material Theme Builder est un outil en ligne qui permet de personnaliser les couleurs, la typographie et les formes pour créer un thème Material Design 3. Vous pouvez accéder à cet outil via [Material Theme Builder](https://material-foundation.github.io/material-theme-builder/#/).

#### Utilisation

1. Sélectionnez vos couleurs primaires, secondaires et d'erreur.
2. Ajustez la typographie et les formes selon vos préférences.
3. Une fois votre thème créé, exportez-le sous forme de code Dart à intégrer dans votre projet Flutter.

### Intégration dans Flutter

Intégrez le thème généré dans votre application Flutter :

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listo Paye',
      theme: ThemeData(
        // Utilisez ici le thème personnalisé généré
      ),
      home: MyHomePage(),
    );
  }
}
```

## Bonnes Pratiques de Design Material

- **Cohérence**: Assurez-vous que votre thème est cohérent dans toute l'application pour une expérience utilisateur unifiée.
- **Accessibilité**: Choisissez des couleurs et des tailles de police qui sont faciles à lire et accessibles à tous les utilisateurs.
- **Responsivité**: Votre thème doit s'adapter harmonieusement à différentes tailles d'écran et orientations.

## Animations dans Flutter

Les animations sont un aspect crucial de l'expérience utilisateur dans les applications mobiles. Flutter offre un système d'animation robuste qui peut être utilisé pour créer des animations fluides et réactives.

### Types d'Animations

#### Animations Implicites

Les animations implicites sont les plus simples à mettre en œuvre dans Flutter. Elles sont idéales pour des transitions de propriétés simples, comme la couleur, la taille ou la rotation.

- **Widgets Utilisés** : `AnimatedContainer`, `AnimatedOpacity`, `TweenAnimationBuilder`, etc.
- **Quand les Utiliser** : Pour des animations simples où la destination finale est connue à l'avance.
- **Documentation** : Consultez la section [Animations implicites](https://docs.flutter.dev/development/ui/animations/implicit-animations) dans la documentation de Flutter.

#### Animations Explicites

Les animations explicites offrent un contrôle plus précis sur le comportement de l'animation. Elles sont utiles pour des animations complexes où vous avez besoin de contrôler le timing et la séquence des animations.

- **Widgets Utilisés** : `AnimationController`, `AnimatedBuilder`, `CustomTween`, etc.
- **Quand les Utiliser** : Pour des animations complexes avec des contrôles de timing personnalisés.
- **Documentation** : La section [Animations explicites](https://docs.flutter.dev/development/ui/animations/tutorial) de la documentation Flutter offre un guide détaillé.

### Bonnes Pratiques

1. **Choisir le Type d'Animation Approprié** : Utilisez des animations implicites pour des transitions simples et des animations explicites pour des cas plus complexes.
2. **Performance** : Veillez à ce que vos animations ne diminuent pas les performances de l'application. Utilisez `flutter run --profile` pour identifier les problèmes de performance.
3. **Accessibilité** : Assurez-vous que vos animations ne nuisent pas à l'accessibilité. Fournissez des alternatives pour les utilisateurs qui préfèrent réduire le mouvement.

#### Transition de Navigation

Pour créer une transition de navigation animée :

- Utilisez le widget `Hero` pour des transitions fluides entre les écrans.
- Consultez [Naviguer avec des animations](https://docs.flutter.dev/cookbook/animation/navigation-basics) dans la documentation Flutter pour plus d'informations.

### Package `animations`

Le package `animations` fournit une collection de widgets d'animation préfabriqués.

- **Utilisation** : Intégrez le package dans votre `pubspec.yaml` et utilisez des widgets comme `OpenContainer` ou `SharedAxisTransition`.
- **Documentation** : Pour plus d'informations, consultez la page du [package animations](https://pub.dev/packages/animations).

### Package `rive`

Rive est un outil puissant pour créer des animations et des graphiques interactifs.

- **Intégration** : Ajoutez `rive` à votre `pubspec.yaml` et utilisez le widget `Rive` pour afficher des animations Rive.
- **Utilisation** : Créez des animations avec l'éditeur Rive et exportez-les pour une utilisation dans Flutter.
- **Documentation** : Visitez la [documentation de Rive](https://docs.rive.app/) pour des guides détaillés.

En suivant ces lignes directrices et en tirant parti des ressources disponibles, vous pouvez créer des animations impressionnantes qui améliorent l'expérience utilisateur de votre application Flutter.