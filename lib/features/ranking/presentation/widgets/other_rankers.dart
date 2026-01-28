import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/app_constants.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/lobby/data/models/user_light/user_light_model.dart';
import 'package:speak_live_go/features/ranking/presentation/widgets/ranker_widget.dart';

class OtherRankers extends StatelessWidget {
  const OtherRankers({
    required this.items,
    super.key,
  });

  final List<UserLightModel> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 485,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 32, // give REAL height!
              child: CustomPaint(
               painter: RPSCustomPainter(),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.cA7CEFF,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    0,
                    16,
                    AppConstants.avoidNavbarPadding  ,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return RankerWidget(
                      index: index + 4,
                      name: item.name,
                      minute: 491,
                    );
                  },
                  separatorBuilder: (_, _) => const HBox(16),
                  itemCount: items.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  late final h = 400;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(0, h * 0.1227035)
      ..cubicTo(
        0,
        h * 0.07480894,
        size.width * 0.03990780,
        h * 0.03598266,
        size.width * 0.08913649,
        h * 0.03598266,
      )
      ..lineTo(size.width * 0.2500000, h * 0.03598266)
      ..lineTo(size.width * 0.3750000, h * 0.03598266)
      ..lineTo(size.width * 0.3914986, h * 0.03598266)
      ..cubicTo(
        size.width * 0.4203565,
        h * 0.03598266,
        size.width * 0.4463705,
        h * 0.01977786,
        size.width * 0.4720613,
        h * 0.006989322,
      )
      ..cubicTo(
        size.width * 0.4803370,
        h * 0.002870190,
        size.width * 0.4897716,
        0,
        size.width * 0.5000000,
        0,
      )
      ..cubicTo(
        size.width * 0.5102284,
        0,
        size.width * 0.5196630,
        h * 0.002870190,
        size.width * 0.5279387,
        h * 0.006989322,
      )
      ..cubicTo(
        size.width * 0.5536295,
        h * 0.01977786,
        size.width * 0.5796435,
        h * 0.03598266,
        size.width * 0.6085014,
        h * 0.03598266,
      )
      ..lineTo(size.width * 0.6250000, h * 0.03598266)
      ..lineTo(size.width * 0.7500000, h * 0.03598266)
      ..lineTo(size.width * 0.9108635, h * 0.03598266)
      ..cubicTo(
        size.width * 0.9600919,
        h * 0.03598266,
        size.width,
        h * 0.07480894,
        size.width,
        h * 0.1227035,
      )
      ..lineTo(size.width, size.height * 2.013550)
      ..lineTo(0, size.height * 2.013550)
      ..lineTo(0, h * 0.1227035)
      ..close();

    final paint0Fill = Paint()..style = PaintingStyle.fill
    ..color = AppColors.cA7CEFF;
    canvas.drawPath(path_0, paint0Fill);

    final paint1Fill = Paint()..style = PaintingStyle.fill
    ..color = AppColors.c509EFF;
    canvas.drawCircle(
      Offset(size.width * 0.5013928, h * 0.03252033),
      size.width * 0.01114206,
      paint1Fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
