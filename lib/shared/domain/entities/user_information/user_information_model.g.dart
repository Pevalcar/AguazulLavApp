// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInformationModelImpl _$$UserInformationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInformationModelImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      photoURL: json['photoURL'] as String,
      emailVerified: json['emailVerified'] as bool,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$UserInformationModelImplToJson(
        _$UserInformationModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'emailVerified': instance.emailVerified,
      'password': instance.password,
    };
