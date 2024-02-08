import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_state_model.freezed.dart';
part 'photo_state_model.g.dart';

@freezed
class PhotoState with _$PhotoState {
  const factory PhotoState({
    required String url,
    required String photoName,
    @Default(null) String? message,
    @Default(null) String? code,
  }) = _PhotoState;

  factory PhotoState.fromJson(Map<String, dynamic> json) =>
      _$PhotoStateFromJson(json);
}
