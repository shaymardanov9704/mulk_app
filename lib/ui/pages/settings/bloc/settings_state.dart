part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  factory SettingsState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }
