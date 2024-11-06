import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:listo_design_system/listo_design_system.dart';

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
              titre: "Tous des ${widget.nom}",
            ),
            _ElementCard(
              selected: true,
              child: _GroupedDataIconCard(
                icon: Icon(
                  Icons.home_outlined,
                  color: ListoMainColors.primary.base,
                ),
                titre: "Tous les ${widget.nom}",
                indicateur: elements.length.toString(),
              ),
            ),
          ],
        ),
      ];
    });
  }

  @override
  void initState() {
    groups = [
      _Groupe(
        children: [
          _ContractsSelectorTitle(
            titre: _convertToTitleCase(widget.nom),
          ),
          SizedBox(
            height: 10,
            child: LinearProgressIndicator(
              backgroundColor: ListoMainColors.neutral.shade100,
              valueColor: AlwaysStoppedAnimation(
                ListoMainColors.secondary.medium,
              ),
              borderRadius: BorderRadius.circular(Spacings.xs),
            ),
          ),
          _ContractsSelectorTitle(
            titre: "Chargement en cours...",
          ),
        ],
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacings.xs),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacings.xs,
          vertical: Spacings.sm,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) => groups[index].animate().fade(
                delay: Duration(
                  milliseconds: index * 100,
                ),
              ),
          separatorBuilder: (_, __) => SizedBox(
            height: Spacings.sm,
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
          color: ListoMainColors.primary.light,
          border: Border(
            left: BorderSide(
              color: selected
                  ? ListoMainColors.secondary.darker
                  : Colors.transparent,
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
                color: ListoMainColors.secondary.darker,
              ),
            ),
            SizedBox(
              width: Spacings.xs,
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Spacings.xs,
                  ),
                  child: child),
            ),
            SizedBox(
              width: Spacings.xs,
            ),
            indicator ?? const SizedBox(),
            Icon(
              Icons.chevron_right,
              color: ListoMainColors.secondary.darker,
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
        width: Spacings.xs,
      ));
    }
    elements.add(Expanded(
      child: Text(
        titre,
        style: TextStyles.labelLarge.copyWith(
          color: ListoMainColors.neutral.shade900,
          fontSize: 14,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    ));
    if (indicateur.isNotEmpty) {
      elements.add(SizedBox(
        width: Spacings.xs,
      ));
      elements.add(Text(
        indicateur,
        style: TextStyles.headingMediumSemibold.copyWith(
          color: ListoMainColors.neutral.shade900,
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
      style: TextStyles.bodyMediumSemibold.copyWith(
        color: ListoMainColors.neutral.shade900,
      ),
    );
  }
}
