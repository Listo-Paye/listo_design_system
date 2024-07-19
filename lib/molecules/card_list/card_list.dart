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

  @override
  void initState() {
    super.initState();
    _filteredChildren = widget.children;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListoSearchAnchor(
          hintText: widget.searchHintText,
          onChanged: (searchText) {
            setState(() {
              _filteredChildren = widget.children
                  .where((element) => element.getAllText().contains(searchText))
                  .toList();
            });
          },
          onClear: () {
            setState(() {
              _filteredChildren = widget.children;
            });
          },
          onSearch: (searchText) {
            setState(() {
              _filteredChildren = widget.children
                  .where((element) => element.getAllText().contains(searchText))
                  .toList();
            });
          },
          enabled: true,
          showSuggestions: false,
        ),
        const SizedBox(height: Spacings.xs),
        ListView.separated(
          separatorBuilder: (context, index) =>
              const SizedBox(height: Spacings.xs),
          shrinkWrap: true,
          itemCount: _filteredChildren.length,
          itemBuilder: (context, index) {
            return _filteredChildren[index];
          },
        ),
      ],
    );
  }
}
