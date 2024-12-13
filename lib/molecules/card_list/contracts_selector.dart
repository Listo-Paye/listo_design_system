import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:skeletonizer/skeletonizer.dart';

//ignore_for_file: unused_element
class ContractsSelector extends StatefulWidget {
  /// Le nom donné aux objets de cette liste
  /// Doit être au pluriel
  ///
  /// * Exemple: "contrats"
  /// * Donne [Liste des contrats] et [Tous les contrats]
  ///
  final String nom;

  const ContractsSelector({
    super.key,
    required this.nom,
  });

  @override
  State<ContractsSelector> createState() => ContractsSelectorState();
}

class ContractsSelectorState extends State<ContractsSelector> {
  List<Widget> groups = [];

  String _convertToTitleCase(String text) {
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  void setElements(List<ContractVisualElement> elements) {
    setState(() {
      groups = [
        _Groupe(
          children: [
            _ContractsSelectorTitle(
              titre: "Tous les ${widget.nom}",
            ),
            _ElementCard(
              selected: true,
              child: _GroupedDataIconCard(
                icon: Icon(
                  Icons.home_outlined,
                  color: SepteoColors.blue.shade900,
                ),
                titre: "Tous les ${widget.nom}",
                indicateur: elements.length.toString(),
              ),
            ),
          ],
        ).animate().fade(),
      ];
    });
  }

  @override
  void initState() {
    groups = [
      Skeletonizer(
        child: _Groupe(
          children: [
            _ContractsSelectorTitle(
              titre: "Tous les ${widget.nom}",
            ),
            _ElementCard(
              selected: true,
              child: _GroupedDataIconCard(
                icon: Icon(
                  Icons.home_outlined,
                  color: SepteoColors.blue.shade900,
                ),
                titre: "Tous les ${widget.nom}",
                indicateur: "999",
              ),
            ),
          ],
        ),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SepteoSpacings.xs),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SepteoSpacings.xs,
          vertical: SepteoSpacings.md,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) => groups[index].animate().fade(
                delay: Duration(
                  milliseconds: index * 100,
                ),
              ),
          separatorBuilder: (_, __) => SizedBox(
            height: SepteoSpacings.md,
          ),
          itemCount: groups.length,
        ).animate().fade(duration: 100.ms),
      ),
    );
  }
}

class ContractVisualElement {
  final String titre;
  final String soustitre;
  final String details;

  ContractVisualElement({
    required this.titre,
    required this.soustitre,
    required this.details,
  });
}

class _ElementCard extends StatelessWidget {
  final bool selected;
  final Widget child;
  final Widget? indicator;
  final Function()? onTap;
  const _ElementCard({
    super.key,
    required this.selected,
    required this.child,
    this.indicator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: SepteoColors.blue.shade200,
          border: Border(
            left: BorderSide(
              color:
                  selected ? SepteoColors.orange.shade400 : Colors.transparent,
              width: 4,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: SepteoColors.orange.shade400,
              ),
            ),
            SizedBox(
              width: SepteoSpacings.xs,
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: SepteoSpacings.xs,
                  ),
                  child: child),
            ),
            SizedBox(
              width: SepteoSpacings.xs,
            ),
            indicator ?? const SizedBox(),
            Skeleton.keep(
              child: Icon(
                Icons.chevron_right,
                color: SepteoColors.orange.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupedDataIconCard extends StatelessWidget {
  final Widget? icon;
  final String titre;
  final String indicateur;
  const _GroupedDataIconCard({
    super.key,
    this.icon,
    required this.titre,
    required this.indicateur,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = [];
    if (icon != null) {
      elements.add(icon!);
      elements.add(SizedBox(
        width: SepteoSpacings.xs,
      ));
    }
    elements.add(Expanded(
      child: Text(
        titre,
        style: SepteoTextStyles.bodySmallInter,
        overflow: TextOverflow.ellipsis,
      ),
    ));
    if (indicateur.isNotEmpty) {
      elements.add(SizedBox(
        width: SepteoSpacings.xs,
      ));
      elements.add(Text(
        indicateur,
        style: SepteoTextStyles.bodyMediumInterBold.copyWith(
          fontSize: 17,
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: elements,
    );
  }
}

class _Groupe extends StatelessWidget {
  final List<Widget> children;
  const _Groupe({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: children,
    );
  }
}

class _ContractsSelectorTitle extends StatelessWidget {
  final String titre;
  const _ContractsSelectorTitle({
    super.key,
    required this.titre,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titre,
      style: SepteoTextStyles.bodySmallInterBold,
    );
  }
}
