```dart
class CardlistPresenter extends StatelessWidget {
  const CardlistPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return CardList(
      searchHintText: context.knobs.string(
        label: "Hint de recherche",
        initialValue: "Rechercher Client",
      ),
      children: [
        ClientCard(
          nomPrenomContrat: "FONTAINE Benoît Tech Lead",
          dateDebut: DateTime(2023, 10, 16),
          typeContrat: "CDI",
          onSelect: () {},
        ),
        ClientCard(
          nomPrenomContrat: "SEMERIA Thomas Ingénieur Logiciel",
          dateDebut: DateTime(2022, 07, 11),
          typeContrat: "CDI",
          onSelect: () {},
        ),
        ClientCard(
          nomPrenomContrat: "HUIBAN Raphael Développeur",
          dateDebut: DateTime(2024, 04, 1),
          typeContrat: "CDI",
          onSelect: () {},
        ),
      ],
    );
  }
}
```

### Comment fonctionne Le CardList ?
Le CardList fonctionne de la même manière que le CardSelector. Il prend en paramètre une liste de widgets enfants. Chaque enfant est un widget de type ListoCard. Le CardList affiche les enfants sous forme de liste. Il est possible de rechercher un enfant par son nom grâce à un champ de recherche.

### Comment créer une ListoCard ?
Pour créer une ListoCard, il suffit de créer un widget qui hérite de la classe ListoCard. La classe ListoCard contient la propriété `getAllText()`.

Prenons l'exemple de la classe ClientCard qui hérite de ListoCard. La méthode `getAllText()` retourne le nom et le prénom du client, la date de début de contrat et le type de contrat. Ces informations sont utilisées pour la recherche.

```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ClientCard extends ListoCard {
  final String nomPrenomContrat;
  final DateTime dateDebut;
  final String typeContrat;
  final void Function()? onSelect;
  const ClientCard({
    super.key,
    required this.nomPrenomContrat,
    required this.dateDebut,
    required this.typeContrat,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: InkWell(
        hoverColor: ListoMainColors.primary.ultraLight,
        highlightColor: ListoMainColors.primary.light,
        splashColor: ListoMainColors.primary.light,
        onTap: onSelect,
        child: Padding(
          padding: const EdgeInsets.all(Spacings.xs),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nomPrenomContrat,
                        style: TextStyles.bodyMediumSemibold
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        '${DateFormat('dd/MM/yyyy').format(dateDebut)} / $typeContrat',
                        style: TextStyles.bodySmall
                            .copyWith(color: ListoMainColors.neutral.shade500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: Spacings.xs,
                ),
                const Padding(
                  padding: EdgeInsets.all(Spacings.xs),
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  String getAllText() =>
      '$nomPrenomContrat ${DateFormat('dd/MM/yyyy').format(dateDebut)} / $typeContrat';
}
```
Vous remarquerez que j'ai utilisé exactement le format affiché à l'écran. Cela permet de simplifier la recherche.