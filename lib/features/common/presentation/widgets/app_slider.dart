import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  const AppSlider({
    required this.values,
    required this.onChanged,
    super.key,
  });

  final RangeValues values;

  final ValueChanged<RangeValues> onChanged;

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF2196F3);
    const activeColorWithOpacity_1 = Color(0x1a2196f3);
    final inactiveColor = Colors.grey.shade300;

    return SizedBox(
      width: double.maxFinite,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 1,

          activeTrackColor: activeColor,
          inactiveTrackColor: inactiveColor,
          overlayColor: activeColorWithOpacity_1,
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          rangeThumbShape: const _BorderedRangeThumbShape(
            enabledThumbRadius: 13,
            borderColor: activeColor,
          ),
        ),
        child: RangeSlider(
          max: 100,
          values: values,
          labels: RangeLabels(
            (values.start * 100).round().toString(),
            (values.end * 100).round().toString(),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

/// Custom thumb shape: white circle with blue border.
class _BorderedRangeThumbShape extends RangeSliderThumbShape {
  const _BorderedRangeThumbShape({
    this.enabledThumbRadius = 10.0,
    this.borderColor = Colors.blue,
  });

  final double enabledThumbRadius;
  final Color borderColor;

  final Color fillColor = Colors.white;
  final double borderWidth = 3;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    final diameter = (enabledThumbRadius + 4) * 2;
    return Size(diameter, diameter);
  }

  // NOTE: Match the exact signature from the current Flutter SDK:
  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required SliderThemeData sliderTheme,
    bool isDiscrete = false,
    bool isEnabled = true,
    bool isOnTop = false,
    bool isPressed = false,
    TextDirection? textDirection,
    Thumb? thumb,
  }) {
    final canvas = context.canvas;

    // draw white fill
    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // draw border (stroke)
    final strokePaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..isAntiAlias = true;

    // If you want a pressed effect, scale slightly when pressed
    final pressScale = isPressed ? 0.95 : 1.0;
    final paintedCenter = center;
    final radius = enabledThumbRadius * pressScale;

    canvas
      ..drawCircle(paintedCenter, radius, fillPaint)
      ..drawCircle(paintedCenter, radius - (borderWidth / 2), strokePaint);
  }
}
