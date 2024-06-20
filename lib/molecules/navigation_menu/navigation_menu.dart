import 'package:flutter/material.dart';
import 'package:listo_design_system/svg/septeo_logo.dart';
import 'package:listo_design_system/themes/spacing.dart';

import 'destination_data.dart';

class NavigationMenu extends StatefulWidget {
  final bool showRail;
  final Widget body;
  final List<DestinationData> destinations;
  const NavigationMenu({
    super.key,
    required this.destinations,
    required this.body,
    this.showRail = false,
  });

  @override
  State<NavigationMenu> createState() => NavigationMenuState();

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
  bool _showRail = false;
  final List<MenuTile> _menuTiles = [];
  bool get isExpanded => _isCollapsed == NavigationMenuCollapseState.expanded;

  @override
  void initState() {
    super.initState();
    for (var destination in widget.destinations) {
      _menuTiles.add(MenuTile(destination: destination));
    }
    _showRail = widget.showRail;
    _isCollapsed = _showRail
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
      _isCollapsed = _showRail
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
            child: const Column(
              children: [
                MenuIcon(),
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

class MenuTile extends StatelessWidget {
  final DestinationData destination;
  const MenuTile({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Spacings.xs),
          child: Container(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                var menu = NavigationMenu.of(context);
                if (menu.isExpanded) {
                  menu.closeMenu();
                } else {
                  menu.openMenu();
                }
              },
              child: septeoLogo,
            ),
          ),
        ),
      ],
    );
  }
}

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Spacings.xs),
          child: Container(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                var menu = NavigationMenu.of(context);
                if (menu.isExpanded) {
                  menu.closeMenu();
                } else {
                  menu.openMenu();
                }
              },
              child: septeoLogo,
            ),
          ),
        ),
      ],
    );
  }
}

enum NavigationMenuCollapseState {
  none(0.0),
  collapsed(72.0),
  expanded(262);

  const NavigationMenuCollapseState(this.width);

  final double width;
}
