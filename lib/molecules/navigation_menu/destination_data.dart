import 'package:flutter/material.dart';

@Deprecated('Ce composant sera bientôt supprimé pour une refonte complète.')
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
