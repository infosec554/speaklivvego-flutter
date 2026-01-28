import 'package:speak_live_go/features/profile/data/models/profile/profile_model.dart';

abstract class ProfileDataSource{
  Future<ProfileModel> getProfile();

}