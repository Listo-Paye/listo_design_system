import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

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
      color: SepteoColors.red,
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
      color: SepteoColors.green,
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
      color: SepteoColors.orange,
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
      color: SepteoColors.blue,
      width: width,
      height: height,
    );
  }
}

class Alert extends StatelessWidget {
  final String text;
  final MaterialColor color;
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
        color: color.shade50,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: color.shade300,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SepteoSpacings.md,
          vertical: SepteoSpacings.xs,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: color.shade800,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
