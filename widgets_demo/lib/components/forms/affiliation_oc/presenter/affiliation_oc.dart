import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listo_design_system/molecules/affiliations_oc/affiliations_garantie_form.dart';
import 'package:listo_design_system/molecules/affiliations_oc/contrat_oc_entity.dart';
import 'package:listo_design_system/molecules/affiliations_oc/employee.dart';

class GestionAffiliationsFormPresenter extends StatefulWidget {
  const GestionAffiliationsFormPresenter({super.key});

  @override
  GestionAffiliationsFormPresenterState createState() =>
      GestionAffiliationsFormPresenterState();
}

class GestionAffiliationsFormPresenterState
    extends State<GestionAffiliationsFormPresenter> {
  // Simulation des données de l'employé
  final EmployeeForAffiliationOc fakeEmployee = EmployeeForAffiliationOc(
    nom: 'Norris',
    prenom: 'Chuck',
    dateDebut: '01/01/2023',
    dateFin: '31/12/2023',
    type: 'CDD',
  );

  late List<ContratOc> fakeContrats;

  @override
  void initState() {
    super.initState();
    fakeContrats = [
      ContratOc(
        libelleContrat: 'ALAN1',
        type: 'mutuelle',
        garanties: [
          GarantieContratOc(libelleGarantie: 'Option 1', souscrit: true),
          GarantieContratOc(libelleGarantie: 'Option 2', souscrit: false),
        ],
      ),
      ContratOc(
        libelleContrat: 'ALAN2',
        type: 'mutuelle',
        garanties: [
          GarantieContratOc(libelleGarantie: 'Option 1', souscrit: false),
          GarantieContratOc(libelleGarantie: 'Benefiz', souscrit: true),
        ],
      ),
      ContratOc(
        libelleContrat: 'ALAN1',
        type: 'prévoyance',
        garanties: [
          GarantieContratOc(libelleGarantie: 'Cadre TA (1/3)', souscrit: false),
          GarantieContratOc(libelleGarantie: 'Cadre TB (2/3)', souscrit: true),
        ],
      ),
      ContratOc(
        libelleContrat: 'ALAN2',
        type: 'prévoyance',
        garanties: [
          GarantieContratOc(
              libelleGarantie: 'Non cadre TA (1/2)', souscrit: true),
          GarantieContratOc(
              libelleGarantie: 'Prévoyance Ensemble du personnel',
              souscrit: false),
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

  void _onSave() {
    // Logique d'enregistrement des données
    if (kDebugMode) {
      print('Enregistrement des affiliations:');
    }
    for (var contrat in fakeContrats) {
      print('Contrat ${contrat.libelleContrat} (${contrat.type}):');
      for (var garantie in contrat.garanties) {
        print(
            ' - ${garantie.libelleGarantie}: ${garantie.souscrit ? "souscrit" : "non souscrit"}');
      }
    }
  }

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
