import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:listo_design_system/listo_design_system.dart';

@Deprecated('Ce composant sera bientôt supprimé pour une refonte complète.')
class AdaptiveMasterDetails extends StatefulWidget {
  final Widget child;

  const AdaptiveMasterDetails({
    super.key,
    required this.child,
  });

  static AdaptiveMasterDetailsState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<AdaptiveMasterDetailsState>() ??
      context.findRootAncestorStateOfType<AdaptiveMasterDetailsState>();

  static FutureOr<void> navigate(BuildContext context,
      FutureOr<Widget> Function(BuildContext context) builder) async {
    final state = maybeOf(context);
    if (state != null) {
      state.setSecond(await builder(context));
    }
  }

  static FutureOr<void> show(BuildContext context,
      FutureOr<Widget> Function(BuildContext context) builder) async {
    final state = maybeOf(context);
    if (state != null) {
      state.setThird(await builder(context));
    }
  }

  static void pop(BuildContext context) {
    final state = maybeOf(context);
    if (state != null) {
      state.remove();
    }
  }

  @override
  State<AdaptiveMasterDetails> createState() => AdaptiveMasterDetailsState();
}

class AdaptiveMasterDetailsState extends State<AdaptiveMasterDetails> {
  Widget? _second;
  Widget? _third;
  Widget empty = const Expanded(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Sélectionnez un élément",
          ),
          Text("📖", style: TextStyle(fontSize: 32)),
        ],
      ),
    ),
  );

  void setSecond(Widget widget) {
    setState(() {
      _second = null;
      _second = widget;
      _third = null;
    });
  }

  void setThird(Widget widget) {
    setState(() {
      _third = widget;
    });
  }

  void remove() {
    setState(() {
      if (_third != null) {
        _third = null;
      } else if (_second != null) {
        _second = null;
      }
    });
  }

  List<Widget> get _children => switch ((_second, _third)) {
        (null, null) => [empty],
        (_, null) => [_second!],
        (_, _) => [
            _second!,
            const SizedBox(
              width: SepteoSpacings.md,
            ),
            _third!
          ],
      };

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return (_third ?? _second ?? widget.child).animate().fadeIn();
          } else {
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: SepteoSpacings.md),
                    child: widget.child,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      ..._children,
                    ],
                  ),
                ),
              ],
            );
          }
        },
      );
}
