import 'package:flutter/material.dart';

class SecondPlace extends StatelessWidget {
  const SecondPlace({super.key});

  @override
  Widget build(BuildContext context) {
    final WIDTH = (MediaQuery.of(context).size.width - 120) / 3;
    return CustomPaint(
      size: Size(WIDTH, (WIDTH * 1.7307692307692308).toDouble()),
       painter: RPSCustomPainter(),
    );
  }
}


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff2B85F5).withOpacity(1.0);
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        size.height * 0.08888889,
        size.width,
        size.height * 0.9111111,
      ),
      paint_0_fill,
    );

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1363635, 0);
    path_1.lineTo(size.width, 0);
    path_1.lineTo(size.width, size.height * 0.08888889);
    path_1.lineTo(0, size.height * 0.08888889);
    path_1.lineTo(size.width * 0.1363635, 0);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff509EFF).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.2812413, size.height * 0.5444444);
    path_2.lineTo(size.width * 0.6966260, size.height * 0.5444444);
    path_2.lineTo(size.width * 0.6966260, size.height * 0.4897778);
    path_2.lineTo(size.width * 0.4827798, size.height * 0.4897778);
    path_2.lineTo(size.width * 0.5866260, size.height * 0.4311111);
    path_2.cubicTo(
      size.width * 0.6504721,
      size.height * 0.3955556,
      size.width * 0.6927798,
      size.height * 0.3608889,
      size.width * 0.6927798,
      size.height * 0.3186667,
    );
    path_2.cubicTo(
      size.width * 0.6927798,
      size.height * 0.2613333,
      size.width * 0.6235490,
      size.height * 0.2222222,
      size.width * 0.5020106,
      size.height * 0.2222222,
    );
    path_2.cubicTo(
      size.width * 0.3789337,
      size.height * 0.2222222,
      size.width * 0.3020106,
      size.height * 0.2622222,
      size.width * 0.2958567,
      size.height * 0.3355556,
    );
    path_2.lineTo(size.width * 0.4089337, size.height * 0.3355556);
    path_2.cubicTo(
      size.width * 0.4173952,
      size.height * 0.2937778,
      size.width * 0.4481644,
      size.height * 0.2773333,
      size.width * 0.4966260,
      size.height * 0.2773333,
    );
    path_2.cubicTo(
      size.width * 0.5443183,
      size.height * 0.2773333,
      size.width * 0.5697029,
      size.height * 0.2942222,
      size.width * 0.5697029,
      size.height * 0.3204444,
    );
    path_2.cubicTo(
      size.width * 0.5697029,
      size.height * 0.3493333,
      size.width * 0.5358567,
      size.height * 0.3773333,
      size.width * 0.4827798,
      size.height * 0.4097778,
    );
    path_2.lineTo(size.width * 0.2812413, size.height * 0.5328889);
    path_2.lineTo(size.width * 0.2812413, size.height * 0.5444444);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
