### Gérer le layout de la page

```dart
class DashboardPresenter extends StatelessWidget {
  const DashboardPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<DashboardDesktopState>();
    return PresenterScaffold(
      child: DashboardDesktop(
        key: key,
        selector: Container(
          color: ListoMainColors.primary.medium,
          child: Center(
            child: Button(
                width: 150,
                onPressed: () {
                  if (key.currentState?.hasBoard ?? false) {
                    key.currentState?.board = null;
                  } else {
                    key.currentState?.board = Container(
                      color: ListoMainColors.info.medium,
                    );
                  }
                },
                text: "BOARD"),
          ),
        ),
        initialFrame: Container(
          color: ListoMainColors.secondary.medium,
        ),
      ),
    );
  }
}
```
