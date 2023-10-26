import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final double? width;
  final double height;
  final Color color;
  final Widget child;
  final double borderRadius;
  final Color? borderColor;
  final double borderWidth;

  const CustomFilledButton({
    Key? key,
    this.width,
    required this.height,
    required this.color,
    required this.child,
    this.borderRadius = 12,
    this.borderColor,
    this.borderWidth = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Material(
        color: color,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: borderColor ?? Colors.transparent, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          width: width,
          height: height,
          child: Center(child: child),
        ),
      ),
    );
  }
}
