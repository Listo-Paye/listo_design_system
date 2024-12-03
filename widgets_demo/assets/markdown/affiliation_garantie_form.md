# Formulaire d'affiliation des garanties

Le Formulaire d'Affiliation des Garanties est un composant qui permet de gérer les affiliations d'un employé aux garanties des contrats d'organismes complémentaires, tels que les mutuelles ou les prévoyances. Ce formulaire facilite la sélection et la mise à jour des garanties associées à un employé, en offrant une interface interactive et accessible.

## Objectif du Formulaire
Dans le contexte de notre application, le formulaire est utilisé pour :
 - Présenter les contrats d'organismes complémentaires disponibles (mutuelles et prévoyances) avec leurs garanties respectives.
 - Permettre à l'utilisateur de sélectionner ou désélectionner les garanties auxquelles l'employé doit être affilié.

Pour intégrer le Formulaire d'Affiliation des Garanties dans votre application, vous devez utiliser le widget AffiliationGarantieForm du design system. Ce widget est contrôlé par son parent, ce qui signifie que vous gérez l'état des affiliations dans votre propre widget, en passant les données nécessaires et les fonctions de rappel pour les interactions.

## Exemple d'implémentation
Voici un exemple d'implémentation du formulaire en utilisant un Presenter pour simuler les données et les interactions :
```dart
import 'package:flutter/material.dart';
import 'package:listo_design_system/molecules/affiliations_oc/affiliation_garantie_form.dart';
import 'package:listo_design_system/molecules/affiliations_oc/contrat_oc_entity.dart';
import 'package:listo_design_system/molecules/affiliations_oc/employee.dart';

class AffiliationGarantieFormPresenter extends StatefulWidget {
  const AffiliationGarantieFormPresenter({Key? key}) : super(key: key);

  @override
  _AffiliationGarantieFormPresenterState createState() => _AffiliationGarantieFormPresenterState();
}

class _AffiliationGarantieFormPresenterState extends State<AffiliationGarantieFormPresenter> {
  // Simulation des données de l'employé
  final EmployeeForAffiliationOc fakeEmployee = EmployeeForAffiliationOc(
    nom: 'Norris',
    prenom: 'Chuck',
    dateDebut: '01/01/2023',
    dateFin: '31/12/2023',
    type: 'CDD',
  );

  // Simulation des contrats
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
          GarantieContratOc(libelleGarantie: 'Non cadre TA (1/2)', souscrit: true),
          GarantieContratOc(libelleGarantie: 'Prévoyance Ensemble du personnel', souscrit: false),
        ],
      ),
    ];
  }

  void _onUpdateGarantie(String contratLibelle, String garantieLibelle, bool newValue, String type) {
    setState(() {
      final contrat = fakeContrats.firstWhere(
              (c) => c.libelleContrat == contratLibelle && c.type == type);
      final garantie = contrat.garanties
          .firstWhere((g) => g.libelleGarantie == garantieLibelle);
      garantie.souscrit = newValue;
    });
  }

  void _onReset() {
    // Vos règles au clic sur le bouton "Annuler"
  }

  void _onSave() {
    // Logique d'enregistrement des données
    print('Enregistrement des affiliations:');
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

```
 - **Données de l'employé** : Un objet **EmployeeForAffiliationOc** est créé pour représenter l'employé.
 - **Contrats et Garanties** : Une liste de **ContratOc** est initialisée avec des garanties associées.
 - **Fonction _onUpdateGarantie** : Mise à jour de l'état d'une garantie lorsqu'elle est sélectionnée ou désélectionnée.
 - **Fonction _onReset** : Réinitialise toutes les garanties à non souscrites.
 - **Fonction _onSave** : Simule l'enregistrement des données en affichant les affiliations dans la console.
 - **Widget AffiliationGarantieForm** : Le formulaire est construit en passant les données et les fonctions de rappel.

## Détail des propriétés

| Propriété  | Type           | Description |
| :--------------- |:-----------------|:----------------|
| **_employee_**  | **EmployeeForAffiliationOc**         | 'employé concerné par les affiliations. Contient les informations telles que le nom, le prénom, la date de début et de fin, et le type de contrat.|
| **_contrats_**  | **List<ContratOc>**              | La liste des contrats disponibles (mutuelle et prévoyance) avec leurs garanties respectives. |
| **_onUpdateGarantie_**  | **Function(String contratLibelle, String garantieLibelle, bool newValue, String type)**           | Fonction de rappel appelée lorsqu'une garantie est sélectionnée ou désélectionnée. |
| **_onReset_**  | **VoidCallback**           | Fonction de rappel appelée lorsque l'utilisateur clique sur le bouton "Annuler" pour réinitialiser les sélections. |
| **_onSave_**  | **VoidCallback**           | Fonction de rappel appelée lorsque l'utilisateur clique sur le bouton "Enregistrer" pour sauvegarder les affiliations. |


## ContratOc

| Propriété  | Type           | Description |
| :--------------- |:-----------------|:----------------|
| _**libelleContrat**_  |   **String**        |  Le nom du contrat (par exemple, "ALAN1"). |
| _**type**_  | **String**             |   Le type du contrat ("mutuelle" ou "prévoyance"). |
| _**garanties**_  | **List<GarantieContratOc>**          |    La liste des garanties associées au contrat. |



## GarantieContratOc

| Propriété  | Type           | Description |
| :--------------- |:-----------------|:----------------|
| _**libelleGarantie**_  |   **String**        |  Le nom de la garantie (par exemple, "Option 1"). |
| _**souscrit**_  | **bool**             |   Indique si la garantie est souscrite (true) ou non (false). |


## Accessibilité et interactions

Le formulaire a été conçu pour être accessible :

 - **Navigation au clavier** : Les utilisateurs peuvent naviguer dans le formulaire en utilisant la touche Tab.
 - **Labels pour les lecteurs d'écran** : Les éléments ont des labels appropriés pour être lus par les lecteurs d'écran.
 - **Activation via la touche Entrée** : Les cases à cocher et les boutons peuvent être activés en appuyant sur Entrée ou Espace.
