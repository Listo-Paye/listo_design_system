Code source de notre exemple :
```dart
Container(
  height: 300,
  decoration: BoxDecoration(
    color: SepteoColors.blue.shade50,
  ),
  child: Padding(
      padding: const EdgeInsets.all(SepteoSpacings.xl),
      child: Center(
        child: ChartPie(items: [
          ChartPieItem(
            value: 19.3,
            title: 'Title 1',
          ),
          ChartPieItem(
            value: 30,
            title: 'Title 2',
          ),
          ChartPieItem(
            value: 50.7,
            title: 'Title 3',
          ),
        ]),
      )),
)
```
