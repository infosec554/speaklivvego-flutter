import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/core/routing/app_router_points.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/core/routing/codec/models/interests_extra_model.dart';
import 'package:speak_live_go/core/routing/codec/models/language_extra_model.dart';
import 'package:speak_live_go/features/initial_info/data/models/language/language_model.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';
import 'package:speak_live_go/features/profile/data/models/profile/profile_model.dart';
import 'package:speak_live_go/features/profile/domain/enums/edit_profile_enum.dart';
import 'package:speak_live_go/features/profile/presentation/providers/profile_view/profile_provider.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/pick_avatar.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);
    
    return profileState.when(
      data: (profile) => _buildContent(context, ref, profile),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, ProfileModel profile) {
    return Scaffold(
      appBar: const AppAppBar(
        title: 'Edit profile',
      ),
      body: Center(
        child: Column(
          children: [
            const HBox(32),
            const PickAvatarWidget(),
            const HBox(20),
            for (final v in EditProfileEnum.values)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  0,
                  20,
                  7,
                ),
                child: Row(
                  children: [
                    Builder(
                      builder: (context) {
                        if (v.isName) {
                          return Container(
                            height: 36,
                            width: 36,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.c2A85F3primary,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: v.getIcon.toSvgAsset(),
                          );
                        }
                        return v.getIcon.toSvgAsset();
                      },
                    ),
                    const WBox(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            v.getTitle,
                            style: context.cBlackColorTextStyle?.copyWith(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'The result',
                            style: context.c696969ColorTextStyle,
                          ),
                        ],
                      ),
                    ),
                    AppTap(
                      onTap: () async {
                        switch (v) {
                          case EditProfileEnum.name:
                            {
                              final result = await context.pushNamed<bool>(
                                AppRouterPoints.changeSingleValuePage.name,
                                pathParameters: {
                                  'initial': 'the_result',
                                  'title': 'Name',
                                },
                              );
                              break;
                            }
                          case EditProfileEnum.aboutMe:
                            {
                              final result = await context.pushNamed<bool>(
                                AppRouterPoints.changeSingleValuePage.name,
                                pathParameters: {
                                  'initial': 'HI!',
                                  'title': 'About me',
                                },
                              );
                              break;
                            }
                          case EditProfileEnum.nativeLanguage:
                            {
                              final result = await context.pushNamed<LanguageModel>(
                                AppRouterPoints.editNativeLanguagePage.name,
                                extra: LanguageExtraModel(language: profile.nativeLanguage),
                              );
                              if (result != null) {
                                // Handle result - update profile
                              }
                              break;
                            }
                          case EditProfileEnum.englishLevel:
                            {
                              final result = await context.pushNamed<LevelEnum>(
                                AppRouterPoints.editEnglishLevelPage.name,
                                pathParameters: {
                                  'level': profile.level.name,
                                },
                              );
                              if (result != null) {
                                // Handle result - update profile
                              }
                              break;
                            }
                          case EditProfileEnum.age:
                            {
                              final result = await context.pushNamed<String>(
                                AppRouterPoints.editAgePage.name,
                                pathParameters: {
                                  'age': profile.age.toString(),
                                },
                              );
                              if (result != null) {
                                // Handle result - update profile
                              }
                              break;
                            }
                          case EditProfileEnum.location:
                            {
                              final result = await context.pushNamed<String>(
                                AppRouterPoints.editLocationPage.name,
                                pathParameters: {
                                  'location': Uri.encodeComponent(profile.countryName),
                                },
                              );
                              if (result != null) {
                                // Handle result - update profile
                              }
                              break;
                            }
                          case EditProfileEnum.interests:
                            {
                              final result = await context.pushNamed<List<String>>(
                                AppRouterPoints.editInterestsPage.name,
                                extra: InterestsExtraModel(interests: profile.interests),
                              );
                              if (result != null) {
                                // Handle result - update profile
                              }
                              break;
                            }
                        }
                      },
                      child: AppIcons.chevronRight.toSvgAsset(),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
