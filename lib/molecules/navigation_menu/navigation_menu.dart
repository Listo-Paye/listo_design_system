import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/spacing.dart';

import 'collapse_state.dart';
import 'destination_data.dart';
import 'menu_icon.dart';
import 'menu_tile.dart';

class NavigationMenu extends StatefulWidget {
  final bool showMenuIcon;
  final bool showRail;
  final Widget body;
  final List<DestinationData> destinations;
  const NavigationMenu({
    super.key,
    required this.destinations,
    required this.body,
    this.showRail = false,
    this.showMenuIcon = false,
  });

  @override
  State<NavigationMenu> createState() => NavigationMenuState();

  static NavigationMenuState? maybeOf(BuildContext context) {
    return context.findAncestorStateOfType<NavigationMenuState>();
  }

  static NavigationMenuState of(BuildContext context) {
    final NavigationMenuState? result =
        context.findAncestorStateOfType<NavigationMenuState>();
    if (result != null) {
      return result;
    }
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
        'NavigationMenu.of() called with a context that does not contain a NavigationMenu.',
      ),
      ErrorDescription(
        'No NavigationMenu ancestor could be found starting from the context that was passed to NavigationMenu.of(). '
        'This usually happens when the context provided is from the same StatefulWidget as that '
        'whose build function actually creates the NavigationMenu widget being sought.',
      ),
      ErrorHint(
        'There are several ways to avoid this problem. The simplest is to use a Builder to get a '
        'context that is "under" the NavigationMenu. For an example of this, please see the '
        'documentation for NavigationMenu.of():\n'
        '  https://api.flutter.dev/flutter/material/NavigationMenu/of.html',
      ),
      ErrorHint(
        'A more efficient solution is to split your build function into several widgets. This '
        'introduces a new context from which you can obtain the NavigationMenu. In this solution, '
        'you would have an outer widget that creates the NavigationMenu populated by instances of '
        'your new inner widgets, and then in these inner widgets you would use NavigationMenu.of().\n'
        'A less elegant but more expedient solution is assign a GlobalKey to the NavigationMenu, '
        'then use the key.currentState property to obtain the NavigationMenuState rather than '
        'using the NavigationMenu.of() function.',
      ),
      context.describeElement('The context used was'),
    ]);
  }
}

class NavigationMenuState extends State<NavigationMenu> {
  NavigationMenuCollapseState _isCollapsed = NavigationMenuCollapseState.none;
  final List<MenuTile> _menuTiles = [];
  final List<Widget> _header = [];

  bool get isExpanded => _isCollapsed == NavigationMenuCollapseState.expanded;
  bool get isCollapsed => _isCollapsed == NavigationMenuCollapseState.collapsed;
  bool get isHidden => _isCollapsed == NavigationMenuCollapseState.none;

  @override
  void initState() {
    super.initState();
    if (widget.showMenuIcon) {
      _header.add(const MenuIcon());
    }
    for (var destination in widget.destinations) {
      _menuTiles.add(MenuTile(destination: destination));
    }
    _isCollapsed = widget.showRail
        ? NavigationMenuCollapseState.collapsed
        : NavigationMenuCollapseState.none;
  }

  void openMenu() {
    setState(() {
      _isCollapsed = NavigationMenuCollapseState.expanded;
    });
  }

  void closeMenu() {
    setState(() {
      _isCollapsed = widget.showRail
          ? NavigationMenuCollapseState.collapsed
          : NavigationMenuCollapseState.none;
    });
  }

  void openRail() {
    setState(() {
      _isCollapsed = NavigationMenuCollapseState.collapsed;
    });
  }

  void closeRail() {
    setState(() {
      _isCollapsed = NavigationMenuCollapseState.none;
    });
  }

  void showLabels() {}

  void hideLabels() {}

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Spacings.sm, left: Spacings.sm),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isCollapsed.width,
            curve: Curves.fastOutSlowIn,
            child: Column(
              children: [
                ..._header,
                ..._menuTiles,
              ],
            ),
            onEnd: () {
              if (_isCollapsed == NavigationMenuCollapseState.expanded) {
                showLabels();
              } else {
                hideLabels();
              }
            },
          ),
        ),
        Expanded(child: widget.body),
      ],
    );
  }
}
