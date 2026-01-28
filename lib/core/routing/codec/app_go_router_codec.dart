import 'dart:convert';

import 'package:speak_live_go/core/routing/codec/models/base/base_extra_model.dart';
import 'package:speak_live_go/core/routing/codec/models/interests_extra_model.dart';
import 'package:speak_live_go/core/routing/codec/models/language_extra_model.dart';
import 'package:speak_live_go/features/chats/data/models/chat/chat_model.dart';

class AppExtraCodec extends Codec<BaseExtraModel?, Map<String, dynamic>?> {
  const AppExtraCodec();

  @override
  Converter<BaseExtraModel?, Map<String, dynamic>?> get encoder =>
      const _AppExtraEncoder();

  @override
  Converter<Map<String, dynamic>?, BaseExtraModel?> get decoder =>
      const _AppExtraDecoder();
}

class _AppExtraEncoder
    extends Converter<BaseExtraModel?, Map<String, dynamic>?> {
  const _AppExtraEncoder();

  @override
  Map<String, dynamic>? convert(BaseExtraModel? input) {
    if (input == null) return null;

    return {
      '_t': input.getClassName,
      'data': input.toJson(),
    };
  }
}

class _AppExtraDecoder
    extends Converter<Map<String, dynamic>?, BaseExtraModel?> {
  const _AppExtraDecoder();

  @override
  BaseExtraModel? convert(Map<String, dynamic>? input) {
    if (input == null) return null;

    final map = (input['data'] as Map).cast<String, dynamic>();

    switch (input['_t']) {
      case 'ChatModel':
        return ChatModel.fromJson(map);
      case 'LanguageExtraModel':
        return LanguageExtraModel.fromJson(map);
      case 'InterestsExtraModel':
        return InterestsExtraModel.fromJson(map);
      default:
        throw const FormatException();
    }
  }
}
