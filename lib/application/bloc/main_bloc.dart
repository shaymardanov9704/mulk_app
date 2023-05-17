import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'main_event.dart';

part 'main_state.dart';

part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.state()) {
    on<MainEvent>((event, emit) async {
      if (event is _init) {
        await _emitInit(event, emit);
      } else if (event is _play) {
        await _emitPlay(event, emit);
      } else if (event is _pause) {
        await _emitPause(event, emit);
      } else if (event is _loopMode) {
        await _emitLoopMode(event, emit);
      }
    });
  }

  final AssetsAudioPlayer player = AssetsAudioPlayer();
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<int> current() async {
    print(audioPlayer.currentIndex);
    return audioPlayer.currentIndex ?? 0;
  }

  Future<void> _emitInit(
    _init event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(
      playerStatus: PlayerStatus.initial,
      status: EnumStatus.loading,
    ));
    await audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.asset("assets/audios/001001.mp3"),
          AudioSource.asset("assets/audios/067001.mp3"),
          AudioSource.asset("assets/audios/067002.mp3"),
          AudioSource.asset("assets/audios/067003.mp3"),
          AudioSource.asset("assets/audios/067004.mp3"),
          AudioSource.asset("assets/audios/067005.mp3"),
          AudioSource.asset("assets/audios/067006.mp3"),
          AudioSource.asset("assets/audios/067007.mp3"),
          AudioSource.asset("assets/audios/067008.mp3"),
          AudioSource.asset("assets/audios/067009.mp3"),
          AudioSource.asset("assets/audios/067010.mp3"),
          AudioSource.asset("assets/audios/067011.mp3"),
          AudioSource.asset("assets/audios/067012.mp3"),
          AudioSource.asset("assets/audios/067013.mp3"),
          AudioSource.asset("assets/audios/067014.mp3"),
          AudioSource.asset("assets/audios/067015.mp3"),
          AudioSource.asset("assets/audios/067016.mp3"),
          AudioSource.asset("assets/audios/067017.mp3"),
          AudioSource.asset("assets/audios/067018.mp3"),
          AudioSource.asset("assets/audios/067019.mp3"),
          AudioSource.asset("assets/audios/067020.mp3"),
          AudioSource.asset("assets/audios/067021.mp3"),
          AudioSource.asset("assets/audios/067022.mp3"),
          AudioSource.asset("assets/audios/067023.mp3"),
          AudioSource.asset("assets/audios/067024.mp3"),
          AudioSource.asset("assets/audios/067025.mp3"),
          AudioSource.asset("assets/audios/067026.mp3"),
          AudioSource.asset("assets/audios/067027.mp3"),
          AudioSource.asset("assets/audios/067028.mp3"),
          AudioSource.asset("assets/audios/067029.mp3"),
          AudioSource.asset("assets/audios/067030.mp3"),
        ],
      ),
    );
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

  Future<void> _emitLoopMode(
    _loopMode event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(playerStatus: PlayerStatus.loopMode));
  }
}
