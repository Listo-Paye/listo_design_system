// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

@Deprecated('Ce composant sera bientôt supprimé pour une refonte complète.')
class MenuTileController {
  late void Function() showLabel;
  late void Function() hideLabel;
  late void Function() showMenuIcon;
  late void Function() hideMenuIcon;
}

class MenuTile extends StatefulWidget {
  final DestinationData destination;
  final String? selectedDestinationLabel;
  final Function(DestinationData data)? onSelected;
  final MenuTileController? controller;

  MenuTile({
    required this.destination,
    required this.controller,
    this.onSelected,
    this.selectedDestinationLabel,
  }) : super(key: ValueKey(destination.label.replaceAll(" ", "_")));

  @override
  State<MenuTile> createState() => MenuTileState();
}

class MenuTileState extends State<MenuTile> {
  late bool _showMenuIcon;
  late bool _showLabel;
  late bool _isExpanded;
  final List<_ChildTile> _children = [];

  @override
  void initState() {
    super.initState();
    _showMenuIcon = true;
    _showLabel = false;

    handleController();
    handleExpanded();
  }

  @override
  void didUpdateWidget(covariant MenuTile oldWidget) {
    handleController();
    handleExpanded();
    super.didUpdateWidget(oldWidget);
  }

  void handleExpanded() {
    if (widget.selectedDestinationLabel != null &&
        widget.destination.children != null) {
      _isExpanded = (widget.destination.children ?? [])
          .any((e) => e.label == widget.selectedDestinationLabel);
      if (!_isExpanded) {
        showChildren([]);
      } else if (_isExpanded && _showLabel) {
        showChildren(_buildChildren());
      }
    } else {
      _isExpanded = false;
    }
  }

  void handleController() {
    widget.controller?.showLabel = showLabels;
    widget.controller?.hideLabel = hideLabels;
    widget.controller?.showMenuIcon = showMenuIcon;
    widget.controller?.hideMenuIcon = hideMenuIcon;
  }

  void showLabels() {
    setState(() {
      _showLabel = true;
    });
  }

  void hideLabels() {
    setState(() {
      _showLabel = false;
      showChildren([]);
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
        selectedDestinationLabel: widget.selectedDestinationLabel,
        onSelected: (data) {
          widget.onSelected?.call(data);
        },
      ));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    var isSelected =
        widget.selectedDestinationLabel == widget.destination.label;

    return AnimatedContainer(
      height: (_isExpanded && _showLabel)
          ? (widget.destination.children?.length ?? 0) * 56.0 + 56
          : 56,
      alignment: Alignment.topLeft,
      duration: const Duration(milliseconds: 200),
      onEnd: () {
        if (_isExpanded && _showLabel) {
          showChildren(_buildChildren());
        }
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 30),
                width: (isSelected && !_isExpanded) ? 3 : 0,
                height: 56,
                color: SepteoColors.blue.shade900,
              ),
              InkWell(
                onTap: () {
                  if (widget.destination.children?.isNotEmpty ?? false) {
                    setState(() {
                      _isExpanded = !_isExpanded;
                      if (!_isExpanded) {
                        showChildren([]);
                      }
                    });
                  } else {
                    widget.onSelected?.call(widget.destination);
                  }
                },
                child: _showMenuIcon
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: SepteoSpacings.xl,
                          top: SepteoSpacings.md,
                          bottom: SepteoSpacings.md,
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
                                      color: SepteoColors.grey.shade900,
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
                                            color: SepteoColors.grey.shade900,
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
                                      isSelected
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: SepteoColors.grey.shade900,
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
  final String? selectedDestinationLabel;
  final Function(DestinationData data)? onSelected;

  const _ChildTile({
    required this.destination,
    this.selectedDestinationLabel,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    var isSelected = selectedDestinationLabel == destination.label;
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 30),
          width: isSelected ? 3 : 0,
          height: 56,
          color: SepteoColors.blue.shade900,
        ),
        InkWell(
          onTap: () {
            onSelected?.call(destination);
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: SepteoSpacings.xxl,
              top: SepteoSpacings.md,
              bottom: SepteoSpacings.md,
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Icon(
                  destination.icon,
                  color: SepteoColors.grey.shade900,
                ),
                const SizedBox(width: 10),
                Text(
                  destination.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: SepteoColors.grey.shade900,
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
