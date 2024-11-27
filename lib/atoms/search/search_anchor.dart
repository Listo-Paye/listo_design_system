import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ListoSearchAnchor extends StatefulWidget {
  final String hintText;
  final void Function(String) onChanged;
  final void Function() onClear;
  final void Function(String) onSearch;
  final bool enabled;
  final bool showSuggestions;
  final Iterable<String> items;

  const ListoSearchAnchor({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.onClear,
    required this.onSearch,
    required this.enabled,
    this.showSuggestions = true,
    this.items = const [],
  });

  @override
  State<ListoSearchAnchor> createState() => _ListoSearchAnchorState();
}

class _ListoSearchAnchorState extends State<ListoSearchAnchor> {
  Iterable<Widget> _buildSuggestions(
      BuildContext context, SearchController controller) {
    if (!widget.showSuggestions) return <Widget>[];

    return widget.items.where((item) {
      if (controller.text.isEmpty) return true;

      return item.toLowerCase().contains(controller.text.toLowerCase());
    }).map((item) {
      return ListTile(
        title: Text(item),
        onTap: () {
          setState(() {
            controller.closeView(item);
          });
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: false,
      viewBackgroundColor: SepteoColors.grey.shade50,
      viewElevation: 0,
      viewShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      builder: (BuildContext context, SearchController controller) {
        return ListoSearchBar(
          controller: controller,
          hintText: widget.hintText,
          onChanged: widget.onChanged,
          onClear: widget.onClear,
          onSearch: widget.onSearch,
          enabled: widget.enabled,
          showSuggestions: widget.showSuggestions,
        );
      },
      suggestionsBuilder: _buildSuggestions,
    );
  }
}
