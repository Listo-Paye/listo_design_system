# Contribution au Design System

## Ajout de Composants

Pour ajouter des éléments à Widgetbook sans utiliser le générateur de code, suivez ces étapes :

### Créer un composant
Chaque composant est un widget Flutter qui représente un élément de l'interface utilisateur. Pour ajouter un composant :
1. Choisissez le type de composant que vous souhaitez ajouter (atome, molécule). Les organismes ou autres widgets stateful complexes ne sont pas recommandés.
2. Créez un nouveau fichier Dart dans le dossier `lib/components/{type de composant}`.
3. Implémentez le widget en suivant les spécifications du design.
4. Exportez le composant dans le fichier `lib/{type de composant}/{type de composant}_module.dart`.

### Documenter le composant sur Widgetbook
La documentation du composant ajouté est indispensable pour permettre aux utilisateurs de comprendre son utilisation et ses variantes.

Pour celà, il suffit de respecter 3 étapes :
1. Ajouter un fichier Markdown dans le dossier `widgets_demo/assets/markdown` avec le nom du composant et le contenu de la documentation.
2. Ajouter un widget dans le dossier `widgets_demo/lib/components` selon le modèle suivant :
   * Répertoire associé (atomes, molecules, themes) selon l'objectif et la hierarchies du composant dans le design atomique.
   * Fichier nommé selon le composant (vous pouvez créer un répertoire pour les composants complexes).
   * Le widget ainsi créé sera utilisé pour afficher le composant dans Widgetbook.
   * Créer les éléments d'affichage du composant :
     ```dart
     WidgetbookComponent alertsAtom(BuildContext context) {
       return WidgetbookComponent(name: "Alertes", useCases: [
         usercaseWithMarkdown(
           "Alertes",
           (context) => const AlertsPresenter(),
           "markdown/atome_alert.md",
         ),
       ]);
     } 
     ```
   * Ajouter le composant à la liste des composants dans le fichier `widgets_demo/lib/components/{type de composant}/{type de composant}_module.dart` :
     ```dart
     WidgetbookCategory getAtomesCategory(BuildContext context) {
       return WidgetbookCategory(name: "Atomes", children: [
         buttonsAtom(context),
         alertsAtom(context),
       ]);
     }
     ```


## Règles de Commit

Utilisez le format de message suivant pour les commits liés au design system :

```
feat(design): [Description courte du changement]
```

#### Types de Commit

- **feat**: Ajout d'une nouvelle fonctionnalité.
- **fix**: Correction d'un bug.
- **docs**: Modification de la documentation.
- **style**: Modification du style du code.
- **refactor**: Modification du code sans ajouter de fonctionnalité ni corriger de bug.
- **perf**: Modification du code pour améliorer les performances.
- **book**: Ajout ou modification de la partie WidgetBook (comportement général).

## Design Moléculaire

Le design moléculaire au sein du Listo Design System est une approche méthodique pour construire des interfaces
utilisateur qui s'alignent étroitement avec le design de l'application Listo Paye. Cette approche favorise la cohérence
et la réutilisabilité des composants UI/UX à travers l'application.

### Principes

Dans notre système, chaque composant UI dans Flutter correspond directement à un élément de design dans Figma. Cette
corrélation directe permet une traduction presque littérale des designs de Figma en composants Flutter.

#### Avantages

- **Uniformité et Consistance**: Cette méthodologie assure que l'interface utilisateur de l'application reflète
  fidèlement les designs créés dans Figma.
- **Facilité de Collaboration**: Les designers et développeurs peuvent travailler plus efficacement en ayant une source
  de vérité commune pour les composants UI.
- **Réduction des Erreurs**: Minimise les écarts entre le design et l'implémentation, réduisant ainsi les erreurs
  d'interprétation.

### Mise en Œuvre

#### Nomination des Composants

- Chaque composant dans Figma doit avoir un nom unique et descriptif.
- Les noms des composants dans Flutter doivent correspondre exactement à ceux de Figma pour faciliter la recherche et
  l'identification.

#### Structuration des Composants

- **Atomes**: Éléments de base comme les boutons, les icônes, et les champs de texte.
- **Molécules**: Combinaisons d'atomes pour former des composants plus complexes, comme un champ de recherche avec un
  bouton.
- **Organismes**: Combinaisons de molécules pour créer des sections d'interface utilisateur, comme un en-tête avec
  navigation intégrée.

#### Exemple Pratique

Prenons un bouton simple comme exemple. Dans Figma, le bouton est conçu avec des spécifications précises pour la
couleur, la taille, la police, etc. Ce bouton est ensuite reproduit dans Flutter avec les mêmes spécifications, en
veillant à utiliser le même nom pour le composant.

### Documentation et Standards

- Chaque composant doit être accompagné d'une documentation détaillant son utilisation, ses variantes, et ses
  paramètres.
- Les standards de design doivent être clairement définis et accessibles pour assurer une utilisation cohérente des
  composants.

En suivant ces principes, le Listo Design System s'assure que les équipes de design et de développement travaillent en
harmonie, en réduisant le fossé entre la vision du design et sa mise en œuvre technique.

## Thème Material dans Flutter

Flutter utilise le Material Design comme langage de conception principal. Avec l'introduction de Material Design 3, de
nouvelles possibilités s'ouvrent pour créer des applications encore plus modernes et visuellement attrayantes.

### Material Design 3

Material Design 3, la dernière itération du système de design de Google, apporte des améliorations significatives telles
que :

- **Couleur Dynamique** : S'adapte automatiquement pour harmoniser avec les préférences de couleur de l'utilisateur,
  améliorant ainsi l'expérience utilisateur.
- **Composants Actualisés** : Des éléments de l'interface utilisateur redessinés pour une meilleure accessibilité et
  esthétique.
- **Personnalisation Renforcée** : Permet une personnalisation plus poussée des thèmes, y compris des typographies et
  des formes.

## Bonnes Pratiques de Design Material

- **Cohérence**: Assurez-vous que votre thème est cohérent dans toute l'application pour une expérience utilisateur
  unifiée.
- **Accessibilité**: Choisissez des couleurs et des tailles de police qui sont faciles à lire et accessibles à tous les
  utilisateurs.
- **Responsivité**: Votre thème doit s'adapter harmonieusement à différentes tailles d'écran et orientations.

## Animations dans Flutter

Les animations sont un aspect crucial de l'expérience utilisateur dans les applications mobiles. Flutter offre un
système d'animation robuste qui peut être utilisé pour créer des animations fluides et réactives.

### Types d'Animations

#### Animations Implicites

Les animations implicites sont les plus simples à mettre en œuvre dans Flutter. Elles sont idéales pour des transitions
de propriétés simples, comme la couleur, la taille ou la rotation.

- **Widgets Utilisés** : `AnimatedContainer`, `AnimatedOpacity`, `TweenAnimationBuilder`, etc.
- **Quand les Utiliser** : Pour des animations simples où la destination finale est connue à l'avance.
- **Documentation** : Consultez la
  section [Animations implicites](https://docs.flutter.dev/development/ui/animations/implicit-animations) dans la
  documentation de Flutter.

#### Animations Explicites

Les animations explicites offrent un contrôle plus précis sur le comportement de l'animation. Elles sont utiles pour des
animations complexes où vous avez besoin de contrôler le timing et la séquence des animations.

- **Widgets Utilisés** : `AnimationController`, `AnimatedBuilder`, `CustomTween`, etc.
- **Quand les Utiliser** : Pour des animations complexes avec des contrôles de timing personnalisés.
- **Documentation** : La section [Animations explicites](https://docs.flutter.dev/development/ui/animations/tutorial) de
  la documentation Flutter offre un guide détaillé.

### Bonnes Pratiques

1. **Choisir le Type d'Animation Approprié** : Utilisez des animations implicites pour des transitions simples et des
   animations explicites pour des cas plus complexes.
2. **Performance** : Veillez à ce que vos animations ne diminuent pas les performances de l'application.
   Utilisez `flutter run --profile` pour identifier les problèmes de performance.
3. **Accessibilité** : Assurez-vous que vos animations ne nuisent pas à l'accessibilité. Fournissez des alternatives
   pour les utilisateurs qui préfèrent réduire le mouvement.

#### Transition de Navigation

Pour créer une transition de navigation animée :

- Utilisez le widget `Hero` pour des transitions fluides entre les écrans.
- Consultez [Naviguer avec des animations](https://docs.flutter.dev/cookbook/animation/navigation-basics) dans la
  documentation Flutter pour plus d'informations.

### Package `animations`

Le package `animations` fournit une collection de widgets d'animation préfabriqués.

- **Utilisation** : Intégrez le package dans votre `pubspec.yaml` et utilisez des widgets comme `OpenContainer`
  ou `SharedAxisTransition`.
- **Documentation** : Pour plus d'informations, consultez la page
  du [package animations](https://pub.dev/packages/animations).

### Package `rive`

Rive est un outil puissant pour créer des animations et des graphiques interactifs.

- **Intégration** : Ajoutez `rive` à votre `pubspec.yaml` et utilisez le widget `Rive` pour afficher des animations
  Rive.
- **Utilisation** : Créez des animations avec l'éditeur Rive et exportez-les pour une utilisation dans Flutter.
- **Documentation** : Visitez la [documentation de Rive](https://docs.rive.app/) pour des guides détaillés.