import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class WaitCallSpinner extends StatefulWidget {
  const WaitCallSpinner({required this.waitingTime, super.key});

  final String waitingTime;

  @override
  State<WaitCallSpinner> createState() => _WaitCallSpinnerState();
}

class _WaitCallSpinnerState extends State<WaitCallSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double size = 170;

    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            size: const Size(size, size),
            painter: TaperedArcPainter(rotation: _controller.value * 2 * pi),
            child: SizedBox(
              width: size,
              height: size,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: CachedNetworkImageProvider(
                      'https://i.pravatar.cc/150?img=47',
                    ),
                  ),
                  Text(
                    widget.waitingTime,
                    style: context.cBlackColorTextStyle?.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Waiting time\n0-4 minutes',
                    style: context.c696969ColorTextStyle?.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TaperedArcPainter extends CustomPainter {
  final double rotation;

  TaperedArcPainter({required this.rotation});

  @override
  void paint(Canvas canvas, Size size) {
    const double startWidth = 10;
    const double endWidth = 0;
    const double sweepAngle = 5 * pi / 3;
    const int segments = 100;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - startWidth / 2;

    final startAngle = rotation;

    for (int i = 0; i < segments; i++) {
      final t = i / segments;
      final currentAngle = startAngle + t * sweepAngle;
      final nextAngle = startAngle + (t + 1 / segments) * sweepAngle;

      final width = startWidth + (endWidth - startWidth) * t;
      final paint = Paint()
        ..color = AppColors.c2A85F3primary
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = width;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        currentAngle,
        nextAngle - currentAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(TaperedArcPainter oldDelegate) =>
      oldDelegate.rotation != rotation;
}
