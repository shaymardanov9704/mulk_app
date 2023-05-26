import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
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
                        ? AppColors.darkBackground
                        : AppColors.lightBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.5, color: AppColors.primary),
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
                    ? Words.basmala.tr()
                    : '  (67:${widget.number}) ${Words.ayah.tr(widget.number)}',
                maxLines: 7,
                style: AppTextStyles.style600,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => Tafser(number: widget.number),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 0.6,
                          color: AppColors.primary,
                        ),
                      ),
                      child: Center(child: Text(Words.tafserTitle.tr())),
                    ),
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
                          ? AppColors.red
                          : Provider.of<ThemeProvider>(context).isDark
                              ? AppColors.white
                              : AppColors.black,
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
