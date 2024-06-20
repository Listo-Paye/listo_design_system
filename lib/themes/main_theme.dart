import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/colors.dart';
import 'package:listo_design_system/themes/text_style.dart';

final mainTheme = ThemeData(
    primarySwatch: ListoMainColors.primary.materialColor,
    primaryColor: ListoMainColors.primary.base,
    useMaterial3: true,
    textTheme: TextTheme(
      bodyLarge: TextStyles.bodyLarge,
      bodyMedium: TextStyles.bodyMedium,
      bodySmall: TextStyles.bodySmall,
      headlineMedium: TextStyles.headingMedium,
      headlineSmall: TextStyles.headingSmall,
      headlineLarge: TextStyles.headingLarge,
      labelLarge: TextStyles.labelLarge,
      titleMedium: TextStyles.headingMedium,
      titleSmall: TextStyles.headingSmall,
      titleLarge: TextStyles.headingLarge,
      displayLarge: TextStyles.headingLarge,
      displaySmall: TextStyles.headingSmall,
      displayMedium: TextStyles.headingMedium,
    ));
