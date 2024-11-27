import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class NavigationTabs extends StatefulWidget {
  final String selectedTab;
  final List<String> tabs;
  final Function(String) onTabSelected;

  const NavigationTabs({
    super.key,
    required this.selectedTab,
    required this.tabs,
    required this.onTabSelected,
  });

  @override
  State<NavigationTabs> createState() => _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  final List<GlobalKey> _tabKeys = [];
  bool _isFirstBuild = true;

  @override
  void initState() {
    super.initState();
    _tabKeys.addAll(List.generate(widget.tabs.length, (_) => GlobalKey()));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => _isFirstBuild = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            for (var i = 0; i < widget.tabs.length; i++)
              InkWell(
                key: _tabKeys[i],
                onTap: () => widget.onTabSelected(widget.tabs[i]),
                splashColor: SepteoColors.blue.shade50,
                hoverColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(SepteoSpacings.md),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    style: SepteoTextStyles.bodySmallInterBold.copyWith(
                      color: widget.tabs[i] == widget.selectedTab
                          ? SepteoColors.orange.shade600
                          : SepteoColors.grey.shade700,
                    ),
                    child: Text(widget.tabs[i]),
                  ),
                ),
              ),
          ],
        ),
        if (!_isFirstBuild)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            left: _calculateIndicatorPosition(),
            bottom: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: _getSelectedTabWidth() * 0.5,
              height: 3,
              decoration: BoxDecoration(
                color: SepteoColors.orange.shade600,
                borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
              ),
            ),
          ),
      ],
    );
  }

  double _getSelectedTabWidth() {
    final selectedIndex = widget.tabs.indexOf(widget.selectedTab);
    final RenderBox? renderBox = _tabKeys[selectedIndex]
        .currentContext
        ?.findRenderObject() as RenderBox?;
    return renderBox?.size.width ?? 0;
  }

  double _calculateIndicatorPosition() {
    final selectedIndex = widget.tabs.indexOf(widget.selectedTab);
    final RenderBox? renderBox = _tabKeys[selectedIndex]
        .currentContext
        ?.findRenderObject() as RenderBox?;
    if (renderBox == null) return 0;

    final tabWidth = renderBox.size.width;
    final position = renderBox
        .localToGlobal(Offset.zero, ancestor: context.findRenderObject())
        .dx;
    return position + (tabWidth * 0.25);
  }
}
