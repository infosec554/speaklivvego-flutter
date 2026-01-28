import 'package:speak_live_go/core/routing/codec/models/base/base_extra_model.dart';
import 'package:speak_live_go/features/initial_info/data/models/language/language_model.dart';

class LanguageExtraModel extends BaseExtraModel {
  const LanguageExtraModel({
    required this.language,
  });

  final LanguageModel language;

  factory LanguageExtraModel.fromJson(Map<String, dynamic> json) {
    return LanguageExtraModel(
      language: LanguageModel(
        id: json['id'] as int,
        name: json['name'] as String,
      ),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': language.id,
      'name': language.name,
    };
  }

  @override
  String get getClassName => 'LanguageExtraModel';
}
