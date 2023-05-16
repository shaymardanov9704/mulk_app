part of 'main_bloc.dart';

@freezed
abstract class MainState with _$MainState {
  factory MainState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default(PlayerStatus.initial) PlayerStatus playerStatus,
    @Default(0)int activeIndex,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }

enum PlayerStatus { initial, play, pause, stop, loopMode }
