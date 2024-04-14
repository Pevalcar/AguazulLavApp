// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoStateImpl _$$PhotoStateImplFromJson(Map<String, dynamic> json) =>
    _$PhotoStateImpl(
      url: json['url'] as String,
      photoName: json['photoName'] as String,
      message: json['message'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$PhotoStateImplToJson(_$PhotoStateImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'photoName': instance.photoName,
      'message': instance.message,
      'code': instance.code,
    };
