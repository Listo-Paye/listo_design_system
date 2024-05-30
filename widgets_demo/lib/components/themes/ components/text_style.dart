import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/text_style.dart';

class TextsBrowser extends StatelessWidget {
  const TextsBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Heading',
                style: TextStyles.headingLarge.copyWith(color: Colors.black)),
            Text('A utiliser pour l\'ensemble des titres de l\'application',
                style: TextStyles.bodyMedium.copyWith(color: Colors.black)),
            Text('Heading Large', style: TextStyles.headingLarge),
            Text('Heading Medium', style: TextStyles.headingMedium),
            Text('Heading Medium Semibold',
                style: TextStyles.headingMediumSemibold),
            Text('Heading Small', style: TextStyles.headingSmall),
            const Text(''),
            Text('Body',
                style: TextStyles.headingLarge.copyWith(color: Colors.black)),
            Text('A utiliser pour l\'ensemble des textes de l\'application',
                style: TextStyles.bodyMedium.copyWith(color: Colors.black)),
            Text('Body Large', style: TextStyles.bodyLarge),
            Text('Body Large SemiBold', style: TextStyles.bodyLargeSemibold),
            Text('Body Medium', style: TextStyles.bodyMedium),
            Text('Body Medium Semibold', style: TextStyles.bodyMediumSemibold),
            Text('Body Small', style: TextStyles.bodySmall),
            const Text(''),
            Text('Label',
                style: TextStyles.headingLarge.copyWith(color: Colors.black)),
            Text(
                'A utiliser pour l\'ensemble des labels de boutons de l\'application. La couleur est variable',
                style: TextStyles.bodyMedium.copyWith(color: Colors.black)),
            Text('Label Large', style: TextStyles.labelLarge),
            const Text(''),
            Text('Action',
                style: TextStyles.headingLarge.copyWith(color: Colors.black)),
            Text(
                'A utiliser pour l\'ensemble des labels des actions de l\'application. La couleur est variable',
                style: TextStyles.bodyMedium.copyWith(color: Colors.black)),
            Text('Link', style: TextStyles.link),
          ],
        ));
  }
}
