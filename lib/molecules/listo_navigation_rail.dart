import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listo_design_system/themes/spacing.dart';
import 'package:listo_design_system/themes/themes_module.dart';

var septeoLogo = SvgPicture.string("""
  <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
    <g id="Logo" clip-path="url(#clip0_20_1500)">
        <path id="Union" fill-rule="evenodd" clip-rule="evenodd"
              d="M3.27586 17.6686L4.60462 18.9524C4.69119 19.011 4.81238 19.011 4.86864 18.9524L24.3066 0H21.1167L3.27586 17.4093C3.1893 17.4929 3.1893 17.61 3.27586 17.6644V17.6686ZM17.8662 0.0333511L1.64839 15.8744V15.8703C1.59212 15.9246 1.47093 15.9246 1.38437 15.841L0.0556078 14.5571C-0.0309564 14.4735 -0.00498709 14.3606 0.0556078 14.302L14.6763 0.0333511H17.8662ZM1.23291 32L23.8911 9.85262C23.9776 9.79826 24.0945 9.79826 24.1551 9.91117L25.5142 11.195C25.6007 11.2787 25.5748 11.3916 25.5142 11.4501L4.4228 32H1.23291ZM27.1112 12.989L7.64728 31.9958H10.8372L28.7083 14.5865C28.7689 14.5029 28.7689 14.3858 28.7083 14.3314L27.3796 13.0476C27.319 12.9054 27.2021 12.9054 27.1156 12.989H27.1112ZM14.0834 32L30.3315 16.1296V16.1338C30.418 16.0795 30.5392 16.0795 30.6258 16.1631L31.9546 17.4469C32.0151 17.5013 32.0151 17.6184 31.9546 17.702L17.2733 32H14.0834ZM7.79444 22.0932L6.46568 20.8093C6.40509 20.7549 6.40509 20.6379 6.46568 20.5542L27.5268 0.00430021H30.7166L8.05847 22.0932C8.0022 22.1517 7.88101 22.1517 7.79444 22.0932Z"
              fill="#FF6136" />
    </g>
    <defs>
        <clipPath id="clip0_20_1500">
            <rect width="32" height="32" fill="white" />
        </clipPath>
    </defs>
  </svg>
  """);

class DestinationData {
  final IconData icon;
  final String label;
  final List? children;
  // final bool expendable;

  DestinationData({required this.icon, required this.label, this.children});
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
  double groupAlignment = -1.0;
  List<bool> _isExtendedList = [];
  List<NavigationRailDestination> _destinations = [];

  @override
  void initState() {
    super.initState();
    _isExtendedList = List.filled(widget.destinationData.length, false);
    _destinations = _buildCustomDestinations();
  }

  void _updateDestinations(int selectedIndex) {
    setState(() {
      _destinations = _buildCustomDestinations(selectedIndex: selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('_selectedIndex $_selectedIndex');
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      drawer: SafeArea(
        child: IntrinsicWidth(
          child: SizedBox(
            height: size.height,
            child: NavigationRail(
              useIndicator: true,
              indicatorColor: Colors.transparent,
              selectedIndex: _selectedIndex,
              destinations: _destinations,
              extended: extended,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                  if (widget.destinationData[index].children != null) {
                    _isExtendedList[index] = !_isExtendedList[index];
                  }
                });
                _updateDestinations(index);
              },
              leading: NavigationRailLeading(onPressed: () {
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

  List<NavigationRailDestination> _buildCustomDestinations({int? selectedIndex}) {
    List<NavigationRailDestination> destinations = [];

    for(int index = 0; index < widget.destinationData.length; index++) {
      var data = widget.destinationData[index];
      bool isExtendable = data.children != null;
      bool isExtended = _isExtendedList[index];

      // Add the main destination
      var destination = NavigationRailDestination(
        icon: _buildDestinationIcon(data.icon, index == _selectedIndex),
        label: isExtendable
            ? Row(
          children: [
            Text(data.label, style: TextStyles.bodyMedium),
            const SizedBox(width: Spacings.md),
            Icon(
              isExtended ? Icons.expand_more : Icons.expand_less,
            ),
          ],
        )
            : Text(data.label, style: TextStyles.bodyMedium),
        padding: const EdgeInsets.symmetric(vertical: Spacings.xs),
      );
      destinations.add(destination);

      // Add children destinations if extended
      if (isExtended && data.children != null) {
        data.children!.asMap().forEach((childIndex, childData) {
          destinations.add(NavigationRailDestination(
            icon: const SizedBox.shrink(),
            label: Transform.translate(
              offset: const Offset(-Spacings.md, 0),
              child: Text(childData.label, style: TextStyles.bodyMedium),
            ),
            padding: const EdgeInsets.symmetric(vertical: Spacings.xs),
          ));
        });
      }
    }

    debugPrint('destinations in Build $destinations');
    return destinations;
  }

  Widget _buildDestinationIcon(IconData icon, bool isSelected) {
    return Stack(
      children: [
        if (isSelected)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 4.0,
              color: ListoMainColors.primary,
            ),
          ),
        Center(
          child: Icon(icon),
        ),
      ],
    );
  }
}

class NavigationRailLeading extends StatelessWidget {
  const NavigationRailLeading({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = NavigationRail.extendedAnimation(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Container(
          height: 60,
          child: Stack(
            children: [
              if (animation.value < 0.5)
                Padding(padding: const EdgeInsets.only(top: Spacings.sm, left: 10, right: 10), child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: onPressed,
                        child: septeoLogo,
                      ),
                    ),
                  ],
                ))
                // )
              else
                Padding(padding: const EdgeInsets.only(top: Spacings.sm, left: 10, right: 10), child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: FadeTransition(
                          opacity: animation,
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: onPressed,
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              end: Spacings.sm),
                          child: septeoLogo,
                        ),
                      ),
                    ),
                  ],
                ))
            ],
          ),
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
      duration: const Duration(milliseconds: 200),
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
            padding: const EdgeInsets.only(left: 26, bottom: Spacings.md),
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