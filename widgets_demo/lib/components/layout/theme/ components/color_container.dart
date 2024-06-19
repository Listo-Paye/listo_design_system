import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  final Color? color;
  final String? name;
  const ColorContainer({
    super.key,
    this.color,
    this.name,
  });

  double getLuminance() {
    return color?.computeLuminance() ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 85,
        child: Card(
          color: color,
          child: Center(
            child: Text(
              name?.split(".").last ?? "",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: getLuminance() > 0.5 ? Colors.black : Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
