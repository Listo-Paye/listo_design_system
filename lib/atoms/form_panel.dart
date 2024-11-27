import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class FormPanel extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const FormPanel({
    super.key,
    required this.children,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var list = [
      Text(
        title,
        style: SepteoTextStyles.bodyMediumInterBold.copyWith(
          color: SepteoColors.blue.shade900,
        ),
      ),
      ...children,
    ];
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: SepteoColors.grey.shade500,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(SepteoSpacings.md),
        child: ListView.separated(
          itemBuilder: (context, index) => list[index],
          itemCount: list.length,
          separatorBuilder: (context, index) =>
              const SizedBox(height: SepteoSpacings.xl),
          shrinkWrap: true,
        ),
      ),
    );
  }
}
