import 'package:flutter/material.dart';

import '../../themes/spacing.dart';

abstract class ListoCard extends StatelessWidget {
  final IconData chevron;
  final void Function()? onSelect;
  final bool isSelected;
  const ListoCard({
    super.key,
    this.chevron = Icons.chevron_right,
    this.isSelected = false,
    this.onSelect,
  });

  String getAllText();
}

class RowSeparator extends StatelessWidget {
  const RowSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: Spacings.sm,
    );
  }
}
