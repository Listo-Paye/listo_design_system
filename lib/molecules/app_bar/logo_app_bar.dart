import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double _defaultHeight = 56;
  final Widget title;
  final double? height;
  final double? elevation;
  final ImageProvider? logo;
  final List<Widget> actions;
  final List<Widget> endActions;

  const LogoAppBar({
    super.key,
    required this.title,
    this.height = _defaultHeight,
    this.elevation = 0,
    this.actions = const [],
    this.endActions = const [],
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      backgroundColor: Colors.white,
      elevation: elevation,
      surfaceTintColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: SepteoSpacings.xl),
          ..._prefix,
          title,
          Spacer(),
          ..._suffix,
          SizedBox(width: SepteoSpacings.md),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? _defaultHeight);

  List<Widget> get _prefix {
    var prefix = <Widget>[];
    if (logo != null) {
      prefix.add(Center(
        child: Padding(
          padding: const EdgeInsets.only(top: SepteoSpacings.xs),
          child: Image(
            image: logo!,
            fit: BoxFit.contain,
            height: 30,
          ),
        ),
      ));
    }

    prefix.add(SizedBox(
      width: SepteoSpacings.xl,
    ));

    for (var action in actions) {
      prefix.add(action);
      prefix.add(SizedBox(
        width: SepteoSpacings.xs,
      ));
    }
    return prefix;
  }

  List<Widget> get _suffix {
    var suffix = <Widget>[];
    for (var action in endActions) {
      suffix.add(SizedBox(
        width: SepteoSpacings.xl,
      ));
      suffix.add(action);
    }
    return suffix;
  }
}
