// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
  name: json['name'] as String,
  isOnline: json['is_online'] as bool,
  minute: (json['minute'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  callCount: (json['call_count'] as num?)?.toInt(),
  motto: json['motto'] as String,
);

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
  'minute': instance.minute,
  'name': instance.name,
  'motto': instance.motto,
  'is_online': instance.isOnline,
  'id': instance.id,
  'call_count': instance.callCount,
};
