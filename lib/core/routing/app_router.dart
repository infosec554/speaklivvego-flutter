import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/routing/app_roter_features.dart';
import 'package:speak_live_go/core/routing/app_router_points.dart';
import 'package:speak_live_go/core/routing/codec/app_go_router_codec.dart';
import 'package:speak_live_go/core/routing/codec/models/interests_extra_model.dart';
import 'package:speak_live_go/core/routing/codec/models/language_extra_model.dart';
import 'package:speak_live_go/features/auth/presentation/login_view.dart';
import 'package:speak_live_go/features/auth/presentation/pages/app_splash_page.dart';
import 'package:speak_live_go/features/chat/presentation/chat_page.dart';
import 'package:speak_live_go/features/chats/data/models/chat/chat_model.dart';
import 'package:speak_live_go/features/chats/presentation/chats_view.dart';
import 'package:speak_live_go/features/contacts/presentation/contacts_view.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';
import 'package:speak_live_go/features/initial_info/presentation/initial_info_view.dart';
import 'package:speak_live_go/features/lobby/presentation/lobby_view.dart';
import 'package:speak_live_go/features/navigation/app_navigation.dart';
import 'package:speak_live_go/features/profile/presentation/pages/change_single_value_page.dart';
import 'package:speak_live_go/features/profile/presentation/pages/edit_age_page.dart';
import 'package:speak_live_go/features/profile/presentation/pages/edit_english_level_page.dart';
import 'package:speak_live_go/features/profile/presentation/pages/edit_interests_page.dart';
import 'package:speak_live_go/features/profile/presentation/pages/edit_location_page.dart';
import 'package:speak_live_go/features/profile/presentation/pages/edit_native_language_page.dart';
import 'package:speak_live_go/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:speak_live_go/features/profile/presentation/profile_view.dart';
import 'package:speak_live_go/features/ranking/presentation/ranking_view.dart';
import 'package:speak_live_go/features/settings/presentation/pages/change_email_page.dart';
import 'package:speak_live_go/features/settings/presentation/pages/change_password_page.dart';
import 'package:speak_live_go/features/settings/presentation/pages/faq_page.dart';
import 'package:speak_live_go/features/settings/presentation/pages/settings_page.dart';
import 'package:speak_live_go/features/call/presentation/after_call_view.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final router = AppRouterFeature(ref);

  return GoRouter(
    routes: routes(ref),
    navigatorKey: rootNavigationKey,
    initialLocation: AppRouterPoints.loading.path,
    redirect: router.redirectLogic,
    debugLogDiagnostics: true,
    extraCodec: const AppExtraCodec(),
    errorBuilder: (context, state) {
      return Scaffold(body: Center(child: Text(state.error.toString())));
    },
  );
});

List<RouteBase> routes(Ref ref) =>
    [
      GoRoute(
        name: AppRouterPoints.loading.name,
        path: AppRouterPoints.loading.path,
        builder: (context, state) {
          return const AppSplashPage();
        },
      ),
      GoRoute(
        name: AppRouterPoints.login.name,
        path: AppRouterPoints.login.path,
        builder: (context, state) {
          return const LoginView();
        },
      ),
      GoRoute(
        name: AppRouterPoints.initialInfo.name,
        path: AppRouterPoints.initialInfo.path,
        builder: (context, state) {
          return const InitialInfoView();
        },
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigationKey,

        builder: (context, rootState, navigationShell) {
          return AppNavigation(navigationShell: navigationShell);
        },
        branches: [

          /// lobby
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouterPoints.lobby.name,
                path: AppRouterPoints.lobby.path,
                builder: (context, state) {
                  return const LobbyView();
                },
                routes: [

                  /// after call (standalone route)
                  GoRoute(
                    name: AppRouterPoints.afterCallPage.name,
                    path: AppRouterPoints.afterCallPage.path,
                    parentNavigatorKey: rootNavigationKey,
                    builder: (context, state) {
                      return const AfterCallView();
                    },
                  ),
                ],
              ),
            ],
          ),

          /// chats
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouterPoints.chats.name,
                path: AppRouterPoints.chats.path,
                builder: (context, state) {
                  return const ChatsView();
                },
                routes: [
                  GoRoute(
                    name: AppRouterPoints.chatPage.name,
                    path: AppRouterPoints.chatPage.path,

                    parentNavigatorKey: rootNavigationKey,
                    builder: (context, state) {
                      return ChatPage(state.extra! as ChatModel);
                    },
                  ),
                ],
              ),
            ],
          ),


          /// ranking
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouterPoints.ranking.name,
                path: AppRouterPoints.ranking.path,
                builder: (context, state) {
                  return const RankingView();
                },
              ),
            ],
          ),

          /// contacts
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouterPoints.contacts.name,
                path: AppRouterPoints.contacts.path,
                builder: (context, state) {
                  return const ContactsView();
                },
              ),
            ],
          ),

          /// profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouterPoints.profile.name,
                path: AppRouterPoints.profile.path,
                builder: (context, state) {
                  return const ProfileView();
                },
                routes: [
                  GoRoute(
                    path: AppRouterPoints.editProfilePage.path,
                    name: AppRouterPoints.editProfilePage.name,
                    parentNavigatorKey: rootNavigationKey,
                    builder: (context, state) {
                      return const EditProfilePage();
                    },
                    routes: [
                      GoRoute(
                        path: AppRouterPoints.changeSingleValuePage.path,
                        name: AppRouterPoints.changeSingleValuePage.name,
                        parentNavigatorKey: rootNavigationKey,
                        builder: (context, state) {
                          final initial = state.pathParameters['initial'];
                          final title = state.pathParameters['title'];
                          if (initial == null || title == null) {
                            return const RouteErrorPage(
                              message: ' currentName is not implemented',
                            );
                          }
                          return ChangeSingleValuePage(
                            initial: initial,
                            title: title,
                          );
                        },
                      ),
                      GoRoute(
                        path: AppRouterPoints.editNativeLanguagePage.path,
                        name: AppRouterPoints.editNativeLanguagePage.name,
                        parentNavigatorKey: rootNavigationKey,
                        builder: (context, state) {
                          final extra = state.extra as LanguageExtraModel?;
                          return EditNativeLanguagePage(
                            initialLanguage: extra?.language,
                          );
                        },
                      ),
                      GoRoute(
                        path: AppRouterPoints.editEnglishLevelPage.path,
                        name: AppRouterPoints.editEnglishLevelPage.name,
                        parentNavigatorKey: rootNavigationKey,
                        builder: (context, state) {
                          final levelParam = state.pathParameters['level'] ??
                              '';
                          LevelEnum? initialLevel;
                          if (levelParam.isNotEmpty) {
                            try {
                              initialLevel = LevelEnum.values.firstWhere(
                                    (e) => e.name == levelParam,
                              );
                            } catch (e) {
                              initialLevel = null;
                            }
                          }
                          return EditEnglishLevelPage(
                            initialLevel: initialLevel,
                          );
                        },
                      ),
                      GoRoute(
                        path: AppRouterPoints.editAgePage.path,
                        name: AppRouterPoints.editAgePage.name,
                        parentNavigatorKey: rootNavigationKey,
                        builder: (context, state) {
                          final ageParam = state.pathParameters['age'] ?? '';
                          return EditAgePage(
                            initialAge: ageParam.isNotEmpty ? ageParam : null,
                          );
                        },
                      ),
                      GoRoute(
                        path: AppRouterPoints.editLocationPage.path,
                        name: AppRouterPoints.editLocationPage.name,
                        parentNavigatorKey: rootNavigationKey,
                        builder: (context, state) {
                          final locationParam =
                              state.pathParameters['location'] ?? '';
                          final decodedLocation = locationParam.isNotEmpty
                              ? Uri.decodeComponent(locationParam)
                              : null;
                          return EditLocationPage(
                            initialLocation: decodedLocation,
                          );
                        },
                      ),
                      GoRoute(
                        path: AppRouterPoints.editInterestsPage.path,
                        name: AppRouterPoints.editInterestsPage.name,
                        parentNavigatorKey: rootNavigationKey,
                        builder: (context, state) {
                          final extra = state.extra as InterestsExtraModel?;
                          return EditInterestsPage(
                            initialInterests: extra?.interests,
                          );
                        },
                      ),
                      GoRoute(
                        path: AppRouterPoints.settingsPage.path,
                        name: AppRouterPoints.settingsPage.name,
                        parentNavigatorKey: rootNavigationKey,
                        builder: (context, state) {
                          return const SettingsPage();
                        },
                      ),
                      GoRoute(
                        path: AppRouterPoints.changeEmailPage.path,
                        name: AppRouterPoints.changeEmailPage.name,
                        parentNavigatorKey: rootNavigationKey,
                        builder: (context, state) {
                          return const ChangeEmailPage();
                        },
                      ),
                      GoRoute(
                        path: AppRouterPoints.changePasswordPage.path,
                        name: AppRouterPoints.changePasswordPage.name,
                        parentNavigatorKey: rootNavigationKey,
                        builder: (context, state) {
                          return const ChangePasswordPage();
                        },
                      ),
                      GoRoute(
                        path: AppRouterPoints.faqPage.path,
                        name: AppRouterPoints.faqPage.name,
                        parentNavigatorKey: rootNavigationKey,
                        builder: (context, state) {
                          return const FAQPage();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ];

class RouteErrorPage extends StatelessWidget {
  const RouteErrorPage({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(message)));
  }
}
