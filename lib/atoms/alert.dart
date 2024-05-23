import 'package:flutter/material.dart';
import 'package:listo_design_system/themes/colors.dart';
import 'package:listo_design_system/themes/spacing.dart';

class ErrorAlert extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  const ErrorAlert({
    super.key,
    required this.text,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Alert(
      text: text,
      color: ListoMainColors.error,
      width: width,
      height: height,
    );
  }
}

class SuccessAlert extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  const SuccessAlert({
    super.key,
    required this.text,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Alert(
      text: text,
      color: ListoMainColors.success,
      width: width,
      height: height,
    );
  }
}

class WarningAlert extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  const WarningAlert({
    super.key,
    required this.text,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Alert(
      text: text,
      color: ListoMainColors.warning,
      width: width,
      height: height,
    );
  }
}

class InfoAlert extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  const InfoAlert({
    super.key,
    required this.text,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Alert(
      text: text,
      color: ListoMainColors.info,
      width: width,
      height: height,
    );
  }
}

class Alert extends StatelessWidget {
  final String text;
  final ListoColor color;
  final double? width;
  final double? height;
  const Alert({
    super.key,
    required this.text,
    required this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color.ultraLight,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: color.medium,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacings.sm,
          vertical: Spacings.xs,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: color.darker,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
