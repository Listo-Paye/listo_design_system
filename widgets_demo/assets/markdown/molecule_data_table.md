# Utiliser la ListoDataTable

La ListoDataTable est un widget qui permet d'afficher des données sous forme de tableau. Elle est très flexible et
permet de personnaliser l'affichage des données.

## Utilisation

Pour utiliser correctement la ListoDataTable il faut lui passer la `data` sous forme de `List` ainsi
que `formattedValues` qui est un `Map` de vos colonnes et contenu de cellule

## Exemple

```dart
// Exemple de classe de données
class JourFerieTravaille {
  final String nom;
  final bool solidarite;
  final bool jourTravaille;

  JourFerieTravaille({
    required this.nom,
    required this.solidarite,
    required this.jourTravaille,
  });
}

class ListoDataTableExample extends StatelessWidget {
  const ListoDataTableExample({super.key});
  // Exemple de données
  final List<JourFerieTravaille> data = [
    JourFerieTravaille(
      solidarite: true,
      jourTravaille: true,
    ),
    JourFerieTravaille(
      nom: "Mardi gras",
      solidarite: false,
      jourTravaille: true,
    ),
    JourFerieTravaille(
      nom: "Toussaint",
      solidarite: false,
      jourTravaille: false,
    ),
  ];
  // Exemple de mapping colonnes/cellules
  final formattedValues = <String, Widget Function(JourFerieTravaille)>{
    'Nom du jour férié': (JourFerieTravaille item) =>
        Text(
          item.nom,
          style: TextStyles.bodyMediumSemibold
              .copyWith(color: ListoMainColors.neutral[900]),
        ),
    'Jour réel': (JourFerieTravaille item) =>
        Text(item.date.toIso8601String(),
            style:
            TextStyles.bodyMedium.copyWith(color: ListoMainColors.neutral[900])),
    'Jour travaillé': (JourFerieTravaille item) {
      if (item.solidarite) {
        return Row(children: [
          Tag(
            label: item.jourTravaille ? 'Oui' : 'Non',
            type: item.jourTravaille ? TagColors.success : TagColors.base,
          ),
          const SizedBox(width: Spacings.sm),
          Text('Journée de solidarité', style: TextStyles.bodyMediumSemibold)
        ]);
      }

      return Tag(
        label: item.jourTravaille ? 'Oui' : 'Non',
        type: item.jourTravaille ? TagColors.success : TagColors.base,
      );
    },
  };

  // Exemple de Sort custom par colonne
  final sortableExtractors = <String, Comparator<JourFerieTravaille>>{
    'Nom du jour férié': (itemA, itemB) => itemA.nom.compareTo(itemB.nom),
    'Jour réel': (itemA, itemB) => itemA.date.compareTo(itemB.date),
    'Jour travaillé': (itemA, itemB) => itemA.jourTravaille ? 1 : -1,
  };

  const title = 'Jours fériés travaillés';


  @override
  Widget build(BuildContext context) {
    return ListoDataTable<JourFerieTravaille>(
      title: title,
      data: data,
      formattedValues: formattedValues,
      sortableValues: sortableExtractors,
    );
  }
}
```




