import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/colors.dart';

abstract final class TextStyles {
  static final TextStyle bodySmall = TextStyle(
    fontSize: 12,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: ListoMainColors.neutral[700],
  );
  static final TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: ListoMainColors.neutral[700],
  );
  static final TextStyle bodyMediumSemibold = TextStyle(
    fontSize: 14,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: ListoMainColors.neutral[700],
  );
  static final TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: ListoMainColors.neutral[700],
  );
  static final TextStyle bodyLargeSemibold = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: ListoMainColors.neutral[700],
  );
  static final TextStyle headingSmall = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: ListoMainColors.neutral[900],
  );
  static final TextStyle headingMediumSemibold = TextStyle(
    fontSize: 18,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: ListoMainColors.neutral[900],
  );
  static final TextStyle headingMedium = TextStyle(
    fontSize: 18,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: ListoMainColors.neutral[900],
  );
  static final TextStyle headingLarge = TextStyle(
    fontSize: 24,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w800,
    color: ListoMainColors.neutral[900],
  );
  static final TextStyle labelLarge = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: ListoMainColors.neutral[700],
  );
  static final TextStyle link = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: ListoMainColors.primary.dark,
  );
}