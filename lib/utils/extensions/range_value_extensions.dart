import 'package:flutter/material.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';

extension RangeValuesExtensions on RangeValues {
  /// the range value in range 0 - 100
  List<LevelEnum> get getLevels {
    final result = <LevelEnum>[];
    final s = _doubleToLevel(start);
    final e = _doubleToLevel(end);
    result.add(s);
    for (final v in LevelEnum.values) {
      if (v.index > s.index && v.index <= e.index) {
        result.add(v);
      }
    }
    return result;
  }

  LevelEnum _doubleToLevel(double v) {
    if (v < 11) {
      return LevelEnum.a1;
    }
    if (v > 10 && v < 31) {
      return LevelEnum.a2;
    }
    if (v > 30 && v < 51) {
      return LevelEnum.b1;
    }
    if (v > 50 && v < 71) {
      return LevelEnum.b2;
    }
    if (v > 70 && v < 91) {
      return LevelEnum.c1;
    }
    if (v > 90) {
      return LevelEnum.c2;
    }
    return LevelEnum.a1;
  }


}
