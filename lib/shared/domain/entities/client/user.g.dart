// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String? ?? "",
      name: json['name'] as String,
      identification: json['identification'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String? ?? "",
      address: json['address'] as String? ?? "",
      city: json['city'] as String? ?? "",
      departamento: json['departamento'] as String? ?? "",
      bonus: json['bonus'] as int? ?? 0,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'identification': instance.identification,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'city': instance.city,
      'departamento': instance.departamento,
      'bonus': instance.bonus,
    };
