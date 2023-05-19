import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulk_app/application/bloc/main_bloc.dart';
import 'package:mulk_app/ui/core/translations/locale_keys.g.dart';
import 'package:mulk_app/ui/core/utils/app_colors.dart';
import 'package:mulk_app/ui/pages/tafseer_page.dart';
import 'package:mulk_app/ui/widgets/ayah_widget.dart';
import 'package:mulk_app/ui/widgets/draver_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

//assalamu aleykum السَّلاَمُ عَلَيْكُمْ وَرَحْمَةُ اللهِ وَبَرَكَاتُهُ
//بسم الله الرحمن الرحيم  basmala
class _MainPageState extends State<MainPage> {
  final bloc = MainBloc()..add(MainEvent.init());
  int _index = 0;

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            // color: AppColors.background,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("Al Mulk"),
                ),
                drawer: const DrawerWidget(),
                body: IndexedStack(
                  index: _index,
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 31,
                      itemBuilder: (_, i) {
                        return AyahWidget(
                          number: i,
                          onPlay: () {
                            state.playerStatus == PlayerStatus.play
                                ? bloc.add(MainEvent.pause())
                                : bloc.add(MainEvent.playAtIndex(index: i));
                          },
                          audioPlayer: bloc.audioPlayer,
                        );
                      },
                    ),
                    const TafseerPage(),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.lightGreen,
                  onPressed: () {
                    state.playerStatus == PlayerStatus.play
                        ? bloc.add(MainEvent.pause())
                        : bloc.add(MainEvent.play());
                  },
                  child: Icon(
                    state.playerStatus == PlayerStatus.play
                        ? CupertinoIcons.pause
                        : CupertinoIcons.play,
                  ),
                ),
                bottomNavigationBar: BottomNavyBar(
                  selectedIndex: _index,
                  showElevation: true,
                  backgroundColor: Colors.lightGreen.shade800,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  ],
                  onItemSelected: (int value) {
                    setState(() {
                      _index = value;
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
