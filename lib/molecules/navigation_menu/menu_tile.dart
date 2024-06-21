import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/colors.dart';
import 'package:listo_design_system/themes/spacing.dart';

import 'destination_data.dart';
import 'navigation_menu.dart';

class MenuTile extends StatefulWidget {
  final DestinationData destination;
  const MenuTile({super.key, required this.destination});

  @override
  State<MenuTile> createState() => _MenuTileState();
}

class _MenuTileState extends State<MenuTile> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  void select() {
    setState(() {
      _isSelected = true;
    });
  }

  void deselect() {
    setState(() {
      _isSelected = false;
    });
  }

  int _buildInitialCount() {
    var nav = NavigationMenu.of(context);
    if (nav.isExpanded) {
      if (widget.destination.children?.isEmpty ?? true) {
        return 2;
      } else {
        return 3;
      }
    }
    if (nav.isCollapsed) {
      return 1;
    }
    return 0;
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    var currentItem = switch (index) {
      0 => Icon(
          widget.destination.icon,
          color: ListoMainColors.neutral.shade900,
        ),
      1 => Text(
          widget.destination.label,
          style: TextStyle(
            color: ListoMainColors.neutral.shade900,
            fontSize: 16,
          ),
        ),
      2 => Padding(
          padding: const EdgeInsets.only(left: Spacings.md),
          child: Icon(
            Icons.arrow_forward_ios,
            color: ListoMainColors.neutral.shade900,
          ),
        ),
      _ => const SizedBox(width: 0),
    };
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.bounceOut,
      ),
      child: currentItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    var dest = widget.destination;
    return Stack(
      children: [
        _isSelected
            ? Row(
                children: [
                  Container(
                    width: 3,
                    color: ListoMainColors.primary.base,
                  ),
                ],
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacings.sm,
            horizontal: Spacings.md,
          ),
          child: AnimatedGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
            ),
            initialItemCount: _buildInitialCount(),
            itemBuilder: _buildItem,
          ),
        ),
      ],
    );
  }
}
