import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:mulk_app/ui/pages/main/bloc/main_bloc.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/core/translations/locale_keys.g.dart';
import 'package:mulk_app/ui/pages/settings/settings_page.dart';
import 'package:mulk_app/ui/pages/main/tafseer_page.dart';
import 'package:mulk_app/ui/widgets/ayah_widget.dart';
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
            color: Provider.of<ThemeProvider>(context).isDark
                ? AppColors.darkBackground
                : AppColors.lightBackground,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("Al Mulk"),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => const SettingsPage(),
                          ),
                        );
                      },
                      icon: const Icon(CupertinoIcons.settings),
                    ),
                  ],
                  leading: Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                        icon: const Icon(CupertinoIcons.tornado),
                      );
                    }
                  ),
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
                          onLoop: () {
                            bloc.add(MainEvent.loopMode());
                          },
                          audioPlayer: bloc.audioPlayer,
                        );
                      },
                    ),
                    const TafseerPage(),
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
                bottomNavigationBar: BottomNavyBar(
                  selectedIndex: _index,
                  showElevation: false,
                  backgroundColor: Provider.of<ThemeProvider>(context).isDark
                      ? AppColors.darkBackground
                      : AppColors.lightBackground,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  items: [
                    BottomNavyBarItem(
                      icon: const Icon(CupertinoIcons.square_favorites),
                      title: Text(
                        LocaleKeys.study.tr(),
                        style: AppTextStyles.style600.copyWith(fontSize: 16),
                      ),
                      activeColor: Provider.of<ThemeProvider>(context).isDark
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    BottomNavyBarItem(
                      icon: const Icon(CupertinoIcons.book),
                      title: Text(
                        LocaleKeys.read.tr(),
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
