import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/lobby/data/models/user_light/user_light_model.dart';
import 'package:speak_live_go/features/lobby/domain/repository_providers/lobby_repository_provider.dart';

final AutoDisposeFutureProvider<List<UserLightModel>> readyToTalkListProvider =
    FutureProvider.autoDispose<List<UserLightModel>>(
      (ref) => ref.read(lobbyRepositoryProvider).getReadyToTalkList(),
    );
