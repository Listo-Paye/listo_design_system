// ignore_for_file: no_logic_in_create_state, must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/spacing.dart';

import 'collapse_state.dart';
import 'destination_data.dart';
import 'menu_icon.dart';
import 'menu_tile.dart';

export 'destination_data.dart';

class NavigationMenu extends StatefulWidget {
  final bool showMenuIcon;
  final Widget body;
  final List<DestinationData> destinations;
  final Function(DestinationData data)? onSelected;
  final Function()? onSettings;

  late final bool _showRail;

  NavigationMenu({
    super.key,
    required this.destinations,
    required this.body,
    bool? showRail,
    this.showMenuIcon = false,
    this.onSelected,
    this.onSettings,
  }) {
    if (showRail != null) {
      this.showRail = showRail;
      _showRail = showRail;
    }
  }

  static NavigationMenuState? _state;

  bool get showRail => _state?.showRail ?? _showRail;

  set showRail(bool showRail) {
    _state?.setRail(showRail);
  }

  static void selectDestination(DestinationData destination) {
    _state?.selectDestination(destination);
  }

  @override
  State<NavigationMenu> createState() {
    _state = NavigationMenuState(_showRail);
    return _state!;
  }

  static NavigationMenuState? maybeOf(BuildContext context) {
    return _state;
  }

  static NavigationMenuState of(BuildContext context) {
    final NavigationMenuState? result = _state;
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
  final List<Widget> _header = [];
  final List<MenuTile> _tiles = [];

  bool get isExpanded => _isCollapsed == NavigationMenuCollapseState.expanded;

  bool get isCollapsed => _isCollapsed == NavigationMenuCollapseState.collapsed;

  bool get isHidden => _isCollapsed == NavigationMenuCollapseState.none;
  MenuTile? _settings;

  NavigationMenuState(bool showRail) {
    _showRail = showRail;
  }

  setRail(bool showRail) {
    if (mounted) {
      setState(() {
        _showRail = showRail;
      });
      if (showRail) {
        openRail();
      } else {
        closeRail();
      }
    }
  }

  bool get showRail => _showRail;

  @override
  void initState() {
    super.initState();
    if (widget.showMenuIcon) {
      _header.add(const Padding(
        padding: EdgeInsets.only(left: Spacings.md),
        child: MenuIcon(),
      ));
      _header.add(const SizedBox(height: Spacings.sm));
    }
    if (_showRail) {
      openRail();
    } else {
      closeRail();
    }
    for (var destination in widget.destinations) {
      _tiles.add(
        MenuTile(
          destination: destination,
          onSelected: (data) {
            for (var tile in _tiles) {
              if (tile.destination.label == data.label) {
                tile.select();
              } else {
                if ((tile.destination.children ?? [])
                    .where((d) => d.label == data.label)
                    .isNotEmpty) {
                  tile.select(label: data.label);
                } else {
                  tile.deselect();
                }
              }
            }
          },
        ),
      );
    }
    if (widget.onSettings != null) {
      _settings = MenuTile(
        destination: DestinationData(
          icon: Icons.settings,
          label: "Paramètres",
        ),
        onSelected: (data) {
          widget.onSettings?.call();
        },
      );
    }
  }

  void openMenu() {
    setState(() {
      _isCollapsed = NavigationMenuCollapseState.expanded;
    });
  }

  void closeMenu() {
    if (!_showRail) {
      closeRail();
    }
    hideLabels(context);
    setState(() {
      _isCollapsed = _showRail
          ? NavigationMenuCollapseState.collapsed
          : NavigationMenuCollapseState.none;
    });
  }

  void toggleMenu() {
    if (_isCollapsed == NavigationMenuCollapseState.expanded) {
      closeMenu();
    } else {
      openMenu();
    }
  }

  void openRail() {
    setState(() {
      _isCollapsed = NavigationMenuCollapseState.collapsed;
    });
  }

  void closeRail() {
    for (var tile in _tiles) {
      tile.hideMenuIcon();
    }
    _settings?.hideMenuIcon();
    setState(() {
      _isCollapsed = NavigationMenuCollapseState.none;
    });
  }

  void showLabels(BuildContext context) {
    for (var tile in _tiles) {
      tile.showLabel();
    }
    _settings?.showLabel();
  }

  void hideLabels(BuildContext context) {
    for (var tile in _tiles) {
      tile.deselect();
      tile.hideLabel();
    }
    _settings?.hideLabel();
  }

  void selectDestination(DestinationData destination) {
    for (var tile in _tiles) {
      if (tile.destination.label == destination.label) {
        tile.select();
      } else {
        tile.deselect();
      }
    }
  }

  void selectTile(MenuTile tile) {
    for (var t in _tiles) {
      if (t == tile) {
        t.select();
      } else {
        t.deselect();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Spacings.sm),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isCollapsed.width,
              curve: Curves.fastOutSlowIn,
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  ..._header,
                  ..._tiles,
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: _settings ?? Container(),
                    ),
                  ),
                ],
              ),
              onEnd: () {
                if (_showRail ||
                    _isCollapsed == NavigationMenuCollapseState.expanded) {
                  for (var tile in _tiles) {
                    tile.showMenuIcon();
                  }
                  _settings?.showMenuIcon();
                }
                if (_isCollapsed == NavigationMenuCollapseState.expanded) {
                  showLabels(context);
                }
              },
            ),
          ),
          Expanded(child: widget.body),
        ],
      ),
    );
  }
}
