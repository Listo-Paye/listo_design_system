import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ChiffreCle extends StatelessWidget {
  final ChiffreCleItem item;
  const ChiffreCle({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: Column(
        children: [
          Text("${item.chiffre}", style: SepteoTextStyles.headingMediumInter),
          Text(item.label, style: SepteoTextStyles.captionInter),
        ],
      )),
    );
  }
}

class ChiffreCleRow extends StatelessWidget {
  final List<ChiffreCleItem> items;
  const ChiffreCleRow({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: items.map((e) => ChiffreCle(item: e)).toList(),
      ),
    );
  }
}

class ChiffreCleItem {
  final int chiffre;
  final String label;

  ChiffreCleItem({required this.chiffre, required this.label});
}
