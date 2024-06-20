import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent listoDataTableMolecule(BuildContext context) {
  return WidgetbookComponent(
    name: 'Data Table',
    useCases: [
      usercaseWithMarkdown(
          'Data Table',
          (context) => const ListoDataTablePresenter(),
          "markdown/molecule_data_table.md"),
    ],
  );
}

// Exemple de classe de données
class JourFerieTravaille {
  final String context;
  final String id;
  final String type;
  final String etablissement;
  final DateTime date;
  final String nom;
  final bool solidarite;
  final bool jourTravaille;
  final String jourFerieId;

  JourFerieTravaille({
    required this.context,
    required this.id,
    required this.type,
    required this.etablissement,
    required this.date,
    required this.nom,
    required this.solidarite,
    required this.jourTravaille,
    required this.jourFerieId,
  });
}

final List<JourFerieTravaille> data = [
  JourFerieTravaille(
    context: "/api/contexts/JourFerieTravaille",
    id: "/api/jour_ferie_travailles/8fba51aa-1d57-4d98-94cd-2d0c1cde070b",
    type: "JourFerieTravaille",
    etablissement: "/api/etablissements/55036c03-6d3f-4053-9547-c08a32ac9aca",
    date: DateTime.parse("2024-05-22T00:00:00+00:00"),
    nom: "Lundi de Pentecôte",
    solidarite: true,
    jourTravaille: true,
    jourFerieId: "8fba51aa-1d57-4d98-94cd-2d0c1cde070b",
  ),
  JourFerieTravaille(
    context: "/api/contexts/JourFerieTravaille",
    id: "/api/jour_ferie_travailles/sssssaa-1d57-4d98-94cd-2d0c1cde070b",
    type: "JourFerieTravaille",
    etablissement: "/api/etablissements/55036c03-6d3f-4053-9547-c08a32ac9aca",
    date: DateTime.parse("2024-05-20T00:00:00+00:00"),
    nom: "Mardi gras",
    solidarite: false,
    jourTravaille: true,
    jourFerieId: "8fba51aa-1d57-4d98-94cd-2d0c1cde070b",
  ),
  JourFerieTravaille(
    context: "/api/contexts/JourFerieTravaille",
    id: "/api/jour_ferie_travailles/8fffffaa-1d57-4d98-94cd-2d0c1cde070b",
    type: "JourFerieTravaille",
    etablissement: "/api/etablissements/55036c03-6d3f-4053-9547-c08a32ac9aca",
    date: DateTime.parse("2023-04-20T00:00:00+00:00"),
    nom: "Toussaint",
    solidarite: false,
    jourTravaille: false,
    jourFerieId: "8fba51aa-1d57-4d98-94cd-2d0c1cde070b",
  ),
];

final formattedValues = <String, Widget Function(JourFerieTravaille)>{
  'Nom du jour férié': (JourFerieTravaille item) => Text(
        item.nom,
        style: TextStyles.bodyMediumSemibold
            .copyWith(color: ListoMainColors.neutral[900]),
      ),
  'Jour réel': (JourFerieTravaille item) => Text(item.date.toIso8601String(),
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

final sortableExtractors = <String, Comparator<JourFerieTravaille>>{
  'Nom du jour férié': (itemA, itemB) => itemA.nom.compareTo(itemB.nom),
  'Jour réel': (itemA, itemB) => itemA.date.compareTo(itemB.date),
  'Jour travaillé': (itemA, itemB) => itemA.jourTravaille ? 1 : -1,
};

class ListoDataTablePresenter extends StatelessWidget {
  const ListoDataTablePresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return ListoDataTable<JourFerieTravaille>(
      data: data,
      formattedValues: formattedValues,
      sortableValues: sortableExtractors,
    );
  }
}
