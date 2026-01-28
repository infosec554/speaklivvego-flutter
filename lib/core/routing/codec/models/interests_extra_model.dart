import 'package:speak_live_go/core/routing/codec/models/base/base_extra_model.dart';

class InterestsExtraModel extends BaseExtraModel {
  const InterestsExtraModel({
    required this.interests,
  });

  final List<String> interests;

  factory InterestsExtraModel.fromJson(Map<String, dynamic> json) {
    return InterestsExtraModel(
      interests: (json['interests'] as List).map((e) => e as String).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'interests': interests,
    };
  }

  @override
  String get getClassName => 'InterestsExtraModel';
}

