import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    this.title,
    this.child,
    this.height = 60,
    this.radius,
  });

  final VoidCallback? onPressed;
  final String? title;
  final Widget? child;
  final double height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? height / 4),
        ),
        fixedSize: Size(double.maxFinite, height),
      ),
      child: Builder(
        builder: (context) {
          if (child != null) {
            return child!;
          }
          return Text(
            title ?? '-',
          );
        },
      ),
    );
  }
}
