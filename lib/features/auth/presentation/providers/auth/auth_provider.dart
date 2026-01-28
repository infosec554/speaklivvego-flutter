import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/core/services/prefs/pref_keys.dart';
import 'package:speak_live_go/core/services/prefs/prefs.dart';

part 'auth_state.dart';

Future<AuthState> checkInitAuthStateOut() async {
  final refreshToken = Prefs().read(PrefKeys.refreshToken);

  if (refreshToken == null || refreshToken.isEmpty) {
    return AuthState.unAuthenticated;
  } else {
    return AuthState.authenticated;
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.ref, AuthState initAuthState) : super(initAuthState);

  final Ref ref;

  void changeState(AuthState newState) => state = newState;

  Future<void> checkAuth() async {
    changeState(await checkInitAuthStateOut());
  }

  Future<void> logOut() async {
    await Prefs().delete(PrefKeys.refreshToken);
    await Prefs().delete(PrefKeys.accessToken);
    changeState(AuthState.unAuthenticated);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref, AuthState.initial),
);
