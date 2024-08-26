### AdaptiveMasterDetails

Le widget `AdaptiveMdd` est un widget qui permet d'afficher une liste d'éléments et de les afficher en détail lorsqu'un élément est sélectionné jusqu'à un troisième niveau de détail.

Selon la taille de l'écran, le widget affiche les éléments de la liste et le détail de l'élément sélectionné côte à côte ou l'un en dessous de l'autre pour les écrans plus petits.

### Propriétés et méthodes

* `first` : `Widget` - Le Widget permettant la sélection des premiers éléments
* `others` : `List<Widget>` - La liste des Widgets à afficher en détail

### Code source du presenter

```dart
class AdaptiveMdPresenter extends StatefulWidget {
  const AdaptiveMdPresenter({super.key});

  @override
  State<AdaptiveMdPresenter> createState() => _AdaptiveMdPresenterState();
}

class _AdaptiveMdPresenterState extends State<AdaptiveMdPresenter> {
  List<Widget> columns = [];

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
          child: AdaptiveMdd(
            first: ClientCardList(
              onClick: (np, dt, typ) {
                var retour = ClientCard(
                  nomPrenomContrat: np,
                  dateDebut: dt,
                  typeContrat: typ,
                  chevron: Icons.close,
                  onSelect: () {
                    setState(() {
                      columns = [];
                    });
                  },
                );
                setState(() {
                  columns = [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        retour,
                        const SizedBox(height: 8),
                        const Expanded(child: VarAppCardList()),
                      ],
                    )
                  ];
                });
              },
            ),
            others: [...columns],
          ),
        ),
      ),
    );
  }
}
```