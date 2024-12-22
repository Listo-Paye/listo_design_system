import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'menu/menu_desktop.dart';

class DashboardDesktop extends StatefulWidget {
  final Widget selector;
  final Widget? initialFrame;
  final Widget? initialBoard;
  final double panelMaxWidth;
  final double panelMinWidth;

  const DashboardDesktop({
    super.key,
    required this.selector,
    this.initialFrame,
    this.initialBoard,
    this.panelMaxWidth = 400,
    this.panelMinWidth = 200,
  });

  factory DashboardDesktop.withMenu({
    Key? key,
    required String title,
    required List<MenuElement> items,
    String? selectedRoute,
    Widget? initialFrame,
    Widget? initialBoard,
  }) {
    return DashboardDesktop(
      selector: MenuDesktop(
        title: title,
        items: items,
        selectedRoute: selectedRoute,
      ),
      key: key,
      initialFrame: initialFrame,
      initialBoard: initialBoard,
    );
  }

  @override
  State<DashboardDesktop> createState() => DashboardDesktopState();
}

class DashboardDesktopState extends State<DashboardDesktop> {
  late Widget _frame;
  late Widget? _board;

  set frame(Widget frame) {
    setState(() {
      _frame = frame.animate().fade(delay: 300.ms);
    });
  }

  set board(Widget? board) {
    setState(() {
      _board = board?.animate().fade();
    });
  }

  bool get hasBoard => _board != null;

  @override
  void initState() {
    _frame = widget.initialFrame ?? Center(child: Text(''));
    _board = widget.initialBoard;
    super.initState();
  }

  double get panelWidth {
    var max = widget.panelMaxWidth;
    var min = widget.panelMinWidth;
    var width = MediaQuery.sizeOf(context).width * .3;
    if (width > max) {
      return max;
    }
    if (width < min) {
      return min;
    }
    return width;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SepteoSpacings.xxl,
        vertical: SepteoSpacings.xl,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: panelWidth,
            child: Padding(
              padding: const EdgeInsets.only(right: SepteoSpacings.md),
              child: widget.selector.animate().fade(),
            ),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: 300.ms,
              child: _frame,
            ),
          ),
          AnimatedContainer(
            duration: 200.ms,
            width: (_board == null || MediaQuery.sizeOf(context).width < 1200)
                ? 0
                : panelWidth,
            child: _board
                    ?.withPadding(
                        const EdgeInsets.only(left: SepteoSpacings.md))
                    .animate()
                    .scale() ??
                SizedBox(),
          ),
        ],
      ),
    );
  }
}
