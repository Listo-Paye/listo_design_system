### AdaptiveMasterDetails

Le widget `AdaptiveMasterDetails` est un widget qui permet d'afficher une liste d'éléments et de les afficher en détail lorsqu'un élément est sélectionné jusqu'à un troisième niveau de détail.

Selon la taille de l'écran, le widget affiche les éléments de la liste et le détail de l'élément sélectionné côte à côte ou l'un en dessous de l'autre pour les écrans plus petits.

### Propriétés et méthodes

* `child` : `Widget` - Le Widget permettant la sélection des premiers éléments
* `navigate` : `Function` - La fonction permettant de naviguer vers le détail de l'élément sélectionné
* `show` : `Function` - La fonction permettant d'afficher le détail du dernier niveau de détails
* `pop` : `Function` - La fonction permettant de revenir au niveau de détail précédent

> **ATTENTION** : Les fonctions `navigate`, `show` et `pop` doivent être appelées avec le contexte des éléments enfants.
> Ici, j'ai dû créer les StatelessWidget `ClientCardInList` et `CardListSelected` pour pouvoir utiliser les fonctions `navigate`, `show` et `pop` dans les éléments de la liste.

### Code source du presenter

```dart
class AdaptiveMdPresenter extends StatelessWidget {
  const AdaptiveMdPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ListoMainColors.primary.light,
        borderRadius: BorderRadius.circular(Radiuses.xs),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 400,
          child: AdaptiveMasterDetails(
            child: CardList(
              searchHintText: "Rechercher kk1",
              children: [
                ClientCard(
                  nomPrenomContrat: "FONTAINE Benoît Tech Lead",
                  dateDebut: DateTime(2023, 10, 16),
                  typeContrat: "CDI",
                ),
                ClientCard(
                  nomPrenomContrat: "SEMERIA Thomas Ingénieur Logiciel",
                  dateDebut: DateTime(2022, 07, 11),
                  typeContrat: "CDI",
                ),
                ClientCard(
                  nomPrenomContrat: "HUIBAN Raphael Développeur",
                  dateDebut: DateTime(2024, 04, 1),
                  typeContrat: "CDI",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClientCardInList extends ListoCard {
  final String nomPrenomContrat;
  final DateTime dateDebut;
  final String typeContrat;
  const ClientCardInList({
    super.key,
    required this.nomPrenomContrat,
    required this.dateDebut,
    required this.typeContrat,
  });

  @override
  Widget build(BuildContext context) {
    return ClientCard(
      nomPrenomContrat: nomPrenomContrat,
      dateDebut: dateDebut,
      typeContrat: typeContrat,
      onSelect: () {
        AdaptiveMasterDetails.navigate(
            context,
                (context) => Expanded(
              child: CardListSelected(
                nomPrenomContrat: nomPrenomContrat,
                dateDebut: dateDebut,
                typeContrat: typeContrat,
              ),
            ));
      },
    );
  }

  @override
  String getAllText() =>
      '$nomPrenomContrat ${DateFormat('dd/MM/yyyy').format(dateDebut)} / $typeContrat';
}

class CardListSelected extends StatelessWidget {
  final String nomPrenomContrat;
  final DateTime dateDebut;
  final String typeContrat;
  const CardListSelected({
    super.key,
    required this.nomPrenomContrat,
    required this.dateDebut,
    required this.typeContrat,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClientCard(
            nomPrenomContrat: nomPrenomContrat,
            dateDebut: dateDebut,
            typeContrat: typeContrat,
            chevron: Icons.close,
            onSelect: () {
              AdaptiveMasterDetails.pop(context);
              AdaptiveMasterDetails.pop(context);
            },
          ),
        ),
        CardList(
          searchHintText: "Rechercher",
          children: [
            ClientCard(
              nomPrenomContrat: "Sous liste elem1",
              dateDebut: DateTime(2023, 01, 16),
              typeContrat: "FIN",
              onSelect: () {
                AdaptiveMasterDetails.show(
                    context,
                        (context) => const Expanded(
                      child: Center(child: Text("Bien joué !")),
                    ));
              },
            ),
          ],
        ),
      ],
    );
  }
}

```