


import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_information_model.freezed.dart';
part 'user_information_model.g.dart';

@freezed
class UserInformationModel with _$UserInformationModel {

  const factory UserInformationModel({
    required String uid,
    required String email,
    required String displayName,
    required String photoURL,
    required bool emailVerified,
    required String password,

  }) = _UserInformationModel;

  factory UserInformationModel.fromJson(Map<String, dynamic> json) => _$UserInformationModelFromJson(json);
  
}