import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

enum ListoDataCellTypes { text, tag }


class ListoDataTableData {}

class ListoDataCell extends DataCell {
  final String text;
  final ListoDataCellTypes type;
  final TagColors? tagColor;

  ListoDataCell({required this.text, required this.type, this.tagColor})
      : super(
          type == ListoDataCellTypes.text
              ? Text(text)
              : Tag(label: text, type: tagColor ?? TagColors.base),
        );
}

class ListoDataTable extends StatelessWidget {
  final List<String> columns = [
    'Nom du jour férié',
    'Jour réel',
    'Jour travaillé'
  ];

  // var bla = {jour: "Jour de l'an", date: "Lundi de Pâques", jourTravaille: 'Oui'};

  final List<List<String>> rowsBis = [
    ['Jour de l\'an', 'Lundi 1er janvier 2024', 'Non'],
    ['Lundi de Pâques', 'Lundi 1er avril 2024', 'Oui'],
    ['Travail', 'Mercredi 1er mai 2024', 'Non'],
  ];


  final List<List<ListoDataCell>> rows = [
    [
      ListoDataCell(text: 'Jour de l\'an', type: ListoDataCellTypes.text),
      ListoDataCell(
          text: 'Lundi 1er janvier 2024', type: ListoDataCellTypes.text),
      ListoDataCell(
          text: 'Non', type: ListoDataCellTypes.tag, tagColor: TagColors.base),
    ],
    [
      ListoDataCell(text: 'Lundi de Pâques', type: ListoDataCellTypes.text),
      ListoDataCell(
          text: 'Lundi 1er avril 2024', type: ListoDataCellTypes.text),
      ListoDataCell(
          text: 'Oui',
          type: ListoDataCellTypes.tag,
          tagColor: TagColors.success),
    ],
    [
      ListoDataCell(text: 'Travail', type: ListoDataCellTypes.text),
      ListoDataCell(
          text: 'Mercredi 1er mai 2024', type: ListoDataCellTypes.text),
      ListoDataCell(
          text: 'Non', type: ListoDataCellTypes.tag, tagColor: TagColors.base),
    ],
  ];

  ListoDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // dividerColor: Colors.transparent,
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
          space: 0,
          thickness: 0,
          indent: 0,
          endIndent: 0,
        ),
      ),
      child: DataTable(
        columns: columns
            .map((columnTitle) => DataColumn(
                  label: Text(
                    columnTitle,
                    style: TextStyles.bodyMedium,
                  ),
                ))
            .toList(),
        rows: rows
            .map((row) => DataRow(
                  cells: row,
                ))
            .toList(),
      ),
    );
  }
}
