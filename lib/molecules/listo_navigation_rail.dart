import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import '../widgets_demo/assets/images/septeo_logo.dart';

class DestinationData {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool? expendable;

  DestinationData({required this.icon, required this.selectedIcon, required this.label, this.expendable});
}

class ListoNavigationRail extends StatefulWidget {
  const ListoNavigationRail({super.key, required this.destinationData});

  final List<DestinationData> destinationData;

  @override
  ListoNavigationRailState createState() => ListoNavigationRailState();
}

class ListoNavigationRailState extends State<ListoNavigationRail> {
  int _selectedIndex = 0;
  bool extended = true;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  bool _variablesExpanded = false;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      drawer: SafeArea(
        child: IntrinsicWidth(
          child: SizedBox(
            height: size.height,
            child: NavigationRail(
              selectedIndex: _selectedIndex,
              destinations: _buildDestinations(),
              extended: extended,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              leading: MyNavigationRailFab(onPressed: () {
                setState(() {
                  extended = !extended;
                });
              }),
              trailing: const Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: NavigationRailTrailing(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<NavigationRailDestination> _buildDestinations() {
    return widget.destinationData.map((data) {
      return NavigationRailDestination(
        icon: Icon(data.icon),
        selectedIcon: Icon(data.selectedIcon),
        label: Text(data.label, style: TextStyles.bodyMedium),
        padding: const EdgeInsets.symmetric(vertical: Spacings.xs, horizontal: Spacings.xs),
      );
    }).toList();
  }
}

class MyNavigationRailFab extends StatelessWidget {
  const MyNavigationRailFab({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =
    NavigationRail.extendedAnimation(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        // The extended fab has a shorter height than the regular fab.
        return Container(
            height: 56,
            padding: animation.value == 0 ? EdgeInsets.symmetric(
              vertical: lerpDouble(0, 6, animation.value)!,) : EdgeInsets.zero,
            child: animation.value == 0 ? MouseRegion(
                      cursor: SystemMouseCursors.click,
              child: GestureDetector(
                  onTap: onPressed,
                  child: Center(
                    child: septeoLogo,
                  ),
            )
            ) : Container(
              margin: const EdgeInsetsDirectional.only(start: Spacings.md, top: 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),

                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: onPressed,
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              end: 20, top: 0),
                          child: septeoLogo,
                        ),
                      ),
                    )
                  ]
              ),
            )
        );
      },
    );
  }
}

class NavigationRailTrailing extends StatefulWidget {
  const NavigationRailTrailing({super.key});

  @override
  _NavigationRailTrailingState createState() => _NavigationRailTrailingState();
}

class _NavigationRailTrailingState extends State<NavigationRailTrailing> with SingleTickerProviderStateMixin {
  late AnimationController _opacityController;
  late Animation<double> _opacityAnimation;
  bool _wasAnimationOne = false;

  @override
  void initState() {
    super.initState();
    _opacityController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_opacityController);
  }

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = NavigationRail.extendedAnimation(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        if (animation.value == 1 && !_wasAnimationOne) {
          _opacityController.reset();
          _opacityController.forward();
          _wasAnimationOne = true;
        } else if (animation.value < 1 && _wasAnimationOne) {
          _wasAnimationOne = false;
        }

        return MouseRegion(
            cursor: SystemMouseCursors.click,
          child: Padding(
            padding: const EdgeInsets.only(left: Spacings.lg, bottom: Spacings.md),
            child: animation.value < 1 ? const Row(
              children: [
                Icon(Icons.settings_outlined),
              ],
            ) : Row(
              children: [
                const Icon(Icons.settings_outlined),
                const SizedBox(width: Spacings.md),
                FadeTransition(
                  opacity: _opacityAnimation,
                  child: Text('Paramètres', style: TextStyles.bodyMedium),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}