### Utiliser la navigation latérale

#### Propriétés
*  showMenuIcon (bool) : Affiche ou non l'icône du menu dans la barre de navigation (Mettre à false si vous utilisez une AppBar)
*  showRail (bool) : Affiche ou non le rail de navigation
*  body (Widget) : Le contenu de la page
*  destinations (List<DestinationData>) : Les éléments de la navigation
*  selectedDestinationLabel (String?) : Le label du menu sélectionné
*  onSelected (Function(DestinationData data)?) : Fonction appelée lorsqu'un élément est sélectionné, l'élément sélectionné est passé en paramètre
*  onSettings (Function()?) : Fonction appelée lorsqu'on clique sur l'icône des paramètres. Si la fonction est nulle ou non donnée, l'icône des paramètres n'est pas affichée

#### Exemple

Pour notre exemple ci, voici le code source :
```dart
NavigationMenu(
  onSettings: () {
    print("Settings");
  },
  body: Container(
    color: SepteoColors.blue.shade50,
  ),
  selectedDestinationLabel: "Tableau de bord",
  destinations: [
    DestinationData(icon: Icons.grid_view, label: "Tableau de bord"),
    DestinationData(icon: Icons.person, label: "Employés"),
    DestinationData(icon: Icons.content_paste, label: "Contrats"),
    DestinationData(
      icon: Icons.insert_chart_outlined,
      label: "Variables",
      children: [
        DestinationData(
          icon: Icons.radar,
          label: "Radar",
        ),
      ],
    ),
    DestinationData(icon: Icons.euro, label: "Bulletins de paie"),
    DestinationData(
      icon: Icons.emoji_flags,
      label: "Périodes clôturées",
    ),
  ],
  showRail: true,
  showMenuIcon: true,
)
```