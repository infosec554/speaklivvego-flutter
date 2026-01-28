import 'package:flutter/material.dart';

class ThirdPlace extends StatelessWidget {
  const ThirdPlace({super.key});

  @override
  Widget build(BuildContext context) {
    final WIDTH = (MediaQuery.of(context).size.width - 120) / 3;
    return CustomPaint(
      size: Size(WIDTH, WIDTH * 1.7307692307692308),
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final decrease = .3;
    final differance = (decrease - .08888889) * size.height;
    double addDifferance(double v) => differance + v;
    debugPrint('>< >< what is the size : ${size.height} ${size.width}');

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff2B85F5);
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        size.height * decrease,
        size.width,
        size.height * 0.9111111,
      ),
      paint_0_fill,
    );

    Path path_1 = Path();
    path_1.moveTo(0, differance);
    path_1.lineTo(size.width * 0.8545452, differance);
    path_1.lineTo(size.width, size.height * decrease);
    path_1.lineTo(0, size.height * decrease);
    path_1.lineTo(0, 0);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff509EFF).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(
      size.width * 0.4926635,
      addDifferance(size.height * 0.4314444),
    );
    path_2.cubicTo(
      size.width * 0.5930481,
      addDifferance(size.height * 0.4314444),
      size.width * 0.6524712,
      addDifferance(size.height * 0.4031111),
      size.width * 0.6524712,
      addDifferance(size.height * 0.3584444),
    );
    path_2.cubicTo(
      size.width * 0.6524712,
      addDifferance(size.height * 0.3281111),
      size.width * 0.6201635,
      addDifferance(size.height * 0.3084444),
      size.width * 0.5722788,
      addDifferance(size.height * 0.3024444),
    );
    path_2.cubicTo(
      size.width * 0.6132404,
      addDifferance(size.height * 0.2941111),
      size.width * 0.6403558,
      addDifferance(size.height * 0.2774444),
      size.width * 0.6403558,
      addDifferance(size.height * 0.2507778),
    );
    path_2.cubicTo(
      size.width * 0.6403558,
      addDifferance(size.height * 0.2134444),
      size.width * 0.5872788,
      addDifferance(size.height * 0.1861111),
      size.width * 0.4967019,
      addDifferance(size.height * 0.1861111),
    );
    path_2.cubicTo(
      size.width * 0.4026635,
      addDifferance(size.height * 0.1861111),
      size.width * 0.3490096,
      addDifferance(size.height * 0.2181111),
      size.width * 0.3443942,
      addDifferance(size.height * 0.2617778),
    );
    path_2.lineTo(
      size.width * 0.4268942,
      addDifferance(size.height * 0.2617778),
    );
    path_2.cubicTo(
      size.width * 0.4315096,
      addDifferance(size.height * 0.2394444),
      size.width * 0.4557404,
      addDifferance(size.height * 0.2257778),
      size.width * 0.4949712,
      addDifferance(size.height * 0.2257778),
    );
    path_2.cubicTo(
      size.width * 0.5330481,
      addDifferance(size.height * 0.2257778),
      size.width * 0.5520865,
      addDifferance(size.height * 0.2384444),
      size.width * 0.5520865,
      addDifferance(size.height * 0.2554444),
    );
    path_2.cubicTo(
      size.width * 0.5520865,
      addDifferance(size.height * 0.2757778),
      size.width * 0.5324712,
      addDifferance(size.height * 0.2871111),
      size.width * 0.4892019,
      addDifferance(size.height * 0.2871111),
    );
    path_2.lineTo(
      size.width * 0.4592019,
      addDifferance(size.height * 0.2871111),
    );
    path_2.lineTo(
      size.width * 0.4592019,
      addDifferance(size.height * 0.3231111),
    );
    path_2.lineTo(
      size.width * 0.4915096,
      addDifferance(size.height * 0.3231111),
    );
    path_2.cubicTo(
      size.width * 0.5359327,
      addDifferance(size.height * 0.3231111),
      size.width * 0.5578558,
      addDifferance(size.height * 0.3347778),
      size.width * 0.5578558,
      addDifferance(size.height * 0.3574444),
    );
    path_2.cubicTo(
      size.width * 0.5578558,
      addDifferance(size.height * 0.3787778),
      size.width * 0.5359327,
      addDifferance(size.height * 0.3917778),
      size.width * 0.4892019,
      addDifferance(size.height * 0.3917778),
    );
    path_2.cubicTo(
      size.width * 0.4395865,
      addDifferance(size.height * 0.3917778),
      size.width * 0.4182404,
      addDifferance(size.height * 0.3751111),
      size.width * 0.4147788,
      addDifferance(size.height * 0.3521111),
    );
    path_2.lineTo(
      size.width * 0.3305481,
      addDifferance(size.height * 0.3521111),
    );
    path_2.cubicTo(
      size.width * 0.3340096,
      addDifferance(size.height * 0.4004444),
      size.width * 0.3876635,
      addDifferance(size.height * 0.4314444),
      size.width * 0.4926635,
      addDifferance(size.height * 0.4314444),
    );
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.white;
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
