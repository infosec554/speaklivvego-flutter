import 'package:dio/dio.dart';
import 'package:speak_live_go/features/profile/data/models/profile/profile_model.dart';
import 'package:speak_live_go/features/profile/domain/data_sources/profile_data_source.dart';

class ProfileDataSourceImpl extends ProfileDataSource {
  ProfileDataSourceImpl(Dio client) : _client = client;
  final Dio _client;

  @override
  Future<ProfileModel> getProfile() async {
    return ProfileModel.getMock(1);
    // try {
    //
    //     final response = await _client.get<dynamic>(
    //       EndPoints.pro,
    //     );
    //     final result = (response.data as List)
    //         .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
    //         .toList();
    //
    //     return result;
    //    } catch (e) {
    //     throw Exception(e);
    //   }
  }
}
