part of 'splash_bloc.dart';

@freezed
abstract class SplashEvent with _$SplashEvent {
  factory SplashEvent.init() = _init;
}
