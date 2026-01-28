import 'package:dio/dio.dart';
import 'package:speak_live_go/features/lobby/data/models/user_light/user_light_model.dart';
import 'package:speak_live_go/features/lobby/domain/data_sources/lobby_data_source.dart';

class LobbyDataSourceImpl extends LobbyDataSource {
  LobbyDataSourceImpl(Dio client) : _client = client;
  final Dio _client;

  @override
  Future<List<UserLightModel>> getReadyToTalkList() async {
    return List.generate(
      12,
      UserLightModel.getMock,
    );
  }
}
