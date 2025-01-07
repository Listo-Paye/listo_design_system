import 'package:flutter/material.dart';
import 'package:listo_design_system/molecules/affiliations_oc/affiliations_garantie_form.dart';
import 'package:listo_design_system/molecules/affiliations_oc/contrat_oc_entity.dart';
import 'package:listo_design_system/molecules/affiliations_oc/employee.dart';

class AffiliationGarantieFormPresenter extends StatefulWidget {
  const AffiliationGarantieFormPresenter({super.key});

  @override
  AffiliationGarantieFormPresenterState createState() =>
      AffiliationGarantieFormPresenterState();
}

class AffiliationGarantieFormPresenterState
    extends State<AffiliationGarantieFormPresenter> {
  // Simulation des données de l'employé
  final EmployeeForAffiliationOc fakeEmployee = EmployeeForAffiliationOc(
    nom: 'Norris Chuck',
    dateDebut: '01/01/2023',
    dateFin: '31/12/2023',
    type: 'CDD',
  );

  late List<ContratOcWithGaranties> fakeContrats;

  @override
  void initState() {
    super.initState();
    fakeContrats = [
      ContratOcWithGaranties(
        id: 'udhfiuds',
        libelleContrat: 'Mutuelle Benefiz',
        type: 'mutuelle',
        garanties: [
          GarantieContratOc(
              id: '1', libelleGarantie: 'Assuré seul', souscrit: true),
          GarantieContratOc(
              id: '2',
              libelleGarantie: 'Assuré avec conjoint',
              souscrit: false),
        ],
      ),
      ContratOcWithGaranties(
        id: 'udhfiuds',
        libelleContrat: 'Mutuelle MACIF',
        type: 'mutuelle',
        garanties: [
          GarantieContratOc(
              id: '3', libelleGarantie: 'Assuré seul', souscrit: false),
          GarantieContratOc(
              id: '4', libelleGarantie: 'Assuré avec conjoint', souscrit: true),
        ],
      ),
      ContratOcWithGaranties(
        id: 'udhfiuds',
        libelleContrat: 'Prévoyance AG2R',
        type: 'prevoyance',
        garanties: [
          GarantieContratOc(
              id: '5',
              libelleGarantie: 'X pourcent  du plafond SS Assure 18',
              souscrit: false),
          GarantieContratOc(id: '6', libelleGarantie: 'TAPrev', souscrit: true),
        ],
      ),
      ContratOcWithGaranties(
        id: 'udhfiuds',
        libelleContrat: 'Prévoyance MMA',
        type: 'prevoyance',
        garanties: [
          GarantieContratOc(id: '7', libelleGarantie: 'TBPrev', souscrit: true),
          GarantieContratOc(
              id: '8', libelleGarantie: 'TAPrev', souscrit: false),
        ],
      ),
    ];
  }

  void _onUpdateGarantie(String contratLibelle, String garantieLibelle,
      bool newValue, String type) {
    setState(() {
      final contrat = fakeContrats.firstWhere(
          (c) => c.libelleContrat == contratLibelle && c.type == type);
      final garantie = contrat.garanties
          .firstWhere((g) => g.libelleGarantie == garantieLibelle);
      garantie.souscrit = newValue;
    });
  }

  void _onReset() {
    setState(() {
      for (var contrat in fakeContrats) {
        for (var garantie in contrat.garanties) {
          garantie.souscrit = false;
        }
      }
    });
  }

  void _onSave() {}

  @override
  Widget build(BuildContext context) {
    return AffiliationGarantieForm(
      employee: fakeEmployee,
      contrats: fakeContrats,
      onUpdateGarantie: _onUpdateGarantie,
      onReset: _onReset,
      onSave: _onSave,
    );
  }
}
