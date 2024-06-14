### Exemple d'utilisation
    
```dart
class NavigationRailPresenter extends StatelessWidget {
  const NavigationRailPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 700,
        decoration: BoxDecoration(
          border: Border.all(
            color: ListoDesignSystem.themes.main.primaryColor,
            width: 3,
          ),
          color: ListoMainColors.primary.base,
        ),
        child: ListoNavigationRail(
          destinationData: [
            DestinationData(
              icon: Icons.home,
              label: 'Home',
              selectedIcon: Icons.home_filled,
              expendable: false,
            ),
            DestinationData(
              icon: Icons.add_chart,
              selectedIcon: Icons.add_chart,
              label: 'Charts',
              expendable: true,
            ),
            DestinationData(
              icon: Icons.area_chart,
              selectedIcon: Icons.area_chart,
              label: 'Area',
              expendable: false,
            ),
            DestinationData(
              icon: Icons.bar_chart,
              selectedIcon: Icons.bar_chart,
              label: 'Bar',
              expendable: false,
            ),
          ],
        ),
      ),
    );
    return const ListoNavigationRail(
      destinationData: [],
    );
  }
}
```
