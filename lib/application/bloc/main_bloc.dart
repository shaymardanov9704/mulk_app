import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'main_event.dart';

part 'main_state.dart';

part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.state()) {
    on<MainEvent>(
      (event, emit) async {
        if (event is _init) {
          await _emitInit(event, emit);
        } else if (event is _play) {
          await _emitPlay(event, emit);
        } else if (event is _pause) {
          await _emitPause(event, emit);
        } else if (event is _loopMode) {
          await _emitLoopMode(event, emit);
        } else if (event is _playAtIndex) {
          await _emitPlayAtIndex(event, emit);
        }
      },
    );
  }

  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> _emitInit(
    _init event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(
      playerStatus: PlayerStatus.initial,
      status: EnumStatus.loading,
    ));

    await audioPlayer.setAudioSource(ConcatenatingAudioSource(children: [
      AudioSource.asset("assets/audios/ayah_0.mp3"),
      AudioSource.asset("assets/audios/ayah_1.mp3"),
      AudioSource.asset("assets/audios/ayah_2.mp3"),
      AudioSource.asset("assets/audios/ayah_3.mp3"),
      AudioSource.asset("assets/audios/ayah_4.mp3"),
      AudioSource.asset("assets/audios/ayah_5.mp3"),
      AudioSource.asset("assets/audios/ayah_6.mp3"),
      AudioSource.asset("assets/audios/ayah_7.mp3"),
      AudioSource.asset("assets/audios/ayah_8.mp3"),
      AudioSource.asset("assets/audios/ayah_9.mp3"),
      AudioSource.asset("assets/audios/ayah_10.mp3"),
      AudioSource.asset("assets/audios/ayah_11.mp3"),
      AudioSource.asset("assets/audios/ayah_12.mp3"),
      AudioSource.asset("assets/audios/ayah_13.mp3"),
      AudioSource.asset("assets/audios/ayah_14.mp3"),
      AudioSource.asset("assets/audios/ayah_15.mp3"),
      AudioSource.asset("assets/audios/ayah_16.mp3"),
      AudioSource.asset("assets/audios/ayah_17.mp3"),
      AudioSource.asset("assets/audios/ayah_18.mp3"),
      AudioSource.asset("assets/audios/ayah_19.mp3"),
      AudioSource.asset("assets/audios/ayah_20.mp3"),
      AudioSource.asset("assets/audios/ayah_21.mp3"),
      AudioSource.asset("assets/audios/ayah_22.mp3"),
      AudioSource.asset("assets/audios/ayah_23.mp3"),
      AudioSource.asset("assets/audios/ayah_24.mp3"),
      AudioSource.asset("assets/audios/ayah_25.mp3"),
      AudioSource.asset("assets/audios/ayah_26.mp3"),
      AudioSource.asset("assets/audios/ayah_27.mp3"),
      AudioSource.asset("assets/audios/ayah_28.mp3"),
      AudioSource.asset("assets/audios/ayah_29.mp3"),
      AudioSource.asset("assets/audios/ayah_30.mp3"),
    ]));
    emit(state.copyWith(status: EnumStatus.success));
  }

  Future<void> _emitPlay(
    _play event,
    Emitter<MainState> emit,
  ) async {
    audioPlayer.play();
    emit(state.copyWith(playerStatus: PlayerStatus.play));
  }

  Future<void> _emitPause(
    _pause event,
    Emitter<MainState> emit,
  ) async {
    await audioPlayer.pause();
    emit(state.copyWith(playerStatus: PlayerStatus.pause));
  }

  Future<void> _emitPlayAtIndex(
    _playAtIndex event,
    Emitter<MainState> emit,
  ) async {
    if (audioPlayer.currentIndex == event.index) {
      audioPlayer.play();
    } else {
      audioPlayer.seek(Duration.zero, index: event.index);
      audioPlayer.play();
    }

    emit(state.copyWith(playerStatus: PlayerStatus.play));
  }

  Future<void> _emitLoopMode(
    _loopMode event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(playerStatus: PlayerStatus.loopMode));
  }
}
