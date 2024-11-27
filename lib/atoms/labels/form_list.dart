import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

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
      separatorBuilder: (context, index) => const SizedBox(height: SepteoSpacings.xs),
      itemCount: children.length,
    );
  }
}
