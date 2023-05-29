import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mulk_app/core/hive/cache_hive.dart';

part 'splash_event.dart';

part 'splash_state.dart';

part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CacheHive _hive;

  SplashBloc(this._hive) : super(SplashState.state()) {
    on<_init>(_emitInit);
  }

  Future<void> _emitInit(
    _init event,
    Emitter<SplashState> emit,
  ) async {
    final firstTime = _hive.firstTime;
    _hive.setFirstTime();
    emit(state.copyWith(status: EnumStatus.loading, firstTime: firstTime));
  }
}
