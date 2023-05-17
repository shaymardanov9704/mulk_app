import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulk_app/application/bloc/main_bloc.dart';
import 'package:mulk_app/ui/core/translations/locale_keys.g.dart';
import 'package:mulk_app/ui/pages/tafseer_page.dart';
import 'package:mulk_app/ui/widgets/ayah_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

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
          return Scaffold(
            appBar: AppBar(title: Text("Some"),),
            body: IndexedStack(
              index: _index,
              children: [
                ListView.builder(
                  itemCount: 31,
                  itemBuilder: (_, i) {
                    return AyahWidget(
                      number: i,
                      onTap: () => bloc.add(MainEvent.play()),
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
          );
        },
      ),
    );
  }
}
