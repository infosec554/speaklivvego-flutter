import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/common/presentation/providers/client/client_provider.dart';
import 'package:speak_live_go/features/lobby/data/data_sources/lobby_data_source_impl.dart';
import 'package:speak_live_go/features/lobby/domain/data_sources/lobby_data_source.dart';

final lobbyRepositoryProvider = Provider<LobbyDataSource>(
  (ref) => LobbyDataSourceImpl(
    ref.read(clientProvider),
  ),
);
