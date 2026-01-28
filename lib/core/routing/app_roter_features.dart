import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/routing/app_router_points.dart';
import 'package:speak_live_go/features/auth/presentation/providers/auth/auth_provider.dart';

class AppRouterFeature {
  AppRouterFeature(this.ref);

  final Ref ref;

  String? redirectLogic(BuildContext context, GoRouterState state) {
    final authState = ref.watch(authProvider);

    final areWeLoading = state.uri.path == AppRouterPoints.loading.path;
    String? redirectPath;

    if (areWeLoading) {
      switch (authState) {
        case AuthState.unAuthenticated:
          {
            redirectPath = AppRouterPoints.login.path;
            // redirectPath = AppRouterPoints.lobby.path;
            // redirectPath = AppRouterPoints.chats.path;
            // redirectPath = AppRouterPoints.ranking.path;
            // redirectPath = AppRouterPoints.contacts.path;
            // redirectPath = AppRouterPoints.profile.path;
            break;
          }

        case AuthState.authenticated:
          {
            redirectPath = kDebugMode
                ? AppRouterPoints.lobby.path
                : AppRouterPoints.lobby.path;
            break;
          }
        case AuthState.initial:
      }
    }

    return redirectPath;
  }
}
