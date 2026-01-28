extension TimeFormat on int {
  String get toHHMMSS {
    final hours = this ~/ 3600;
    final minutes = (this % 3600) ~/ 60;
    final seconds = this % 60;

    final hoursStr = hours.zerolize;
    final minutesStr = minutes.zerolize;
    final secondsStr = seconds.zerolize;

    return '${hoursStr == '00' ? '' : '$hoursStr:'}$minutesStr:$secondsStr';
  }

  String get zerolize => toString().padLeft(2, '0');
}
