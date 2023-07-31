part of 'home_bloc.dart';

@Freezed()
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loading() = _Loading;
  const factory HomeEvent.success() = _Success;
  const factory HomeEvent.error({required String error}) = _Error;
}

