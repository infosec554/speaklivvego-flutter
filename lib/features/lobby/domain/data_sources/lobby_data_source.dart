import 'package:speak_live_go/features/lobby/data/models/user_light/user_light_model.dart';

abstract class LobbyDataSource{
  Future<List<UserLightModel>> getReadyToTalkList();

}