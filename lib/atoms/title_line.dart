import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class TitleLine extends StatelessWidget {
  final String title;
  final String label;
  final String selectedValue;
  final List<PeriodInput> values;
  final void Function(PeriodInput)? onValueSelected;
  final bool forcedMobile;

  const TitleLine({
    super.key,
    required this.title,
    required this.label,
    required this.selectedValue,
    this.forcedMobile = false,
    this.values = const [],
    this.onValueSelected,
  });

  Widget get _subTitle => values.isEmpty
      ? _TitleLineLabelMode(
          label: label,
          selectedValue: selectedValue,
        )
      : _TitleLineComboMode(
          label: label,
          selectedValue: selectedValue,
          values: values,
          onValueSelected: onValueSelected,
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
            child: _subTitle,
          );
  }
}

class PeriodInput {
  final String id;
  final String value;

  const PeriodInput({
    required this.id,
    required this.value,
  });
}

class _TitleLineComboMode extends StatefulWidget {
  final String label;
  final String selectedValue;
  final List<PeriodInput> values;
  final void Function(PeriodInput)? onValueSelected;
  const _TitleLineComboMode({
    required this.label,
    required this.selectedValue,
    required this.values,
    this.onValueSelected,
  });

  @override
  State<_TitleLineComboMode> createState() => _TitleLineComboModeState();
}

class _TitleLineComboModeState extends State<_TitleLineComboMode> {
  late PeriodInput selection;

  @override
  void initState() {
    super.initState();
    selection = widget.values.firstWhere(
      (element) => element.value == widget.selectedValue,
      orElse: () => widget.values.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: DropdownButton<PeriodInput>(
          value: selection,
          onChanged: (data) {
            if (data != null) {
              setState(() {
                selection = data;
              });
              if (widget.onValueSelected != null) {
                widget.onValueSelected?.call(data);
              }
            }
          },
          items: [
            for (var value in widget.values)
              DropdownMenuItem(
                value: value,
                child: Text(value.value),
              ),
          ],
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(4),
          underline: Container(),
          selectedItemBuilder: (context) => widget.values
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacings.sm,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.label,
                          style: TextStyles.bodySmall.copyWith(
                            color: ListoMainColors.neutral.shade500,
                          ),
                        ),
                        Text(
                          e.value,
                          style: TextStyles.bodyLargeSemibold.copyWith(
                            color: ListoMainColors.neutral.shade900,
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList()),
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
        Padding(
          padding: const EdgeInsets.only(
            top: Spacings.sm,
            bottom: Spacings.xs,
          ),
          child: Text(
            '$label :',
            overflow: TextOverflow.ellipsis,
            style: TextStyles.headingMediumSemibold.copyWith(
              color: ListoMainColors.neutral.shade400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: Spacings.sm,
            bottom: Spacings.xs,
            left: Spacings.xs,
          ),
          child: Text(
            selectedValue,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.headingMediumSemibold.copyWith(
              color: ListoMainColors.neutral.shade900,
            ),
          ),
        ),
      ],
    );
  }
}

class _DesktopContainer extends StatelessWidget {
  final String title;
  final Widget child;
  const _DesktopContainer({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Spacings.sm,
            bottom: Spacings.xs,
            right: Spacings.sm,
          ),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.headingLarge.copyWith(
              color: ListoMainColors.neutral.shade900,
            ),
          ),
        ),
        Container(
          width: 3,
          height: 32,
          decoration: BoxDecoration(
            color: ListoMainColors.neutral.shade400,
          ),
        ),
        const SizedBox(
          width: Spacings.sm,
        ),
        child
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
        top: Spacings.sm,
        bottom: Spacings.xs,
        right: Spacings.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Spacings.xs),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.headingMediumSemibold.copyWith(
                color: ListoMainColors.neutral.shade900,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
