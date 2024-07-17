// ignore_for_file: no_logic_in_create_state, must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/colors.dart';
import 'package:listo_design_system/themes/spacing.dart';

import 'destination_data.dart';

class MenuTile extends StatefulWidget {
  final DestinationData destination;
  MenuTileState? _state;
  final Function(DestinationData data)? onSelected;

  MenuTile({required this.destination, this.onSelected})
      : super(key: ValueKey(destination.label.replaceAll(" ", "_")));

  void showLabel() {
    _state?.showLabels();
  }

  void hideLabel() {
    _state?.hideLabels();
  }

  void showMenuIcon() {
    _state?.showMenuIcon();
  }

  void hideMenuIcon() {
    _state?.hideMenuIcon();
  }

  void select({String? label}) {
    _state?.select(label);
  }

  void deselect() {
    _state?.deselect();
  }

  MenuTileState _setState() {
    _state = MenuTileState();
    return _state!;
  }

  @override
  State<MenuTile> createState() => _setState();
}

class MenuTileState extends State<MenuTile> {
  late bool _isSelected;
  late bool _showMenuIcon;
  late bool _showLabel;
  int _childSelected = -1;
  final List<_ChildTile> _children = [];

  @override
  void initState() {
    super.initState();
    _isSelected = false;
    _showMenuIcon = true;
    _showLabel = false;
  }

  void select(String? label) {
    setState(() {
      if (label != null && widget.destination.children != null) {
        _isSelected = true;
        _childSelected = widget.destination.children!
            .indexWhere((element) => element.label == label);
        showChildren(_buildChildren());
      } else {
        _isSelected = !_isSelected;
        _childSelected = -1;
        _children.clear();
      }
    });
  }

  void deselect() {
    if (mounted) {
      setState(() {
        _isSelected = false;
        _childSelected = -1;
        _children.clear();
      });
    }
  }

  void showLabels() {
    setState(() {
      _showLabel = true;
    });
  }

  void hideLabels() {
    setState(() {
      _showLabel = false;
    });
  }

  void showMenuIcon() {
    setState(() {
      _showMenuIcon = true;
    });
  }

  void hideMenuIcon() {
    setState(() {
      _showMenuIcon = false;
      _showLabel = false;
    });
  }

  void showChildren(List<_ChildTile> children) {
    setState(() {
      _children.clear();
      _children.addAll(children);
    });
  }

  List<_ChildTile> _buildChildren() {
    List<_ChildTile> children = [];
    for (var child in widget.destination.children!) {
      children.add(_ChildTile(
        destination: child,
        isSelected:
            widget.destination.children!.indexOf(child) == _childSelected,
        onSelected: (data) {
          widget.onSelected?.call(data);
        },
      ));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: (_isSelected && _showLabel)
          ? (widget.destination.children?.length ?? 0) * 56.0 + 56
          : 56,
      alignment: Alignment.topLeft,
      duration: const Duration(milliseconds: 200),
      onEnd: () {
        if (_showLabel && _isSelected) {
          showChildren(_buildChildren());
        } else {
          showChildren([]);
        }
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 30),
                width: (_isSelected && _childSelected < 0) ? 3 : 0,
                height: 56,
                color: ListoMainColors.primary.materialColor,
              ),
              InkWell(
                onTap: () {
                  widget.onSelected?.call(widget.destination);
                },
                child: _showMenuIcon
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: Spacings.md,
                          top: Spacings.sm,
                          bottom: Spacings.sm,
                        ),
                        child: Row(
                          children: [
                            AnimatedContainer(
                                duration: const Duration(milliseconds: 10),
                                width: _showMenuIcon ? 10 : 0),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 100),
                              child: _showMenuIcon
                                  ? Icon(
                                      widget.destination.icon,
                                      color: ListoMainColors.neutral.shade900,
                                    )
                                  : const SizedBox(width: 0),
                            ),
                            AnimatedContainer(
                                duration: const Duration(milliseconds: 10),
                                width: _showLabel ? 10 : 0),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: _showLabel
                                  ? Text(
                                      widget.destination.label,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: ListoMainColors
                                                .neutral.shade900,
                                          ),
                                    )
                                  : const SizedBox(width: 0),
                            ),
                            AnimatedContainer(
                                duration: const Duration(milliseconds: 30),
                                width: (_showLabel &&
                                        (widget.destination.children
                                                ?.isNotEmpty ??
                                            false))
                                    ? 10
                                    : 0),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 30),
                              child: (_showLabel &&
                                      (widget.destination.children
                                              ?.isNotEmpty ??
                                          false))
                                  ? Icon(
                                      _isSelected
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: ListoMainColors.neutral.shade900,
                                    )
                                  : const SizedBox(width: 0),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(width: 0, height: 0),
              ),
            ],
          ),
          for (var child in _children)
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 300), child: child),
        ],
      ),
    );
  }
}

class _ChildTile extends StatelessWidget {
  final DestinationData destination;
  final bool isSelected;
  final Function(DestinationData data)? onSelected;

  const _ChildTile({
    required this.destination,
    required this.isSelected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 30),
          width: isSelected ? 3 : 0,
          height: 56,
          color: ListoMainColors.primary.materialColor,
        ),
        InkWell(
          onTap: () {
            onSelected?.call(destination);
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: Spacings.lg,
              top: Spacings.sm,
              bottom: Spacings.sm,
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Icon(
                  destination.icon,
                  color: ListoMainColors.neutral.shade900,
                ),
                const SizedBox(width: 10),
                Text(
                  destination.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ListoMainColors.neutral.shade900,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
