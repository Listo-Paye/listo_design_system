import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class MicroService {
  String title;
  bool isHealthy;

  MicroService({required this.title, required this.isHealthy});
}

class Environment {
  String name;
  List<MicroService> services;

  Environment({required this.name, required this.services});
}

class EnvironmentWidget extends StatefulWidget {
  final Environment environment;
  final bool areHealthy;

  const EnvironmentWidget(
      {super.key, required this.environment, required this.areHealthy});

  @override
  EnvironmentWidgetState createState() => EnvironmentWidgetState();
}

class EnvironmentWidgetState extends State<EnvironmentWidget>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _arrowAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // Utilisation de CurvedAnimation pour appliquer une courbe
    final Animation<double> curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    _arrowAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(curve);
    _sizeAnimation = curve;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggleExpand,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: SepteoColors.blue.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RotationTransition(
                          turns: _arrowAnimation,
                          child: const Icon(Icons.keyboard_arrow_down),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          widget.environment.name,
                          style: SepteoTextStyles.headingSmallInter
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 26.0,
                      height: 26.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            size: 26,
                            widget.areHealthy
                                ? Icons.check_circle
                                : Icons.cancel,
                            color:
                                widget.areHealthy ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _sizeAnimation,
            child: Column(
              children: widget.environment.services.map((service) {
                return StatusLineWidget(
                  title: service.title,
                  isHealthy: service.isHealthy,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
