import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class Client with _$Client {
  const factory Client({
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
  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
