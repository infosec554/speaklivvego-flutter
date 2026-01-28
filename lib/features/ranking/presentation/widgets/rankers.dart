import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/lobby/data/models/user_light/user_light_model.dart';
import 'package:speak_live_go/features/ranking/presentation/widgets/crown.dart';
import 'package:speak_live_go/features/ranking/presentation/widgets/other_rankers.dart';
import 'package:speak_live_go/features/ranking/presentation/widgets/podium/podium.dart';
import 'package:speak_live_go/features/ranking/presentation/widgets/ranker_on_podium.dart';

class Rankers extends StatelessWidget {
  const Rankers({
    required this.items,
    super.key,
  });

  final List<UserLightModel> items;

  @override
  Widget build(BuildContext context) {
    const crown = 25.0;
    return SizedBox(
      height: 772 + crown,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 150 + crown,
            right: 0,
            left: 0,
            child: Podium(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: OtherRankers(items: items),
          ),

          ///second place
          const Positioned(
            top: 30 + crown,
            left: 64,
            child: RankerOnPodium(
              bgColor: AppColors.cFFD6DD,
              rank: '1,469 QP',
            ),
          ),
          const Positioned(
            top: crown,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RankerOnPodium(
                    bgColor: AppColors.cC9F2E9,
                    rank: '1,469 QP',
                  ),
                ],
              ),
            ),
          ),

          /// third place
          const Positioned(
            top: 64 + crown,
            right: 64,
            child: RankerOnPodium(
              bgColor: AppColors.cC4D0FB,
              rank: '1,469 QP',
            ),
          ),

          /// crown
          const Positioned(
            top: 0,
            child: Center(
              child: Crown(
                result: '06d 23h 00m',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
