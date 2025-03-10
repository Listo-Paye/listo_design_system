import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

@Deprecated('Ce composant sera bientôt supprimé.')
class ListoDataTable<T> extends StatefulWidget {
  final List<T> data;
  final Map<String, Widget Function(T)> formattedValues;
  final Map<String, Comparator<T>> sortableValues;
  final String title;
  final String? subtitle;
  final bool? subtitleTagValue;

  const ListoDataTable({
    super.key,
    required this.title,
    required this.data,
    required this.formattedValues,
    required this.sortableValues,
    this.subtitle,
    this.subtitleTagValue,
  });

  @override
  State<ListoDataTable> createState() => _ListoDataTableState<T>();
}

class _ListoDataTableState<T> extends State<ListoDataTable<T>> {
  late List<T> sortedData;
  int? sortColumnIndex;
  bool isAscending = true;

  @override
  void initState() {
    super.initState();
    sortedData = List.from(widget.data);
  }

  void onSort(int columnIndex, bool ascending) {
    final key = widget.formattedValues.keys.elementAt(columnIndex);
    final comparator = widget.sortableValues[key];

    if (comparator == null) return;

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;

      sortedData.sort(comparator);

      if (ascending) {
        sortedData = sortedData.reversed.toList();
      }
    });
  }

  List<Widget> _buildSubtitle() {
    if (widget.subtitle == null) return [];

    return [
      const SizedBox(
        height: SepteoSpacings.md,
      ),
      Row(
        children: [
          Flexible(
            child: Text(
              widget.subtitle!,
              style: SepteoTextStyles.bodySmallInterBold,
            ),
          ),
          const SizedBox(
            width: SepteoSpacings.md,
          ),
          if (widget.subtitleTagValue != null)
            Tag(
              type:
                  widget.subtitleTagValue! ? TagColors.base : TagColors.warning,
              label: widget.subtitleTagValue! ? "Activé" : "Désactivé",
            ),
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          dividerTheme: const DividerThemeData(
            color: Colors.transparent,
            space: 0,
            thickness: 0,
            indent: 0,
            endIndent: 0,
          ),
        ),
        child: Card(
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: SepteoSpacings.md, horizontal: SepteoSpacings.xl),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.title,
                        style: SepteoTextStyles.bodyLargeInterBold,
                      ),
                    ),
                    ..._buildSubtitle(),
                    const SizedBox(
                      height: SepteoSpacings.md,
                    ),
                    Divider(
                      color: SepteoColors.grey.shade100,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: SepteoSpacings.md,
                    ),
                    DataTable(
                      sortColumnIndex: sortColumnIndex,
                      sortAscending: isAscending,
                      columns: widget.formattedValues.keys
                          .map((key) => DataColumn(
                                label: Expanded(
                                  child: Text(
                                    key,
                                    style: SepteoTextStyles.bodySmallInter,
                                  ),
                                ),
                                onSort: onSort,
                              ))
                          .toList(),
                      rows: sortedData
                          .map((item) => DataRow(
                                cells: widget.formattedValues.keys
                                    .map((key) => DataCell(
                                        widget.formattedValues[key]!(item)))
                                    .toList(),
                              ))
                          .toList(),
                    )
                  ]),
            )));
  }
}
