import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

// Exemple de classe de données
class JourFerieTravaille {
  final DateTime date;
  final String nom;
  final bool solidarite;
  final bool jourTravaille;

  JourFerieTravaille({
    required this.date,
    required this.nom,
    required this.solidarite,
    required this.jourTravaille,
  });
}

final List<JourFerieTravaille> data = [
  JourFerieTravaille(
    date: DateTime.parse("2024-05-22T00:00:00+00:00"),
    nom: "Lundi de Pentecôte",
    solidarite: true,
    jourTravaille: true,
  ),
  JourFerieTravaille(
    date: DateTime.parse("2024-05-20T00:00:00+00:00"),
    nom: "Mardi gras",
    solidarite: false,
    jourTravaille: true,
  ),
  JourFerieTravaille(
    date: DateTime.parse("2023-04-20T00:00:00+00:00"),
    nom: "Toussaint",
    solidarite: false,
    jourTravaille: false,
  ),
];

final formattedValues = <String, Widget Function(JourFerieTravaille)>{
  'Nom du jour férié': (JourFerieTravaille item) {
    return Text(
      item.nom,
      style: TextStyles.bodyMediumSemibold
          .copyWith(color: ListoMainColors.neutral[900]),
    );
  },
  'Jour réel': (JourFerieTravaille item) {
    return Text(item.date.toIso8601String(),
        style: TextStyles.bodyMedium
            .copyWith(color: ListoMainColors.neutral[900]));
  },
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

const title = 'Jours fériés travaillés';

class ListoDataTablePresenter extends StatelessWidget {
  const ListoDataTablePresenter({super.key});

  @override
  Widget build(BuildContext context) {
    final subtitle = context.knobs.stringOrNull(
      label: 'Subtitle',
      initialValue:
          'Activer les jours fériés supplémentaires pour mon établissement',
    );

    final subtitleTagValue = context.knobs.booleanOrNull(
      label: 'Subtitle tag',
      initialValue: true,
    );

    return ListoDataTable<JourFerieTravaille>(
      title: title,
      data: data,
      formattedValues: formattedValues,
      sortableValues: sortableExtractors,
      subtitle: subtitle,
      subtitleTagValue: subtitleTagValue,
    );
  }
}
