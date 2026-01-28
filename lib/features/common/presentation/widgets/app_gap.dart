import 'package:flutter/material.dart';

class WBox extends StatelessWidget {
  const WBox(
      this.width, {
        super.key,
      });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class HBox extends StatelessWidget {
  const HBox(
      this.height, {
        super.key,
      });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
