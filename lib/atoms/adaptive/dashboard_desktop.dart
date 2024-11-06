import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:listo_design_system/listo_design_system.dart';

class DashboardDesktop extends StatefulWidget {
  final Widget selector;
  final Widget? initialFrame;
  final Widget? initialBoard;

  const DashboardDesktop({
    super.key,
    required this.selector,
    this.initialFrame,
    this.initialBoard,
  });

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacings.lg,
        vertical: Spacings.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: Spacings.sm),
              child: widget.selector.animate().fade(),
            ),
          ),
          Flexible(
            flex: _board == null ? 3 : 2,
            child: AnimatedContainer(
              duration: 300.ms,
              child: _frame,
            ),
          ),
          AnimatedContainer(
            duration: 300.ms,
            child: (_board == null)
                ? SizedBox()
                : Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: Spacings.sm),
                      child: _board!,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
