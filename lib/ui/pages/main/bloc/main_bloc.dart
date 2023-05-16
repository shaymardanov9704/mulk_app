import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_event.dart';

part 'main_state.dart';

part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.state()) {
    on<_init>(_emitInit);
    on<_play>(_emitPlay);
    on<_pause>(_emitPause);
    on<_stop>(_emitStop);
    on<_next>(_emitNext);
    on<_previous>(_emitPrevious);
    on<_loopMode>(_emitLoopMode);
  }

  final AssetsAudioPlayer player = AssetsAudioPlayer();

  Future<void> _emitInit(
    _init event,
    Emitter<MainState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EnumStatus.initial,
        playerStatus: PlayerStatus.initial,
      ),
    );
    emit(
      state.copyWith(
        status: EnumStatus.success,
        playerStatus: PlayerStatus.play,
      ),
    );
  }

  Future<void> _emitPlay(
    _play event,
    Emitter<MainState> emit,
  ) async {
    player.open(
      Playlist(
        audios: [
          Audio(
            'assets/audios/001001.mp3',
            metas: Metas(
              id: 'Basmala',
              title: 'Basmala',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067001.mp3',
            metas: Metas(
              id: 'Ayah - 1',
              title: 'Mulk - 1',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067002.mp3',
            metas: Metas(
              id: 'Ayah - 2',
              title: 'Mulk - 2',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067003.mp3',
            metas: Metas(
              id: 'Ayah - 3',
              title: 'Mulk - 3',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067004.mp3',
            metas: Metas(
              id: 'Ayah - 4',
              title: 'Mulk - 4',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067005.mp3',
            metas: Metas(
              id: 'Ayah - 5',
              title: 'Mulk - 5',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067006.mp3',
            metas: Metas(
              id: 'Ayah - 6',
              title: 'Mulk - 6',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067007.mp3',
            metas: Metas(
              id: 'Ayah - 7',
              title: 'Mulk - 7',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067008.mp3',
            metas: Metas(
              id: 'Ayah - 8',
              title: 'Mulk - 8',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067009.mp3',
            metas: Metas(
              id: 'Ayah - 9',
              title: 'Mulk - 9',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067010.mp3',
            metas: Metas(
              id: 'Ayah - 10',
              title: 'Mulk - 10',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067011.mp3',
            metas: Metas(
              id: 'Ayah - 11',
              title: 'Mulk - 11',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067012.mp3',
            metas: Metas(
              id: 'Ayah - 12',
              title: 'Mulk - 12',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067013.mp3',
            metas: Metas(
              id: 'Ayah - 13',
              title: 'Mulk - 13',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067014.mp3',
            metas: Metas(
              id: 'Ayah - 14',
              title: 'Mulk - 14',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067015.mp3',
            metas: Metas(
              id: 'Ayah - 15',
              title: 'Mulk - 15',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067016.mp3',
            metas: Metas(
              id: 'Ayah - 16',
              title: 'Mulk - 16',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067017.mp3',
            metas: Metas(
              id: 'Ayah - 17',
              title: 'Mulk - 17',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067018.mp3',
            metas: Metas(
              id: 'Ayah - 18',
              title: 'Mulk - 18',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067019.mp3',
            metas: Metas(
              id: 'Ayah - 19',
              title: 'Mulk - 19',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067020.mp3',
            metas: Metas(
              id: 'Ayah - 20',
              title: 'Mulk - 20',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067021.mp3',
            metas: Metas(
              id: 'Ayah - 21',
              title: 'Mulk - 21',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067022.mp3',
            metas: Metas(
              id: 'Ayah - 22',
              title: 'Mulk - 22',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067023.mp3',
            metas: Metas(
              id: 'Ayah - 23',
              title: 'Mulk - 23',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067024.mp3',
            metas: Metas(
              id: 'Ayah - 24',
              title: 'Mulk - 24',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067025.mp3',
            metas: Metas(
              id: 'Ayah - 25',
              title: 'Mulk - 25',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067026.mp3',
            metas: Metas(
              id: 'Ayah - 26',
              title: 'Mulk - 26',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067027.mp3',
            metas: Metas(
              id: 'Ayah - 27',
              title: 'Mulk - 27',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067028.mp3',
            metas: Metas(
              id: 'Ayah - 28',
              title: 'Mulk - 28',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067029.mp3',
            metas: Metas(
              id: 'Ayah - 29',
              title: 'Mulk - 29',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
          Audio(
            'assets/audios/067030.mp3',
            metas: Metas(
              id: 'Ayah - 30',
              title: 'Mulk - 30',
              artist: 'Mishary Rashid',
              image: const MetasImage.asset('assets/images/mishary_rashid.png'),
            ),
          ),
        ],
      ),
      showNotification: true,
      autoStart: false,
      loopMode: LoopMode.none,
    );

    await player.play();
    final activeIndex = player.current.value!.index;
    emit(state.copyWith(
      playerStatus: PlayerStatus.play,
      activeIndex: activeIndex,
    ));
  }

  Future<void> _emitPause(
    _pause event,
    Emitter<MainState> emit,
  ) async {
    await player.pause();
    final activeIndex = player.current.value!.index;
    emit(state.copyWith(
      playerStatus: PlayerStatus.pause,
      activeIndex: activeIndex,
    ));
  }

  Future<void> _emitStop(
    _stop event,
    Emitter<MainState> emit,
  ) async {
    await player.stop();
    final activeIndex = player.current.value!.index;
    emit(state.copyWith(
      playerStatus: PlayerStatus.stop,
      activeIndex: activeIndex,
    ));
  }

  Future<void> _emitLoopMode(
    _loopMode event,
    Emitter<MainState> emit,
  ) async {
    await player.setLoopMode(event.mode);
    final activeIndex = player.current.value!.index;
    emit(state.copyWith(
      playerStatus: PlayerStatus.loopMode,
      activeIndex: activeIndex,
    ));
  }

  Future<void> _emitNext(
    _next event,
    Emitter<MainState> emit,
  ) async {
    await player.next();
    final activeIndex = player.current.value!.index;

    emit(state.copyWith(
        playerStatus: PlayerStatus.play, activeIndex: activeIndex));
  }

  Future<void> _emitPrevious(
    _previous event,
    Emitter<MainState> emit,
  ) async {
    await player.previous();
    final activeIndex = player.current.value!.index;
    emit(state.copyWith(
      playerStatus: PlayerStatus.play,
      activeIndex: activeIndex,
    ));
  }
}
