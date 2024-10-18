import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

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
              onClick: (np, ct, dt, df, typ) {
                var retour = ClientCard(
                  nom: np,
                  dateDebut: dt,
                  dateFin: df,
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
                        Expanded(child: VarAppCardList(onClick: () {
                          setState(
                            () {
                              var cols = [...columns];
                              columns = [
                                cols.first,
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    child: const UpdateOrViewVA(),
                                  ),
                                ),
                              ];
                            },
                          );
                        })),
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

class ClientCardList extends StatelessWidget {
  final void Function(
    String nomPrenom,
    String contrat,
    DateTime dateDebut,
    DateTime? dateFin,
    String typeContrat,
  ) onClick;

  const ClientCardList({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return CardList(
      searchHintText: "Rechercher kk1",
      children: [
        ClientCard(
          nom: "FONTAINE Benoît",
          dateDebut: DateTime(2023, 10, 16),
          typeContrat: "CDI",
          onSelect: () {
            onClick(
              "FONTAINE Benoît",
              "Tech Lead",
              DateTime(2023, 10, 16),
              null,
              "CDI",
            );
          },
        ),
        ClientCard(
          nom: "SEMERIA Thomas",
          dateDebut: DateTime(2022, 07, 11),
          dateFin: DateTime(2024, 12, 31),
          typeContrat: "CDI",
          onSelect: () {
            onClick(
              "SEMERIA Thomas",
              "Ingénieur Logiciel",
              DateTime(2022, 07, 11),
              DateTime(2024, 12, 31),
              "CDD",
            );
          },
        ),
        ClientCard(
          nom: "HUIBAN Raphael",
          dateDebut: DateTime(2024, 04, 1),
          typeContrat: "CDI",
          onSelect: () {
            onClick(
              "HUIBAN Raphael",
              "Développeur",
              DateTime(2024, 04, 1),
              null,
              "CDI",
            );
          },
        ),
      ],
    );
  }
}

class VarAppCardList extends StatelessWidget {
  final void Function() onClick;

  const VarAppCardList({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return CardList(
      searchHintText: "Rechercher variable",
      children: [
        VaInfoCard(
            title: 'Ma variable Applicative 1',
            value: 817.2,
            type: VaInfoCardType.calculated,
            onSelect: onClick),
        VaInfoCard(
          title: 'VA Personnel',
          value: 817.2,
          type: VaInfoCardType.calculated,
          onSelect: onClick,
        ),
        VaInfoCard(
          title: 'PMSS',
          value: 817.2,
          type: VaInfoCardType.calculated,
          onSelect: onClick,
        ),
        VaInfoCard(
          title: 'Lorem Ipsum',
          value: 817.2,
          type: VaInfoCardType.calculated,
          onSelect: onClick,
        ),
        VaInfoCard(
          title: 'Ma variable Applicative 2',
          value: 817.2,
          type: VaInfoCardType.calculated,
          onSelect: onClick,
        ),
      ],
    );
  }
}

class UpdateOrViewVA extends StatelessWidget {
  const UpdateOrViewVA({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacings.xs,
            horizontal: Spacings.md,
          ),
          child: ListView(
            children: [
              const SizedBox(height: Spacings.sm),
              const FormTitle(data: "PMSS salarié"),
              const SizedBox(height: Spacings.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const AmountTitle(amount: 3864),
                  const SizedBox(width: Spacings.sm),
                  VaInfoCardType.calculated.toTag(large: true),
                ],
              ),
              const SizedBox(height: Spacings.sm),
              const FormNote(
                notes: [
                  Note(
                    label: "Règle de calcul",
                    value: "PMSS Légal * coefficient de proratisation",
                  ),
                ],
              ),
              const SizedBox(height: Spacings.md),
              const FormPanel(
                title: "Modifier la variable",
                children: [
                  InputAmount(
                    hintText: "Montant",
                  ),
                  TextArea(hintText: "Commentaire"),
                ],
              ),
              const SizedBox(height: Spacings.sm),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      onPressed: () {},
                      text: "Fermer",
                      style: ButtonType.secondary,
                    ),
                  ),
                  const SizedBox(width: Spacings.sm),
                  Expanded(
                    child: Button(
                      onPressed: () {},
                      text: "Enregistrer",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
