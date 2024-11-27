import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'scaffold_presenter.dart';

class DashboardPresenter extends StatelessWidget {
  const DashboardPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<DashboardDesktopState>();
    return PresenterScaffold(
      child: DashboardDesktop(
        key: key,
        selector: Container(
          color: SepteoColors.blue.shade300,
          child: Center(
            child: Button(
                width: 150,
                onPressed: () {
                  if (key.currentState?.hasBoard ?? false) {
                    key.currentState?.board = null;
                  } else {
                    key.currentState?.board = Container(
                      color: SepteoColors.blue.shade300,
                    );
                  }
                },
                text: "BOARD"),
          ),
        ),
        initialFrame: Container(
          color: SepteoColors.orange.shade300,
        ),
      ),
    );
  }
}
