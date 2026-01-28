import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/routing/app_router_points.dart';
import 'package:speak_live_go/features/auth/presentation/providers/auth/auth_provider.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_secondary_button.dart';
import 'package:speak_live_go/features/profile/domain/enums/settings_enum.dart';
import 'package:speak_live_go/features/profile/presentation/providers/profile_view/profile_provider.dart';
import 'package:speak_live_go/features/settings/presentation/widgets/app_info_widget.dart';
import 'package:speak_live_go/features/settings/presentation/widgets/contact_us_widget.dart';
import 'package:speak_live_go/features/settings/presentation/widgets/setting_action_tile.dart';
import 'package:speak_live_go/features/settings/presentation/widgets/sheets/are_you_sure_dialog.dart';
import 'package:speak_live_go/utils/extensions/build_context/show_modal_bottom_sheet_extension.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProvider);

    return Scaffold(
      appBar: const AppAppBar(
        title: 'Settings',
      ),
      body: profileState.when(
        data: (profile) => Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 12, 24),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    spacing: 24,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final v in SettingsEnum.values)
                        SettingActionTile(
                          onTap: () async {
                            switch (v) {
                              case SettingsEnum.changeEmail:
                                {
                                  await context.pushNamed(
                                    AppRouterPoints.changeEmailPage.name,
                                  );
                                  break;
                                }
                              case SettingsEnum.changePassword:
                                {
                                  await context.pushNamed(
                                    AppRouterPoints.changePasswordPage.name,
                                  );
                                  break;
                                }
                              case SettingsEnum.notifications:
                                // Toggle is handled in the UI
                                break;
                              case SettingsEnum.rateApp:
                                // Handle rating
                                break;
                              case SettingsEnum.clubRules:
                                // Navigate to club rules page
                                break;
                              case SettingsEnum.deleteAccount:
                                {
                                  final result = await context.showModalSheet<bool>(
                                    content: const AreYouSureDialog(
                                      question:
                                          'Are you sure you want to delete you account',
                                      warning:
                                          'Deleting is permanent and your data will be lost',
                                      submitButtonTitle: 'Delete',
                                    ),
                                  );
                                  break;
                                }
                              case SettingsEnum.faq:
                                {
                                  await context.pushNamed(
                                    AppRouterPoints.faqPage.name,
                                  );
                                  break;
                                }
                            }
                          },
                          v: v,
                          toggle: v.hasToggle
                              ? Switch(
                                  value: notificationsEnabled,
                                  onChanged: (value) {
                                    setState(() {
                                      notificationsEnabled = value;
                                    });
                                  },
                                  activeColor: AppColors.c2A85F3primary,
                                )
                              : null,
                        ),
                      const HBox(1),

                      // Log out button
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: AppSecondaryButton(
                  onPressed: () async {
                    {
                      final result = await context.showModalSheet<bool>(
                        content: const AreYouSureDialog(
                          question: 'Are you sure you want to logout',
                          submitButtonTitle: 'Yes',
                          warning: '',
                        ),
                      );
                      if (result ?? false) {
                        await ref.read(authProvider.notifier).logOut();
                      }
                    }
                  },
                  title: 'Log out',
                ),
              ),
              const HBox(16),

              const ContactUsWidget(),
              const HBox(8),
              const AppInfoWidget(),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
