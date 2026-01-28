import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension StringExtensions on String {
  Image toAssetImage({
    double? height,
    double? width,
  }) => Image.asset(
    this,
    height: height,
    width: width,
  );

  SvgPicture toSvgAsset({double? height, double? width, Color? color}) =>
      SvgPicture.asset(
        this,
        height: height,
        width: width,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(
                color,
                BlendMode.srcIn,
              ),
      );
}
