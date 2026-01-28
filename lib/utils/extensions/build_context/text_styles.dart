import 'package:flutter/cupertino.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';

extension TextStyleExtension on BuildContext {
  TextStyle? get _defaultStyle =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  TextStyle? get c2A85F3primaryColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.c2A85F3primary);

  TextStyle? get cBlackColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.black);

  TextStyle? get cACADB9TextStyle => _defaultStyle?.copyWith(
    color: AppColors.cACADB9,
  );

  TextStyle? get c696969ColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.c696969);

  TextStyle? get c535353ColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.c535353);

  TextStyle? get cWhiteColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.white);

  TextStyle? get c555555ColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.c555555);

  TextStyle? get cF5F6FAColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.cF5F6FA);

  TextStyle? get c323142ColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.c323142);

  TextStyle? get c918FB7ColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.c918FB7);

  TextStyle? get c858494ColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.c858494);

  TextStyle? get c0C092AColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.c0C092A);

  TextStyle? get cE6E6E6ColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.cE6E6E6);

  TextStyle? get c19C38DColorTextStyle =>
      _defaultStyle?.copyWith(color: AppColors.c19C38D);
}
