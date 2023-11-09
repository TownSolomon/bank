import 'dart:ui';

class Option {
  String label;
  String? key;
  String? subtitle;
  String? svg;
  Color? color;
  Function()? onTap;
  Function()? onLongPress;
  Function()? onEdit;

  Option({
    required this.label,
    this.key,
    this.subtitle,
    this.svg,
    this.color,
    this.onTap,
    this.onEdit,
    this.onLongPress,
  });
}