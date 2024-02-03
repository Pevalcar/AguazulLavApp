import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default("") String id,
    required String name,
    required String phone,
    @Default("") String email,
    @Default("") String address,
    @Default("") String city,
    @Default("") String departamento,
    required String identification,
    @Default(0)  int bonus,
    
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
