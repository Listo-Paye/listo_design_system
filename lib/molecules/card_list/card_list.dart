import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

@Deprecated('Ce composant sera bientôt supprimé pour une refonte complète.')
class CardList<T extends ListoCard> extends StatefulWidget {
  final String searchHintText;
  final List<T> children;
  const CardList({
    super.key,
    required this.children,
    required this.searchHintText,
  });

  @override
  State<CardList> createState() => _CardListState<T>();
}

class _CardListState<T extends ListoCard> extends State<CardList<T>> {
  late List<T> _filteredChildren;
  String _searchText = "";

  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _filteredChildren = widget.children;
    Future.delayed(const Duration(milliseconds: 300), () {
      scrollToSelected();
    });
  }

  Iterable<T> filterChildren(String searchText) {
    return widget.children.where((element) =>
        element.getAllText().toLowerCase().contains(searchText.toLowerCase()));
  }

  Widget getLoadingCard() => const Center(child: CircularProgressIndicator());

  void scrollToSelected() {
    var index = _filteredChildren.indexWhere((element) => element.isSelected);
    if (index < 0 || index >= _filteredChildren.length) return;

    var offset = index * 64.0;

    _controller.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SepteoSpacings.xs),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(SepteoSpacings.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ListoSearchAnchor(
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
                    enabled: widget.children.isNotEmpty,
                    showSuggestions: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: SepteoSpacings.xs),
            Expanded(
              child: ListView.separated(
                controller: _controller,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: SepteoSpacings.xs),
                itemCount:
                    _filteredChildren.isEmpty ? 1 : _filteredChildren.length,
                itemBuilder: (context, index) {
                  if (_filteredChildren.isEmpty) {
                    return _searchText.isEmpty
                        ? getLoadingCard()
                        : _EmptyCard(_searchText);
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

class LoadingCard extends ListoCard {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  String getAllText() {
    return "";
  }
}

class _EmptyCard extends ListoCard {
  final String objectSearched;
  const _EmptyCard(
    this.objectSearched,
  ) : super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Aucune correspondance pour '$objectSearched'"),
    );
  }

  @override
  String getAllText() {
    return "";
  }
}
