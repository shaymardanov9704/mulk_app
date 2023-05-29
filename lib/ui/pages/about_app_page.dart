import 'package:flutter/material.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Words.info.tr())),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Text(Words.infoList.tr(), style: AppTextStyles.style600),
          ),
        ],
      ),
    );
  }
}
