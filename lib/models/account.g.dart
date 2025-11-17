// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
  id: json['id'] as String,
  name: json['name'] as String,
  serverUrl: json['serverUrl'] as String,
  email: json['email'] as String?,
  userId: json['userId'] as String?,
  isActive: json['isActive'] as bool? ?? false,
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
);

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'serverUrl': instance.serverUrl,
  'email': instance.email,
  'userId': instance.userId,
  'isActive': instance.isActive,
  'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
};
