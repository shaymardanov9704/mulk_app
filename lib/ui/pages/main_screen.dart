import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mulk_app/ui/core/translations/locale_keys.g.dart';
import 'package:mulk_app/ui/pages/info_page.dart';
import 'package:quran/quran.dart' as quran;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  bool switchValue = true;

  bool mode = false;

  double h = 0;

  double h1 = 0;

  final AssetsAudioPlayer player = AssetsAudioPlayer();

  int isPlaying = 0;

  int loopMode = 0;

  int playGround = 0;

  getAyahs() async {
    player.open(
        Playlist(
          audios: [
            Audio(
              'assets/audios/001001.mp3',
              metas: Metas(
                id: 'Basmala',
                title: 'Basmala',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067001.mp3',
              metas: Metas(
                id: 'Ayah - 1',
                title: 'Mulk - 1',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067002.mp3',
              metas: Metas(
                id: 'Ayah - 2',
                title: 'Mulk - 2',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067003.mp3',
              metas: Metas(
                id: 'Ayah - 3',
                title: 'Mulk - 3',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067004.mp3',
              metas: Metas(
                id: 'Ayah - 4',
                title: 'Mulk - 4',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067005.mp3',
              metas: Metas(
                id: 'Ayah - 5',
                title: 'Mulk - 5',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067006.mp3',
              metas: Metas(
                id: 'Ayah - 6',
                title: 'Mulk - 6',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067007.mp3',
              metas: Metas(
                id: 'Ayah - 7',
                title: 'Mulk - 7',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067008.mp3',
              metas: Metas(
                id: 'Ayah - 8',
                title: 'Mulk - 8',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067009.mp3',
              metas: Metas(
                id: 'Ayah - 9',
                title: 'Mulk - 9',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067010.mp3',
              metas: Metas(
                id: 'Ayah - 10',
                title: 'Mulk - 10',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067011.mp3',
              metas: Metas(
                id: 'Ayah - 11',
                title: 'Mulk - 11',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067012.mp3',
              metas: Metas(
                id: 'Ayah - 12',
                title: 'Mulk - 12',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067013.mp3',
              metas: Metas(
                id: 'Ayah - 13',
                title: 'Mulk - 13',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067014.mp3',
              metas: Metas(
                id: 'Ayah - 14',
                title: 'Mulk - 14',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067015.mp3',
              metas: Metas(
                id: 'Ayah - 15',
                title: 'Mulk - 15',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067016.mp3',
              metas: Metas(
                id: 'Ayah - 16',
                title: 'Mulk - 16',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067017.mp3',
              metas: Metas(
                id: 'Ayah - 17',
                title: 'Mulk - 17',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067018.mp3',
              metas: Metas(
                id: 'Ayah - 18',
                title: 'Mulk - 18',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067019.mp3',
              metas: Metas(
                id: 'Ayah - 19',
                title: 'Mulk - 19',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067020.mp3',
              metas: Metas(
                id: 'Ayah - 20',
                title: 'Mulk - 20',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067021.mp3',
              metas: Metas(
                id: 'Ayah - 21',
                title: 'Mulk - 21',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067022.mp3',
              metas: Metas(
                id: 'Ayah - 22',
                title: 'Mulk - 22',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067023.mp3',
              metas: Metas(
                id: 'Ayah - 23',
                title: 'Mulk - 23',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067024.mp3',
              metas: Metas(
                id: 'Ayah - 24',
                title: 'Mulk - 24',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067025.mp3',
              metas: Metas(
                id: 'Ayah - 25',
                title: 'Mulk - 25',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067026.mp3',
              metas: Metas(
                id: 'Ayah - 26',
                title: 'Mulk - 26',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067027.mp3',
              metas: Metas(
                id: 'Ayah - 27',
                title: 'Mulk - 27',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067028.mp3',
              metas: Metas(
                id: 'Ayah - 28',
                title: 'Mulk - 28',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067029.mp3',
              metas: Metas(
                id: 'Ayah - 29',
                title: 'Mulk - 29',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
            Audio(
              'assets/audios/067030.mp3',
              metas: Metas(
                id: 'Ayah - 30',
                title: 'Mulk - 30',
                artist: 'Mishary Rashid',
                image:
                    const MetasImage.asset('assets/images/mishary_rashid.png'),
              ),
            ),
          ],
        ),
        showNotification: true,
        autoStart: false,
        loopMode: LoopMode.none);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAyahs();
  }

  playAyah() async {
    await player.play();
    setState(() {
      isPlaying = 1;
    });
  }

  pauseAyah() async {
    await player.pause();
    setState(() {
      isPlaying = 0;
    });
  }

  stopAyah() async {
    await player.stop();
    setState(() {
      isPlaying = 0;
      playGround = 0;
    });
  }

  loopSingle() async {
    await player.setLoopMode(LoopMode.single);
    setState(() {
      loopMode = 1;
    });
  }

  loopPlaylist() async {
    await player.setLoopMode(LoopMode.none);
    setState(() {
      loopMode = 0;
    });
  }

  skip() async {
    await player.next();
    setState(() {
      isPlaying = 1;
    });
  }

  previous() async {
    await player.previous();
    setState(() {
      isPlaying = 1;
    });
  }

  playAtIndex(int index) async {
    await player.playlistPlayAtIndex(index);
    setState(() {
      isPlaying = 1;
      playGround = 1;
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mode ? Colors.yellow.shade100 : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade800, //FF512DA8
        title: Text(
          LocaleKeys.title.tr(),
          style: GoogleFonts.rubik(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: mode ? Colors.yellow.shade100 : Colors.white,
        child: ListView(
          children: [
            Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                color: Colors.lightGreen.shade800,
                child: Center(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'الملك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Scheherazade'),
                    ),
                    Text(
                      LocaleKeys.title.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Scheherazade'),
                    ),
                  ],
                ))),
            GestureDetector(
              onTap: () {
                setState(() {
                  h = (200 - h).abs();
                  h1 = 0;
                });
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 130,
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(CupertinoIcons.globe, size: 28),
                    const SizedBox(width: 5),
                    Text(LocaleKeys.lan.tr(),
                        style: GoogleFonts.rubik(fontSize: 18)),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            h = (200 - h).abs();
                            h1 = 0;
                          });
                        },
                        icon: const Icon(CupertinoIcons.ellipsis_vertical,
                            size: 26))
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              padding: const EdgeInsets.only(left: 30),
              duration: const Duration(milliseconds: 5),
              width: MediaQuery.of(context).size.width - 110,
              height: h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        context.setLocale(const Locale('en'));
                        setState(() {});
                      },
                      child: const Text('        English       ')),
                  OutlinedButton(
                      onPressed: () {
                        context.setLocale(const Locale('ru'));
                        setState(() {});
                      },
                      child: const Text('       Русский      ')),
                  OutlinedButton(
                      onPressed: () {
                        context.setLocale(const Locale('uz'));
                        setState(() {});
                      },
                        child: const Text('        O`zbek       ')),
                  OutlinedButton(
                      onPressed: () {
                        context.setLocale(const Locale('de'));
                        setState(() {});
                      },
                      child: const Text(' Ўзбек(кирил) ')),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  h1 = (100 - h1).abs();
                  h = 0;
                });
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 130,
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(CupertinoIcons.settings_solid, size: 28),
                    const SizedBox(width: 5),
                    Text(LocaleKeys.sett.tr(),
                        style: GoogleFonts.rubik(fontSize: 18)),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            h1 = (100 - h1).abs();
                            h = 0;
                          });
                        },
                        icon: const Icon(CupertinoIcons.ellipsis_vertical,
                            size: 26))
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              padding: const EdgeInsets.only(left: 30),
              duration: const Duration(milliseconds: 3),
              width: MediaQuery.of(context).size.width - 110,
              height: h1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(LocaleKeys.lmode.tr()),
                      Switch(
                        value: switchValue,
                        onChanged: (_) async {
                          setState(() {
                            mode = false;
                            switchValue = true;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(LocaleKeys.dmode.tr()),
                      Switch(
                        value: !switchValue,
                        onChanged: (_) async {
                          setState(() {
                            mode = true;
                            switchValue = false;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return InfoPage();
                }));
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 130,
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(CupertinoIcons.info, size: 28),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: 198,
                      child: Text(LocaleKeys.info.tr(),
                          style: GoogleFonts.rubik(fontSize: 16)),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return InfoPage();
                          }));
                        },
                        icon: const Icon(CupertinoIcons.square_arrow_right,
                            size: 26)),
                    const SizedBox(width: 4)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
          child: Stack(
        children: [
          _currentIndex == 0
              ? ListView(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              playAtIndex(0);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 10,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Center(
                                child: Text("quran.getBasmala()",
                                    textAlign: TextAlign.right,
                                    maxLines: 5,
                                    style: const TextStyle(
                                        fontSize: 27,
                                        fontFamily: 'Scheherazade',
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black)),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              LocaleKeys.basmala.tr(),
                              maxLines: 7,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  color: Colors.green.shade900,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: Colors.green.shade400,
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                    ayahWidget(
                        1,
                        'تَبَـٰرَكَ ٱلَّذِى بِيَدِهِ ٱلْمُلْكُ وَهُوَ عَلَىٰ كُلِّ شَىْءٍۢ قَدِير',
                        LocaleKeys.ayah1.tr()),
                    ayahWidget(
                        2,
                        'ٱلَّذِى خَلَقَ سَبْعَ سَمَـٰوَٰتٍۢ طِبَاقًۭا ۖ مَّا تَرَىٰ فِى خَلْقِ ٱلرَّحْمَـٰنِ مِن تَفَـٰوُتٍۢ ۖ فَٱرْجِعِ ٱلْبَصَرَ هَلْ تَرَىٰ مِن فُطُور',
                        LocaleKeys.ayah2.tr()),
                    ayahWidget(
                        3,
                        'ٱلَّذِى خَلَقَ سَبْعَ سَمَـٰوَٰتٍۢ طِبَاقًۭا ۖ مَّا تَرَىٰ فِى خَلْقِ ٱلرَّحْمَـٰنِ مِن تَفَـٰوُتٍۢ ۖ فَٱرْجِعِ ٱلْبَصَرَ هَلْ تَرَىٰ مِن فُطُورٌٍۭۢ',
                        LocaleKeys.ayah3.tr()),
                    ayahWidget(
                        4,
                        'ثُمَّ ٱرْجِعِ ٱلْبَصَرَ كَرَّتَيْنِ يَنقَلِبْ إِلَيْكَ ٱلْبَصَرُ خَاسِئًۭا وَهُوَ حَسِيرٌٌۭۭ',
                        LocaleKeys.ayah4.tr()),
                    ayahWidget(
                        5,
                        'وَلَقَدْ زَيَّنَّا ٱلسَّمَآءَ ٱلدُّنْيَا بِمَصَـٰبِيحَ وَجَعَلْنَـٰهَا رُجُومًۭا لِّلشَّيَـٰطِينِ ۖ وَأَعْتَدْنَا لَهُمْ عَذَابَ ٱلسَّعِيرٌۭ',
                        LocaleKeys.ayah5.tr()),
                    ayahWidget(
                        6,
                        'وَلِلَّذِينَ كَفَرُوا۟ بِرَبِّهِمْ عَذَابُ جَهَنَّمَ ۖ وَبِئْسَ ٱلْمَصِيرٌُۭ',
                        LocaleKeys.ayah6.tr()),
                    ayahWidget(
                        7,
                        'إِذَآ أُلْقُوا۟ فِيهَا سَمِعُوا۟ لَهَا شَهِيقًۭا وَهِىَ تَفُورٌُۭ',
                        LocaleKeys.ayah7.tr()),
                    ayahWidget(
                        8,
                        'تَكَادُ تَمَيَّزُ مِنَ ٱلْغَيْظِ ۖ كُلَّمَآ أُلْقِىَ فِيهَا فَوْجٌۭ سَأَلَهُمْ خَزَنَتُهَآ أَلَمْ يَأْتِكُمْ نَذِيرٌٌۭۭ',
                        LocaleKeys.ayah8.tr()),
                    ayahWidget(
                        9,
                        'قَالُوا۟ بَلَىٰ قَدْ جَآءَنَا نَذِيرٌۭ فَكَذَّبْنَا وَقُلْنَا مَا نَزَّلَ ٱللَّهُ مِن شَىْءٍ إِنْ أَنتُمْ إِلَّا فِى ضَلَـٰلٍۢ كَبِيرٌٍۭۢ',
                        LocaleKeys.ayah9.tr()),
                    ayahWidget(
                        10,
                        'وَقَالُوا۟ لَوْ كُنَّا نَسْمَعُ أَوْ نَعْقِلُ مَا كُنَّا فِىٓ أَصْحَـٰبِ ٱلسَّعِيرٌِۭ',
                        LocaleKeys.ayah10.tr()),
                    ayahWidget(
                        11,
                        'فَٱعْتَرَفُوا۟ بِذَنۢبِهِمْ فَسُحْقًۭا لِّأَصْحَـٰبِ ٱلسَّعِيرٌِۭ',
                        LocaleKeys.ayah11.tr()),
                    ayahWidget(
                        12,
                        'إِنَّ ٱلَّذِينَ يَخْشَوْنَ رَبَّهُم بِٱلْغَيْبِ لَهُم مَّغْفِرَةٌۭ وَأَجْرٌۭ كَبِيرٌٌۭۭ',
                        LocaleKeys.ayah12.tr()),
                    ayahWidget(
                        13,
                        'وَأَسِرُّوا۟ قَوْلَكُمْ أَوِ ٱجْهَرُوا۟ بِهِۦٓ ۖ إِنَّهُۥ عَلِيمٌۢ بِذَاتِ ٱلصُّدُورٌِۭ',
                        LocaleKeys.ayah13.tr()),
                    ayahWidget(
                        14,
                        'أَلَا يَعْلَمُ مَنْ خَلَقَ وَهُوَ ٱللَّطِيفُ ٱلْخَبِيرٌُۭ',
                        LocaleKeys.ayah14.tr()),
                    ayahWidget(
                        15,
                        'هُوَ ٱلَّذِى جَعَلَ لَكُمُ ٱلْأَرْضَ ذَلُولًۭا فَٱمْشُوا۟ فِى مَنَاكِبِهَا وَكُلُوا۟ مِن رِّزْقِهِۦ ۖ وَإِلَيْهِ ٱلنُّشُورٌُۭ',
                        LocaleKeys.ayah15.tr()),
                    ayahWidget(
                        16,
                        'ءَأَمِنتُم مَّن فِى ٱلسَّمَآءِ أَن يَخْسِفَ بِكُمُ ٱلْأَرْضَ فَإِذَا هِىَ تَمُورٌُۭ',
                        LocaleKeys.ayah16.tr()),
                    ayahWidget(
                        17,
                        'أَمْ أَمِنتُم مَّن فِى ٱلسَّمَآءِ أَن يُرْسِلَ عَلَيْكُمْ حَاصِبًۭا ۖ فَسَتَعْلَمُونَ كَيْفَ نَذِيرٌِۭ',
                        LocaleKeys.ayah17.tr()),
                    ayahWidget(
                        18,
                        'وَلَقَدْ كَذَّبَ ٱلَّذِينَ مِن قَبْلِهِمْ فَكَيْفَ كَانَ نَكِيرٌِۭ',
                        LocaleKeys.ayah18.tr()),
                    ayahWidget(
                        19,
                        'أَوَلَمْ يَرَوْا۟ إِلَى ٱلطَّيْرِ فَوْقَهُمْ صَـٰٓفَّـٰتٍۢ وَيَقْبِضْنَ ۚ مَا يُمْسِكُهُنَّ إِلَّا ٱلرَّحْمَـٰنُ ۚ إِنَّهُۥ بِكُلِّ شَىْءٍۭ بَصِيرٌ',
                        LocaleKeys.ayah19.tr()),
                    ayahWidget(
                        20,
                        'أَمَّنْ هَـٰذَا ٱلَّذِى هُوَ جُندٌۭ لَّكُمْ يَنصُرُكُم مِّن دُونِ ٱلرَّحْمَـٰنِ ۚ إِنِ ٱلْكَـٰفِرُونَ إِلَّا فِى غُرُورٌٍۭ',
                        LocaleKeys.ayah20.tr()),
                    ayahWidget(
                        21,
                        'أَمَّنْ هَـٰذَا ٱلَّذِى يَرْزُقُكُمْ إِنْ أَمْسَكَ رِزْقَهُۥ ۚ بَل لَّجُّوا۟ فِى عُتُوٍّۢ وَنُفُورٌٍۭ',
                        LocaleKeys.ayah21.tr()),
                    ayahWidget(
                        22,
                        'أَفَمَن يَمْشِى مُكِبًّا عَلَىٰ وَجْهِهِۦٓ أَهْدَىٰٓ أَمَّن يَمْشِى سَوِيًّا عَلَىٰ صِرَٰطٍۢ مُّسْتَقِيمٌٍۭۢ',
                        LocaleKeys.ayah22.tr()),
                    ayahWidget(
                        23,
                        'قُلْ هُوَ ٱلَّذِىٓ أَنشَأَكُمْ وَجَعَلَ لَكُمُ ٱلسَّمْعَ وَٱلْأَبْصَـٰرَ وَٱلْأَفْـِٔدَةَ ۖ قَلِيلًۭا مَّا تَشْكُرُونَقُلْ هُوَ ٱلَّذِىٓ أَنشَأَكُمْ وَجَعَلَ لَكُمُ ٱلسَّمْعَ وَٱلْأَبْصَـٰرَ وَٱلْأَفْـِٔدَةَ ۖ قَلِيلًۭا مَّا تَشْكُرُونٌَۭ',
                        LocaleKeys.ayah23.tr()),
                    ayahWidget(
                        24,
                        'قُلْ هُوَ ٱلَّذِى ذَرَأَكُمْ فِى ٱلْأَرْضِ وَإِلَيْهِ تُحْشَرُونٌَۭ',
                        LocaleKeys.ayah24.tr()),
                    ayahWidget(
                        25,
                        '     وَيَقُولُونَ مَتَىٰ هَـٰذَا ٱلْوَعْدُ إِن كُنتُمْ صَـٰدِقِينٌَۭ',
                        LocaleKeys.ayah25.tr()),
                    ayahWidget(
                        26,
                        'قُلْ إِنَّمَا ٱلْعِلْمُ عِندَ ٱللَّهِ وَإِنَّمَآ أَنَا۠ نَذِيرٌۭ مُّبِينٌٌۭۭ',
                        LocaleKeys.ayah26.tr()),
                    ayahWidget(
                        27,
                        'فَلَمَّا رَأَوْهُ زُلْفَةًۭ سِيٓـَٔتْ وُجُوهُ ٱلَّذِينَ كَفَرُوا۟ وَقِيلَ هَـٰذَا ٱلَّذِى كُنتُم بِهِۦ تَدَّعُونٌَۭ',
                        LocaleKeys.ayah27.tr()),
                    ayahWidget(
                        28,
                        'قُلْ أَرَءَيْتُمْ إِنْ أَهْلَكَنِىَ ٱللَّهُ وَمَن مَّعِىَ أَوْ رَحِمَنَا فَمَن يُجِيرُ ٱلْكَـٰفِرِينَ مِنْ عَذَابٍ أَلِيمٌٍۭۢ',
                        LocaleKeys.ayah28.tr()),
                    ayahWidget(
                        29,
                        'قُلْ هُوَ ٱلرَّحْمَـٰنُ ءَامَنَّا بِهِۦ وَعَلَيْهِ تَوَكَّلْنَا ۖ فَسَتَعْلَمُونَ مَنْ هُوَ فِى ضَلَـٰلٍۢ مُّبِينٌٍۭۢ',
                        LocaleKeys.ayah29.tr()),
                    ayahWidget(
                        30,
                        'قُلْ أَرَءَيْتُمْ إِنْ أَصْبَحَ مَآؤُكُمْ غَوْرًۭا فَمَن يَأْتِيكُم بِمَآءٍۢ مَّعِينٌٍۭۭ',
                        LocaleKeys.ayah30.tr()),
                  ],
                )
              : _currentIndex == 1
                  ? ListView(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Text(
                              "quran.getBasmala()",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'Scheherazade',
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            )),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Text(
                              '''
تَبَـٰرَكَ ٱلَّذِى بِيَدِهِ ٱلْمُلْكُ وَهُوَ عَلَىٰ كُلِّ شَىْءٍۢ قَدِيرٌ﴿١﴾   ٱلَّذِى خَلَقَ ٱلْمَوْتَ وَٱلْحَيَوٰةَ لِيَبْلُوَكُمْ أَيُّكُمْ أَحْسَنُ عَمَلًۭا ۚ وَهُوَ ٱلْعَزِيزُ ٱلْغَفُورُ﴿٢﴾  ٱلَّذِى خَلَقَ سَبْعَ سَمَـٰوَٰتٍۢ طِبَاقًۭا ۖ مَّا تَرَىٰ فِى خَلْقِ ٱلرَّحْمَـٰنِ مِن تَفَـٰوُتٍۢ ۖ فَٱرْجِعِ ٱلْبَصَرَ هَلْ تَرَىٰ مِن فُطُورٍۢ﴿٣﴾   ثُمَّ ٱرْجِعِ ٱلْبَصَرَ كَرَّتَيْنِ يَنقَلِبْ إِلَيْكَ ٱلْبَصَرُ خَاسِئًۭا وَهُوَ حَسِيرٌۭ﴿٤﴾ وَلَقَدْ زَيَّنَّا ٱلسَّمَآءَ ٱلدُّنْيَا بِمَصَـٰبِيحَ وَجَعَلْنَـٰهَا رُجُومًۭا لِّلشَّيَـٰطِينِ ۖ وَأَعْتَدْنَا لَهُمْ عَذَابَ ٱلسَّعِيرِ﴿٥﴾  وَلِلَّذِينَ كَفَرُوا۟ بِرَبِّهِمْ عَذَابُ جَهَنَّمَ ۖ وَبِئْسَ ٱلْمَصِيرُ﴿٦﴾  إِذَآ أُلْقُوا۟ فِيهَا سَمِعُوا۟ لَهَا شَهِيقًۭا وَهِىَ تَفُورُ﴿٧﴾  تَكَادُ تَمَيَّزُ مِنَ ٱلْغَيْظِ ۖ كُلَّمَآ أُلْقِىَ فِيهَا فَوْجٌۭ سَأَلَهُمْ خَزَنَتُهَآ أَلَمْ يَأْتِكُمْ نَذِيرٌۭ﴿٨﴾  قَالُوا۟ بَلَىٰ قَدْ جَآءَنَا نَذِيرٌۭ فَكَذَّبْنَا وَقُلْنَا مَا نَزَّلَ ٱللَّهُ مِن شَىْءٍ إِنْ أَنتُمْ إِلَّا فِى ضَلَـٰلٍۢ كَبِيرٍۢ﴿٩﴾  وَقَالُوا۟ لَوْ كُنَّا نَسْمَعُ أَوْ نَعْقِلُ مَا كُنَّا فِىٓ أَصْحَـٰبِ ٱلسَّعِيرِ ٍۢ﴿١٠﴾  فَٱعْتَرَفُوا۟ بِذَنۢبِهِمْ فَسُحْقًۭا لِّأَصْحَـٰبِ ٱلسَّعِيرِ﴿١١﴾     إِنَّ ٱلَّذِينَ يَخْشَوْنَ رَبَّهُم بِٱلْغَيْبِ لَهُم مَّغْفِرَةٌۭ وَأَجْرٌۭ كَبِيرٌۭ﴿١٢﴾  وَأَسِرُّوا۟ قَوْلَكُمْ أَوِ ٱجْهَرُوا۟ بِهِۦٓ ۖ إِنَّهُۥ عَلِيمٌۢ بِذَاتِ ٱلصُّدُورِ﴿١٣﴾  أَلَا يَعْلَمُ مَنْ خَلَقَ وَهُوَ ٱللَّطِيفُ ٱلْخَبِيرُ﴿١٤﴾  هُوَ ٱلَّذِى جَعَلَ لَكُمُ ٱلْأَرْضَ ذَلُولًۭا فَٱمْشُوا۟ فِى مَنَاكِبِهَا وَكُلُوا۟ مِن رِّزْقِهِۦ ۖ وَإِلَيْهِ ٱلنُّشُورُ﴿١٥﴾  ءَأَمِنتُم مَّن فِى ٱلسَّمَآءِ أَن يَخْسِفَ بِكُمُ ٱلْأَرْضَ فَإِذَا هِىَ تَمُورُ﴿١٦﴾  أَمْ أَمِنتُم مَّن فِى ٱلسَّمَآءِ أَن يُرْسِلَ عَلَيْكُمْ حَاصِبًۭا ۖ فَسَتَعْلَمُونَ كَيْفَ نَذِيرِ﴿١٧﴾  وَلَقَدْ كَذَّبَ ٱلَّذِينَ مِن قَبْلِهِمْ فَكَيْفَ كَانَ نَكِيرِ﴿١٨﴾  أَوَلَمْ يَرَوْا۟ إِلَى ٱلطَّيْرِ فَوْقَهُمْ صَـٰٓفَّـٰتٍۢ وَيَقْبِضْنَ ۚ مَا يُمْسِكُهُنَّ إِلَّا ٱلرَّحْمَـٰنُ ۚ إِنَّهُۥ بِكُلِّ شَىْءٍۭ بَصِيرٌ﴿١٩﴾  أَمَّنْ هَـٰذَا ٱلَّذِى هُوَ جُندٌۭ لَّكُمْ يَنصُرُكُم مِّن دُونِ ٱلرَّحْمَـٰنِ ۚ إِنِ ٱلْكَـٰفِرُونَ إِلَّا فِى غُرُورٍ﴿٢٠﴾  أَمَّنْ هَـٰذَا ٱلَّذِى يَرْزُقُكُمْ إِنْ أَمْسَكَ رِزْقَهُۥ ۚ بَل لَّجُّوا۟ فِى عُتُوٍّۢ وَنُفُورٍ ٍ﴿٢١﴾  أَفَمَن يَمْشِى مُكِبًّا عَلَىٰ وَجْهِهِۦٓ أَهْدَىٰٓ أَمَّن يَمْشِى سَوِيًّا عَلَىٰ صِرَٰطٍۢ مُّسْتَقِيمٍۢ ٍ﴿٢٢﴾  قُلْ هُوَ ٱلَّذِىٓ أَنشَأَكُمْ وَجَعَلَ لَكُمُ ٱلسَّمْعَ وَٱلْأَبْصَـٰرَ وَٱلْأَفْـِٔدَةَ ۖ قَلِيلًۭا مَّا تَشْكُرُونَ ٍ﴿٢٣﴾  قُلْ هُوَ ٱلَّذِى ذَرَأَكُمْ فِى ٱلْأَرْضِ وَإِلَيْهِ تُحْشَرُونٍَ﴿٢٤﴾  وَيَقُولُونَ مَتَىٰ هَـٰذَا ٱلْوَعْدُ إِن كُنتُمْ صَـٰدِقِينَ﴿٢٥﴾  قُلْ إِنَّمَا ٱلْعِلْمُ عِندَ ٱللَّهِ وَإِنَّمَآ أَنَا۠ نَذِيرٌۭ مُّبِينٌۭ﴿٢٦﴾  فَلَمَّا رَأَوْهُ زُلْفَةًۭ سِيٓـَٔتْ وُجُوهُ ٱلَّذِينَ كَفَرُوا۟ وَقِيلَ هَـٰذَا ٱلَّذِى كُنتُم بِهِۦ تَدَّعُونَ﴿٢٧﴾   قُلْ أَرَءَيْتُمْ إِنْ أَهْلَكَنِىَ ٱللَّهُ وَمَن مَّعِىَ أَوْ رَحِمَنَا فَمَن يُجِيرُ ٱلْكَـٰفِرِينَ مِنْ عَذَابٍ أَلِيمٍۢ﴿٢٨﴾  قُلْ هُوَ ٱلرَّحْمَـٰنُ ءَامَنَّا بِهِۦ وَعَلَيْهِ تَوَكَّلْنَا ۖ فَسَتَعْلَمُونَ مَنْ هُوَ فِى ضَلَـٰلٍۢ مُّبِينٍۢ﴿٢٩﴾  قُلْ أَرَءَيْتُمْ إِنْ أَصْبَحَ مَآؤُكُمْ غَوْرًۭا فَمَن يَأْتِيكُم بِمَآءٍۢ مَّعِينٍۭ
                            ''',
                              textAlign: TextAlign.right,
                              maxLines: 200,
                              style: TextStyle(
                                  fontFamily: 'Scheherazade',
                                  fontSize: 27,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    )
                  : _currentIndex == 2
                      ? ListView(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("quran.getBasmala()",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'Scheherazade',
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black)),
                                  Text(LocaleKeys.basmala.tr(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          color: Colors.green.shade900,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, right: 15, left: 15),
                              width: 380,
                              height: 1,
                              color: Colors.green.shade900,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    LocaleKeys.first_t.tr(),
                                    style: GoogleFonts.roboto(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    width: 380,
                                    height: 1,
                                    color: Colors.green.shade900,
                                  )
                                ],
                              ),
                            ),
                            tafseerWidget(1, LocaleKeys.ayah1.tr(),
                                LocaleKeys.tafser1.tr()),
                            tafseerWidget(2, LocaleKeys.ayah2.tr(),
                                LocaleKeys.tafsir2.tr()),
                            tafseerWidget(3, LocaleKeys.ayah3.tr(),
                                LocaleKeys.tafser3.tr()),
                            tafseerWidget(
                              4,
                              LocaleKeys.ayah4.tr(),
                              LocaleKeys.tafser4.tr(),
                            ),
                            tafseerWidget(5, LocaleKeys.ayah5.tr(),
                                LocaleKeys.tafser5.tr()),
                            tafseerWidget(6, LocaleKeys.ayah6.tr(),
                                LocaleKeys.tafser6.tr()),
                            tafseerWidget(7, LocaleKeys.ayah7.tr(),
                                LocaleKeys.tafser7.tr()),
                            tafseerWidget(8, LocaleKeys.ayah8.tr(),
                                LocaleKeys.tafser8.tr()),
                            tafseerWidget(9, LocaleKeys.ayah9.tr(),
                                LocaleKeys.tafser9.tr()),
                            tafseerWidget(10, LocaleKeys.ayah10.tr(),
                                LocaleKeys.tafser10.tr()),
                            tafseerWidget(11, LocaleKeys.ayah11.tr(),
                                LocaleKeys.tafser11.tr()),
                            tafseerWidget(12, LocaleKeys.ayah12.tr(),
                                LocaleKeys.tafser12.tr()),
                            tafseerWidget(13, LocaleKeys.ayah13.tr(),
                                LocaleKeys.tafser13.tr()),
                            tafseerWidget(14, LocaleKeys.ayah14.tr(),
                                LocaleKeys.tafser14.tr()),
                            tafseerWidget(15, LocaleKeys.ayah15.tr(),
                                LocaleKeys.tafser15.tr()),
                            tafseerWidget(16, LocaleKeys.ayah16.tr(),
                                LocaleKeys.tafser16.tr()),
                            tafseerWidget(17, LocaleKeys.ayah17.tr(),
                                LocaleKeys.tafser17.tr()),
                            tafseerWidget(18, LocaleKeys.ayah18.tr(),
                                LocaleKeys.tafser18.tr()),
                            tafseerWidget(19, LocaleKeys.ayah19.tr(),
                                LocaleKeys.tafser19.tr()),
                            tafseerWidget(20, LocaleKeys.ayah20.tr(),
                                LocaleKeys.tafser20.tr()),
                            tafseerWidget(21, LocaleKeys.ayah21.tr(),
                                LocaleKeys.tafser21.tr()),
                            tafseerWidget(22, LocaleKeys.ayah22.tr(),
                                LocaleKeys.tafser22.tr()),
                            tafseerWidget(23, LocaleKeys.ayah23.tr(),
                                LocaleKeys.tafser23.tr()),
                            tafseerWidget(24, LocaleKeys.ayah24.tr(),
                                LocaleKeys.tafser24.tr()),
                            tafseerWidget(25, LocaleKeys.ayah25.tr(),
                                LocaleKeys.tafser25.tr()),
                            tafseerWidget(26, LocaleKeys.ayah26.tr(),
                                LocaleKeys.tafser26.tr()),
                            tafseerWidget(27, LocaleKeys.ayah27.tr(),
                                LocaleKeys.tafser27.tr()),
                            tafseerWidget(28, LocaleKeys.ayah28.tr(),
                                LocaleKeys.tafser28.tr()),
                            tafseerWidget(29, LocaleKeys.ayah29.tr(),
                                LocaleKeys.tafser29.tr()),
                            tafseerWidget(30, LocaleKeys.ayah30.tr(),
                                LocaleKeys.tafser30.tr()),
                          ],
                        )
                      : Container(),
          playGround == 1
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          width: 280,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightGreen.shade800.withOpacity(0.8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    loopMode == 0
                                        ? loopSingle()
                                        : loopMode == 1
                                            ? loopPlaylist()
                                            : setState(() {});
                                  },
                                  icon: Icon(
                                    loopMode == 1
                                        ? CupertinoIcons.repeat_1
                                        : CupertinoIcons.repeat,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    previous();
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.backward_end_alt,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    isPlaying == 0 ? playAyah() : pauseAyah();
                                  },
                                  icon: Icon(
                                    isPlaying == 0
                                        ? CupertinoIcons.play
                                        : CupertinoIcons.pause,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    skip();
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.forward_end_alt,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    stopAyah();
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.stop,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      )),
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          backgroundColor: Colors.lightGreen.shade800,
          items: [
            BottomNavyBarItem(
              icon: const Icon(CupertinoIcons.square_favorites),
              title: Text(LocaleKeys.study.tr()),
              activeColor: Colors.white,
            ),
            BottomNavyBarItem(
              icon: const Icon(CupertinoIcons.book),
              title: Text(LocaleKeys.read.tr()),
              activeColor: Colors.white,
            ),
            BottomNavyBarItem(
              icon: const Icon(CupertinoIcons.bookmark_fill),
              title: Text(LocaleKeys.tafserr.tr()),
              activeColor: Colors.white,
            ),
          ],
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
          }),
    );
  }

  Widget ayahWidget(int number, String verse, String translations) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              playAtIndex(number);
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Text(verse,
                    textAlign: TextAlign.right,
                    maxLines: 5,
                    style: const TextStyle(
                        fontSize: 27,
                        fontFamily: 'Scheherazade',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Colors.black)),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            child: Text(
              '  (67:$number) $translations',
              maxLines: 7,
              style: GoogleFonts.roboto(
                  color: Colors.green.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.green.shade400,
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget tafseerWidget(int ayahNumber, String translate, String tafseer) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "  ${quran.getVerse(67, ayahNumber)}",
            textAlign: TextAlign.right,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                fontFamily: 'Scheherazade'),
          ),
          const SizedBox(height: 5),
          Text(
            '(67:$ayahNumber) $translate',
            style: GoogleFonts.roboto(
                color: Colors.lightGreen.shade900,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            tafseer,
            style: GoogleFonts.roboto(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 380,
            height: 1,
            color: Colors.green.shade900,
          )
        ],
      ),
    );
  }
}
