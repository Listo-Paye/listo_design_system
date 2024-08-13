import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:listo_design_system/listo_design_system.dart';

class AdaptiveMdd extends StatelessWidget {
  final Widget first;
  final List<Widget> others;

  const AdaptiveMdd({
    super.key,
    required this.first,
    this.others = const [],
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return (others.isNotEmpty ? others.last : first).animate().fadeIn();
        }
        return Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: Spacings.sm),
                child: first,
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: AnimateList(
                  interval: 100.ms,
                  effects: [FadeEffect(duration: 500.ms)],
                  autoPlay: true,
                  children: [
                    ...others.isNotEmpty
                        ? others.map((widget) => Expanded(child: widget))
                        : [const _EmptyFrame()],
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class _EmptyFrame extends StatelessWidget {
  const _EmptyFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
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
    );
  }
}
