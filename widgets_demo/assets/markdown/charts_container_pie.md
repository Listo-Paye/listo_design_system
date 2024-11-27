Code Source de l'exemple :
```dart
  ChartContainer(
    buttonText: "Export des bulletins (17)",
    buttonIcon: Icon(Icons.file_download_outlined),
    onButtonPressed: () {},
    title: "Etat des bulletins",
    child: ChartPie(items: [
      ChartPieItem(
          value: 50,
          title: 'Calculé',
          color: SepteoColors.blue.shade600),
      ChartPieItem(
          value: 25,
          title: 'Envoyé',
          color: SepteoColors.green.shade600),
      ChartPieItem(
          value: 6,
          title: 'Non calculé',
          color: SepteoColors.red.shade600),
      ChartPieItem(
          value: 19,
          title: 'En cours',
          color: SepteoColors.orange.shade600),
    ]),
  )
```
