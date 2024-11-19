import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ChartContainer extends StatelessWidget {
  final Widget child;
  final String buttonText;
  final Icon buttonIcon;
  final void Function() onButtonPressed;
  final String title;
  const ChartContainer({
    super.key,
    required this.child,
    required this.buttonText,
    this.buttonIcon = const Icon(Icons.file_download_outlined),
    required this.onButtonPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFDCE4FD),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
        padding: EdgeInsets.all(Spacings.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.bodyMediumSemibold.copyWith(
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
                  style: TextStyles.bodyMedium.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB9C7FB),
                foregroundColor: ListoMainColors.primary.base,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, 40),
                shadowColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
