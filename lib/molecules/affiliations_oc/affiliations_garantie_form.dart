import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class AffiliationGarantieForm extends StatefulWidget {
  final EmployeeForAffiliationOc employee;
  final List<ContratOcWithGaranties> contrats;
  final void Function(String contratLibelle, String garantieLibelle,
      bool newValue, String type) onUpdateGarantie;
  final VoidCallback onReset;
  final VoidCallback onSave;

  const AffiliationGarantieForm({
    super.key,
    required this.employee,
    required this.contrats,
    required this.onUpdateGarantie,
    required this.onReset,
    required this.onSave,
  });

  @override
  AffiliationGarantieFormState createState() => AffiliationGarantieFormState();
}

class AffiliationGarantieFormState extends State<AffiliationGarantieForm> {
  late List<ContratOcWithGaranties> _contrats;

  @override
  void initState() {
    super.initState();
    _contrats = widget.contrats;
  }

  void _handleUpdateGarantie(String contratLibelle, String garantieLibelle,
      bool newValue, String type) {
    setState(() {
      final contrat = _contrats.firstWhere(
          (c) => c.libelleContrat == contratLibelle && c.type == type);
      final garantie = contrat.garanties
          .firstWhere((g) => g.libelleGarantie == garantieLibelle);
      garantie.souscrit = newValue;
    });
    widget.onUpdateGarantie(contratLibelle, garantieLibelle, newValue, type);
  }

  void _handleReset() {
    setState(() {
      for (var contrat in _contrats) {
        for (var garantie in contrat.garanties) {
          garantie.souscrit = false;
        }
      }
    });
    widget.onReset();
  }

  @override
  Widget build(BuildContext context) {
    final contratsMutuelle =
        _contrats.where((c) => c.type == 'mutuelle').toList();
    final contratsPrevoyance =
        _contrats.where((c) => c.type == 'prevoyance').toList();

    return SingleChildScrollView(
      child: Container(
        color: SepteoColors.blue.shade50,
        padding: const EdgeInsets.fromLTRB(
            0, 0, SepteoSpacings.md, SepteoSpacings.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(SepteoSpacings.sm),
              ),
              child: Padding(
                padding: const EdgeInsets.all(SepteoSpacings.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SepteoSpacings.xxs),
                    Semantics(
                      header: true,
                      child: Text(
                        'Gérer les affiliations',
                        style: SepteoTextStyles.bodyLargeInterBold,
                      ),
                    ),
                    SizedBox(height: SepteoSpacings.lg),
                    ClientCardV2(employee: widget.employee),
                    const SizedBox(height: SepteoSpacings.md),
                    Semantics(
                      header: true,
                      child: Text(
                        'Contrats de mutuelle',
                        style: SepteoTextStyles.bodySmallInter,
                      ),
                    ),
                    if (contratsMutuelle.isNotEmpty) ...[
                      const SizedBox(height: SepteoSpacings.xxs),
                      for (var contrat in contratsMutuelle) ...[
                        ContratsOrganismeComplementaire(
                          contrat: contrat,
                          onUpdateGarantie:
                              (contratLibelle, garantieLibelle, newValue) {
                            _handleUpdateGarantie(contratLibelle,
                                garantieLibelle, newValue, 'mutuelle');
                          },
                        ),
                      ],
                    ] else ...[
                      SizedBox(height: SepteoSpacings.xs),
                      Center(
                        child: Semantics(
                          header: true,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Il n\'y a pas de contrat de mutuelle actif. Veuillez le paramétrer dans les paramètres de l\'établissement',
                              style: SepteoTextStyles.bodySmallInter,
                            ),
                          ),
                        ),
                      )
                    ],
                    const SizedBox(height: SepteoSpacings.xs),
                    Semantics(
                      header: true,
                      child: Text(
                        'Contrats de prévoyance',
                        style: SepteoTextStyles.bodySmallInter,
                      ),
                    ),
                    if (contratsPrevoyance.isNotEmpty) ...[
                      const SizedBox(height: SepteoSpacings.xxs),
                      for (var contrat in contratsPrevoyance) ...[
                        ContratsOrganismeComplementaire(
                          contrat: contrat,
                          onUpdateGarantie:
                              (contratLibelle, garantieLibelle, newValue) {
                            _handleUpdateGarantie(contratLibelle,
                                garantieLibelle, newValue, 'prévoyance');
                          },
                        ),
                      ],
                    ] else ...[
                      SizedBox(height: SepteoSpacings.xs),
                      Center(
                        child: Semantics(
                          header: true,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Il n\'y a pas de contrat de prévoyance actif. Veuillez le paramétrer dans les paramètres de l\'établissement',
                              style: SepteoTextStyles.bodySmallInter,
                            ),
                          ),
                        ),
                      )
                    ],
                    SizedBox(height: SepteoSpacings.sm),
                    // Boutons d'action
                    Row(
                      // spacing: SepteoSpacings.sm,
                      // runSpacing: SepteoSpacings.sm,
                      children: [
                        Expanded(
                          // width: 150,
                          child: Button(
                            style: ButtonType.secondary,
                            text: 'Annuler',
                            onPressed: _handleReset,
                          ),
                        ),
                        SizedBox(width: SepteoSpacings.sm),
                        Expanded(
                          // width: 150,
                          child: Button(
                            style: ButtonType.primary,
                            text: 'Enregistrer',
                            onPressed: widget.onSave,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SepteoSpacings.xxl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
