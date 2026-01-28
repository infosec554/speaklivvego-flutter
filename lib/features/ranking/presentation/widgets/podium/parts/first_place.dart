import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class FirstPlace extends StatelessWidget {
  const FirstPlace({super.key});

  @override
  Widget build(BuildContext context) {
    final WIDTH = (MediaQuery.of(context).size.width - 120) / 3;
    return CustomPaint(
      size: Size(WIDTH, (WIDTH * 2.381818181818182).toDouble()),
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.5000000, size.height * 0.06106870),
      Offset(size.width * 0.5000000, size.height * 0.7213740),
      [Color(0xff2B85F5).withOpacity(1), Color(0xffCDC9F3).withOpacity(1)],
      [0, 1],
    );
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        size.height * 0.06106870,
        size.width,
        size.height * 0.9389313,
      ),
      paint_0_fill,
    );

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1454545, 0);
    path_1.lineTo(size.width * 0.8545455, 0);
    path_1.lineTo(size.width, size.height * 0.06106870);
    path_1.lineTo(0, size.height * 0.06106870);
    path_1.lineTo(size.width * 0.1454545, 0);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff509EFF).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.4651527, size.height * 0.4503817);
    path_2.lineTo(size.width * 0.6124255, size.height * 0.4503817);
    path_2.lineTo(size.width * 0.6124255, size.height * 0.1774809);
    path_2.lineTo(size.width * 0.4833345, size.height * 0.1774809);
    path_2.lineTo(size.width * 0.3333345, size.height * 0.2221374);
    path_2.lineTo(size.width * 0.3333345, size.height * 0.2748092);
    path_2.lineTo(size.width * 0.4651527, size.height * 0.2385496);
    path_2.lineTo(size.width * 0.4651527, size.height * 0.4503817);
    path_2.close();

    Paint paint_2_fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
