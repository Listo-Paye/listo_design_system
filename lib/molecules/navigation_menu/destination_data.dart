import 'package:flutter/material.dart';

class DestinationData {
  final IconData icon;
  final String label;
  final List<DestinationData>? children;
  // final bool expendable;

  DestinationData({required this.icon, required this.label, this.children});
}
