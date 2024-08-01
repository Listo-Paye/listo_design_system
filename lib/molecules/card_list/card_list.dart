import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class CardList extends StatefulWidget {
  final String searchHintText;
  final List<ListoCard> children;
  const CardList({
    super.key,
    required this.children,
    required this.searchHintText,
  });

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  late List<ListoCard> _filteredChildren;
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _filteredChildren = widget.children;
  }

  Iterable<ListoCard> filterChildren(String searchText) {
    return widget.children.where((element) =>
        element.getAllText().toLowerCase().contains(searchText.toLowerCase()));
  }

  int getCount() {
    if (_filteredChildren.isEmpty) {
      return 1;
    }
    return _filteredChildren.length;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Radiuses.xs),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(Spacings.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListoSearchAnchor(
              hintText: widget.searchHintText,
              onChanged: (searchText) {
                setState(() {
                  _searchText = searchText;
                  _filteredChildren = filterChildren(searchText).toList();
                });
              },
              onClear: () {
                setState(() {
                  _searchText = "";
                  _filteredChildren = widget.children;
                });
              },
              onSearch: (searchText) {
                setState(() {
                  _searchText = searchText;
                  _filteredChildren = filterChildren(searchText).toList();
                });
              },
              enabled: true,
              showSuggestions: false,
            ),
            const SizedBox(height: Spacings.xs),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: Spacings.xs),
                itemCount: getCount(),
                itemBuilder: (context, index) {
                  if (_filteredChildren.isEmpty) {
                    return Expanded(
                      child: Center(
                        child:
                            Text("Aucune correspondance pour '$_searchText'"),
                      ),
                    );
                  }
                  return _filteredChildren[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
