part of 'main_bloc.dart';

@freezed
abstract class MainEvent with _$MainEvent {
  factory MainEvent.init() = _init;
  factory MainEvent.play() = _play;
  factory MainEvent.playAtIndex({required int index}) = _playAtIndex;
  factory MainEvent.pause() = _pause;
  factory MainEvent.loopMode() = _loopMode;
}
