// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfiguracionModelImpl _$$ConfiguracionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfiguracionModelImpl(
      nameEmpresa: json['nameEmpresa'] as String,
      lema: json['lema'] as String,
      correo: json['correo'] as String,
      direccion: json['direccion'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$ConfiguracionModelImplToJson(
        _$ConfiguracionModelImpl instance) =>
    <String, dynamic>{
      'nameEmpresa': instance.nameEmpresa,
      'lema': instance.lema,
      'correo': instance.correo,
      'direccion': instance.direccion,
      'phone': instance.phone,
    };
