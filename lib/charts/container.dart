import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ChartContainer extends StatelessWidget {
  final Widget child;
  final String buttonText;
  final Icon? buttonIcon;
  final void Function() onButtonPressed;
  final String title;
  final String secondaryButtonText;
  final void Function()? onSecondaryButtonPressed;
  final Icon? secondaryButtonIcon;
  const ChartContainer({
    super.key,
    required this.child,
    required this.buttonText,
    this.buttonIcon,
    required this.onButtonPressed,
    required this.title,
    this.secondaryButtonText = "",
    this.onSecondaryButtonPressed,
    this.secondaryButtonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFDCE4FD),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(SepteoSpacings.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: SepteoTextStyles.bodySmallInterBold.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            child,
            ElevatedButton.icon(
              onPressed: onButtonPressed,
              icon: buttonIcon,
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  buttonText,
                  style: SepteoTextStyles.bodySmallInter.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB9C7FB),
                foregroundColor: SepteoColors.blue.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, 40),
                shadowColor: Colors.transparent,
              ),
            ),
            secondaryButtonText.isNotEmpty
                ? SizedBox(
                    height: SepteoSpacings.xs,
                  )
                : SizedBox(),
            secondaryButtonText.isNotEmpty
                ? OutlinedButton.icon(
                    onPressed: onSecondaryButtonPressed,
                    icon: secondaryButtonIcon,
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        secondaryButtonText,
                        style: SepteoTextStyles.bodySmallInter.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: SepteoColors.blue.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(double.infinity, 40),
                      shadowColor: Colors.transparent,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
