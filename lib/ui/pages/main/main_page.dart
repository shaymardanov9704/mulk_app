import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:mulk_app/ui/app_icons.dart';
import 'package:mulk_app/ui/pages/main/bloc/main_bloc.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/ui/pages/settings/settings_page.dart';
import 'package:mulk_app/ui/pages/main/tafseer_page.dart';
import 'package:mulk_app/ui/widgets/ayah_widget.dart';
import 'package:mulk_app/ui/widgets/bottom_navigaion_bar.dart';
import 'package:mulk_app/ui/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

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

  List<String> titles = [
    Words.main.tr(),
    Words.tafserTitle.tr(),
    Words.settings.tr(),
  ];

  @override
  void dispose() {
    bloc.close();
    bloc.audioPlayer.dispose();
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
            color: Provider.of<ThemeProvider>(context).isDark
                ? AppColors.darkBackground
                : AppColors.lightBackground,
            child: SafeArea(
              bottom: false,
              child: Scaffold(
                appBar: AppBar(title: Text(titles[_index])),
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
                          onLoop: () {
                            bloc.add(MainEvent.loopMode());
                          },
                          audioPlayer: bloc.audioPlayer,
                        );
                      },
                    ),
                    const TafseerPage(),
                    const SettingsPage(),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
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
                bottomNavigationBar: AppBottomNavBar(
                  selectedIndex: _index,
                  showElevation: false,
                  backgroundColor: Provider.of<ThemeProvider>(context).isDark
                      ? AppColors.darkBackground
                      : AppColors.lightBackground,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  items: [
                    AppBottomNavBarItem(
                      icon: AppIcons.mosque.copyWith(color: AppColors.white),
                      title: Text(
                        Words.main.tr(),
                        style: AppTextStyles.style600.copyWith(fontSize: 16),
                      ),
                      activeColor: Provider.of<ThemeProvider>(context).isDark
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    AppBottomNavBarItem(
                      icon: AppIcons.openBook
                          .copyWith(color: AppColors.white, width: 30),
                      title: Text(
                        Words.tafserTitle.tr(),
                        style: AppTextStyles.style600.copyWith(fontSize: 16),
                      ),
                      activeColor: Provider.of<ThemeProvider>(context).isDark
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    AppBottomNavBarItem(
                      icon: AppIcons.settings.copyWith(color: AppColors.white),
                      title: Text(
                        Words.settings.tr(),
                        style: AppTextStyles.style600.copyWith(fontSize: 16),
                      ),
                      activeColor: Provider.of<ThemeProvider>(context).isDark
                          ? AppColors.white
                          : AppColors.black,
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
