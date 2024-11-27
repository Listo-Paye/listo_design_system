import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class TitleLine extends StatelessWidget {
  final String title;
  final String label;
  final String selectedValue;
  final bool forcedMobile;
  final List<Widget> actions;

  const TitleLine({
    super.key,
    required this.title,
    this.label = "",
    this.selectedValue = "",
    this.forcedMobile = false,
    this.actions = const [],
  });

  Widget get _subTitle => _TitleLineLabelMode(
        label: label,
        selectedValue: selectedValue,
      );

  @override
  Widget build(BuildContext context) {
    var isMobile = forcedMobile || context.mediaSize.width <= 650;

    return isMobile
        ? _MobileContainer(
            title: title,
            child: _subTitle,
          )
        : _DesktopContainer(
            title: title,
            actions: actions,
            separator: label.isNotEmpty || selectedValue.isNotEmpty,
            child: _subTitle,
          );
  }
}

class _TitleLineLabelMode extends StatelessWidget {
  final String label;
  final String selectedValue;

  const _TitleLineLabelMode({
    required this.label,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        label.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  top: SepteoSpacings.md,
                  bottom: SepteoSpacings.xs,
                ),
                child: Text(
                  '$label :',
                  overflow: TextOverflow.ellipsis,
                  style: SepteoTextStyles.bodyLargeInterBold.copyWith(
                    color: SepteoColors.grey.shade400,
                  ),
                ),
              )
            : SizedBox(),
        selectedValue.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  top: SepteoSpacings.md,
                  bottom: SepteoSpacings.xs,
                  left: SepteoSpacings.xs,
                ),
                child: Text(
                  selectedValue,
                  overflow: TextOverflow.ellipsis,
                  style: SepteoTextStyles.bodyLargeInterBold.copyWith(
                    color: SepteoColors.grey.shade900,
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class _DesktopContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final bool separator;
  final List<Widget> actions;

  const _DesktopContainer({
    required this.title,
    required this.child,
    required this.actions,
    this.separator = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: SepteoSpacings.md,
            bottom: SepteoSpacings.xs,
            right: SepteoSpacings.md,
          ),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: SepteoTextStyles.headingMediumInterBold,
          ),
        ),
        separator
            ? Container(
                width: 3,
                height: 32,
                decoration: BoxDecoration(
                  color: SepteoColors.grey.shade400,
                ),
              )
            : SizedBox(),
        const SizedBox(
          width: SepteoSpacings.md,
        ),
        child,
        const Spacer(),
        Row(
          children: actions,
        ),
      ],
    );
  }
}

class _MobileContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const _MobileContainer({
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: SepteoSpacings.md,
        bottom: SepteoSpacings.xs,
        right: SepteoSpacings.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: SepteoSpacings.xs),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: SepteoTextStyles.bodyLargeInterBold,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
