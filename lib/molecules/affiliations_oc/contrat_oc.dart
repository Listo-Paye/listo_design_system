import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ContratsOrganismeComplementaire extends StatefulWidget {
  final ContratOcWithGaranties contrat;
  final void Function(
          String contratLibelle, String garantieLibelle, bool newValue)
      onUpdateGarantie;

  const ContratsOrganismeComplementaire({
    super.key,
    required this.contrat,
    required this.onUpdateGarantie,
  });

  @override
  ContratsOrganismeComplementaireState createState() =>
      ContratsOrganismeComplementaireState();
}

class ContratsOrganismeComplementaireState
    extends State<ContratsOrganismeComplementaire> {
  late ContratOcWithGaranties _contrat;

  @override
  void initState() {
    super.initState();
    _contrat = widget.contrat;
  }

  void _handleGarantieChange(String garantieLibelle, bool? newValue) {
    setState(() {
      final garantie = _contrat.garanties
          .firstWhere((g) => g.libelleGarantie == garantieLibelle);
      garantie.souscrit = newValue!;
    });
    widget.onUpdateGarantie(
        _contrat.libelleContrat, garantieLibelle, newValue ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(
            _contrat.libelleContrat,
            style: SepteoTextStyles.bodySmallInterBold,
          ),
        ),
        SizedBox(height: SepteoSpacings.xxs),
        Column(
          children: _contrat.garanties.map((garantie) {
            return Padding(
              padding: const EdgeInsets.only(bottom: SepteoSpacings.xxs),
              child: CheckBoxWithText(
                value: garantie.souscrit,
                onChanged: (newValue) =>
                    _handleGarantieChange(garantie.libelleGarantie, newValue),
                text: garantie.libelleGarantie,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
