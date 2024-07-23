import 'package:flutter/material.dart';

import '../../themes/spacing.dart';

abstract class ListoCard extends StatelessWidget {
  const ListoCard({super.key});

  String getAllText();
}

class RowSeparator extends StatelessWidget {
  const RowSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: Spacings.sm,
    );
  }
}
