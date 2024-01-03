// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoStateImpl _$$PhotoStateImplFromJson(Map<String, dynamic> json) =>
    _$PhotoStateImpl(
      url: json['url'] as String? ?? "",
      message: json['message'] as String? ?? null,
      code: json['code'] as String? ?? null,
    );

Map<String, dynamic> _$$PhotoStateImplToJson(_$PhotoStateImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'message': instance.message,
      'code': instance.code,
    };
