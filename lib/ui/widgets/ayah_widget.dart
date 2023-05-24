import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/translations/locale_keys.g.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:mulk_app/ui/widgets/tafser.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

class AyahWidget extends StatefulWidget {
  final int number;
  final VoidCallback onPlay;
  final VoidCallback onLoop;
  final AudioPlayer audioPlayer;

  const AyahWidget({
    Key? key,
    required this.number,
    required this.onPlay,
    required this.onLoop,
    required this.audioPlayer,
  }) : super(key: key);

  @override
  State<AyahWidget> createState() => _AyahWidgetState();
}

class _AyahWidgetState extends State<AyahWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int?>(
      stream: widget.audioPlayer.currentIndexStream,
      builder: (context, snapshot) {
        return Container(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 5),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: snapshot.data == widget.number
                ? Colors.lightGreen.withOpacity(0.2)
                : widget.audioPlayer.playing && snapshot.data == widget.number
                    ? Colors.lightGreen.withOpacity(0.4)
                    : Provider.of<ThemeProvider>(context).isDark
                        ? Colors.black
                        : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.5, color: Colors.lightGreen),
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  widget.number == 0
                      ? quran.basmala
                      : quran.getVerse(67, widget.number),
                  textAlign: TextAlign.right,
                  maxLines: 5,
                  style: AppTextStyles.arabic,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.number == 0
                    ? LocaleKeys.basmala.tr()
                    : '  (67:${widget.number}) ${Words.ayah.tr(widget.number)}',
                maxLines: 7,
                style: AppTextStyles.style600,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => Tafser(number: widget.number),
                        ),
                      );
                    },
                    child: const Text("Tafser"),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {
                      widget.onPlay.call();
                      setState(() {});
                    },
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      snapshot.data == widget.number &&
                              widget.audioPlayer.playing
                          ? CupertinoIcons.pause
                          : CupertinoIcons.play,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.share),
                  ),
                  IconButton(
                    onPressed: () {
                      snapshot.data == widget.number
                          ? widget.onLoop.call()
                          : setState(() {});
                      setState(() {});
                    },
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      snapshot.data == widget.number &&
                              widget.audioPlayer.loopMode == LoopMode.one
                          ? CupertinoIcons.repeat_1
                          : CupertinoIcons.repeat,
                      color: snapshot.data == widget.number &&
                              widget.audioPlayer.loopMode == LoopMode.one
                          ? Colors.red
                          : Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
