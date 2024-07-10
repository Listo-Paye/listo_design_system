## Utiliser la ListoDataTable

La ListoDataTable est un widget qui permet d'afficher des données sous forme de tableau. Elle est très flexible et
permet de personnaliser l'affichage des données.

### Propriétés

* **title (String)**: Le titre de la table, affiché au-dessus des données.
* **data (List<T>)**: La liste des données qui seront affichées dans le tableau.
* **formattedValues (Map<String, Widget Function(T)>)**: Un dictionnaire où la clé est le titre de la colonne et la
  valeur est une fonction retournant un widget. Cette fonction prend en paramètre un élément de type T de la liste data.
* **sortableValues (Map<String, Comparator<T>>)**: Un dictionnaire où la clé est le titre de la colonne et la valeur est
  un comparateur utilisé pour le tri des éléments.
* **subtitle (String?)**: Un sous-titre optionnel affiché sous le titre si null, le sous-titre n'est pas affiché.
* **subtitleTagValue (bool?)**: Un boolean optionnel pour afficher un tag "Activé" ou "Désactivé" à côté du sous-titre,
  si null, le tag n'est pas affiché.

### Exemple

Voici un exemple d'utilisation de ListoDataTable avec une classe de données et des définitions personnalisées pour l'
affichage et le tri.

#### Pour cet exemple nous allons utiliser la classe de données à afficher suivante :

```dart
class JourFerieTravaille {
  final String nom;
  final DateTime date;
  final bool solidarite;
  final bool jourTravaille;

  JourFerieTravaille({
    required this.nom,
    required this.date,
    required this.solidarite,
    required this.jourTravaille,
  });
}
```

#### Voici un exemple de ListoDataTable avec des données de jours fériés travaillés :

```dart
class ListoDataTableExample extends StatelessWidget {
  const ListoDataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      JourFerieTravaille(
        nom: "Nouvel An",
        date: DateTime(2024, 1, 1),
        solidarite: false,
        jourTravaille: false,
      ),
      // Autres jours fériés...
    ];

    return ListoDataTable<JourFerieTravaille>(
      title: 'Jours fériés travaillés',
      data: data,
      formattedValues: { /* Voir l'exemple suivant pour les détails */
      },
      sortableValues: { /* Voir l'exemple suivant pour les détails */
      },
    );
  }
}
```

#### Configuration des cellules avec `formattedValues`

```dart

final formattedValues = <String, Widget Function(JourFerieTravaille)>{
  'Nom du jour férié': (item) => Text(item.nom),
  'Jour réel': (item) => Text(item.date.toIso8601String()),
  'Jour travaillé': (item) =>
      Tag(
        label: item.jourTravaille ? 'Oui' : 'Non',
        type: item.jourTravaille ? TagColors.success : TagColors.base,
      ),
};
```

#### Configuration du tri avec `sortableValues`

```dart

final sortableValues = <String, Comparator<JourFerieTravaille>>{
  'Nom du jour férié': (itemA, itemB) => itemA.nom.compareTo(itemB.nom),
  'Jour réel': (itemA, itemB) => itemA.date.compareTo(itemB.date),
  'Jour travaillé': (itemA, itemB) => itemA.jourTravaille ? 1 : -1,
};
```