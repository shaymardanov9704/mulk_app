part of 'language_bloc.dart';

@freezed
abstract class LanguageState with _$LanguageState {
  factory LanguageState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }
