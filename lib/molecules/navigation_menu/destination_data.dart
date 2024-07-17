import 'package:flutter/material.dart';

class DestinationData {
  final IconData? icon;
  final String label;
  final List<DestinationData>? children;

  DestinationData({
    required this.label,
    this.icon,
    this.children,
  });
}
