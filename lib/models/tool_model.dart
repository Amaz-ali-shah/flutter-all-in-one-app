import 'package:flutter/material.dart';

class ToolModel {
  final IconData icon;
  final String label;
  final Color color;
  final bool isImplemented;
  final VoidCallback? onTap;

  const ToolModel({
    required this.icon,
    required this.label,
    required this.color,
    this.isImplemented = true,
    this.onTap,
  });
}
