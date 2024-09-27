import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/spacing.dart';

class FormList extends StatelessWidget {
  final List<Widget> children;
  const FormList({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) => const SizedBox(height: Spacings.xs),
      itemCount: children.length,
    );
  }
}
