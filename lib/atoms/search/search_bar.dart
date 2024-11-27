import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ListoSearchBar extends StatefulWidget {
  const ListoSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.onClear,
    required this.onSearch,
    required this.enabled,
    this.showSuggestions = true,
  });

  final SearchController controller;
  final String hintText;
  final void Function(String) onChanged;
  final void Function() onClear;
  final void Function(String) onSearch;
  final bool enabled;
  final bool showSuggestions;

  @override
  State<ListoSearchBar> createState() => _ListoSearchBarState();
}

class _ListoSearchBarState extends State<ListoSearchBar> {
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    try {
      widget.controller.removeListener(_onTextChanged);
    } catch (_) {}
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _showClearButton = widget.controller.text.isNotEmpty;
      widget.onChanged(widget.controller.text);
    });
  }

  List<Widget> _buildTrailing() {
    if (!_showClearButton) return <Widget>[];

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          widget.controller.clear();
          widget.onClear();
        },
      ),
    ];
  }

  void _handleTap() {
    if (widget.showSuggestions) {
      widget.controller.openView();
    }
  }

  void _handleChanged(String _) {
    if (widget.showSuggestions) {
      widget.controller.openView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor: WidgetStatePropertyAll(SepteoColors.grey.shade50),
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SepteoSpacings.xs),
      )),
      enabled: widget.enabled,
      hintText: widget.hintText,
      controller: widget.controller,
      leading: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          widget.onSearch(widget.controller.text);
        },
      ),
      trailing: _buildTrailing(),
      onTap: _handleTap,
      onChanged: _handleChanged,
    );
  }
}
