import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ListoDataTable<T> extends StatefulWidget {
  final List<T> data;
  final Map<String, Widget Function(T)> formattedValues;
  final Map<String, Comparator<T>> sortableValues;

  const ListoDataTable({
    super.key,
    required this.data,
    required this.formattedValues,
    required this.sortableValues,
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
      child: DataTable(
        sortColumnIndex: sortColumnIndex,
        sortAscending: isAscending,
        columns: widget.formattedValues.keys
            .map((key) => DataColumn(
                  label: Expanded(
                    child: Text(
                      key,
                      style: TextStyles.bodyMedium,
                    ),
                  ),
                  onSort: onSort,
                ))
            .toList(),
        rows: sortedData
            .map((item) => DataRow(
                  cells: widget.formattedValues.keys
                      .map(
                          (key) => DataCell(widget.formattedValues[key]!(item)))
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}
