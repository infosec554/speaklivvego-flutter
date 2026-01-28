import 'package:flutter/material.dart';
import 'package:speak_live_go/features/ranking/presentation/widgets/podium/parts/first_place.dart';
import 'package:speak_live_go/features/ranking/presentation/widgets/podium/parts/second_place.dart';
import 'package:speak_live_go/features/ranking/presentation/widgets/podium/parts/third_place.dart';

class Podium extends StatelessWidget {
  const Podium({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 220,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SecondPlace(),
          FirstPlace(),
          ThirdPlace(),
        ],
      ),
    );
  }
}
