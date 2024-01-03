
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default("")String id,
    @Default("")String name,
    @Default("")String phone,
    required String email,
    required String photo,
    required String address,
    required String bonus,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}