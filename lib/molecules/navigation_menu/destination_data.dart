import 'package:flutter/material.dart';

class DestinationData {
  final IconData icon;
  final String label;
  final VoidCallback? action;
  final List<DestinationData>? children;

  DestinationData({
    required this.icon,
    required this.label,
    this.action,
    this.children,
  });
}
