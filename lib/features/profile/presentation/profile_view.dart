import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_constants.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/core/routing/app_router_points.dart';
import 'package:speak_live_go/core/services/prefs/pref_keys.dart';
import 'package:speak_live_go/core/services/prefs/prefs.dart';
import 'package:speak_live_go/features/auth/presentation/providers/auth/auth_provider.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar_with_badge.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_error_widget.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';
import 'package:speak_live_go/features/profile/presentation/providers/profile_view/profile_provider.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/complements_box.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/edit_profile_button.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/feed_back_talks_hours.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/feedback_box.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/info_box.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/interests_box.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/rating_box.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    return Scaffold(
      appBar: AppAppBar(
        title: '',
        actions: [
          AppTap(
            onTap: () {
              context.pushNamed(AppRouterPoints.settingsPage.name);
            },
            child: AppIcons.settings.toSvgAsset(),
          ),
        ],
      ),
      body: state.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(profileProvider);
              return;
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                20,
                0,
                20,
                AppConstants.avoidNavbarPadding,
              ),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  AppCircleAvatarWithBadge(
                    size: 100,
                    badge: data.level.getShortTitle,
                  ),
                  const HBox(14),
                  Text(
                    data.name,
                    style: context.cBlackColorTextStyle?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const HBox(12),
                  EditProfileButton(
                    onTap: () {
                      context.goNamed(AppRouterPoints.editProfilePage.name);
                    },
                  ),
                  const HBox(10),
                  const FeedBackTalksHours(),
                  const HBox(24),
                  InfoBox(
                    profile: data,
                  ),
                  const HBox(20),
                  InterestsBox(
                    interests: data.interests,
                    onAdd: () {},
                  ),
                  const HBox(20),
                  const RatingBox(),
                  const HBox(20),
                  const FeedbackBox(),
                  const HBox(20),
                  const ComplementsBox(),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) => AppErrorWidget(error),
        loading: () => const AppLoading(),
      ),
    );
  }
}
