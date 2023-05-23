import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_event.dart';

part 'language_state.dart';

part 'language_bloc.freezed.dart';

class LanguageBloc
    extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState.state()) {
    on<_init>(_emitInit);
  }

  Future<void> _emitInit(
    _init event,
    Emitter<LanguageState> emit,
  ) async {}
}

