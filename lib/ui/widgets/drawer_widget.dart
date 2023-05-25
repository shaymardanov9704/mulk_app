import 'package:flutter/material.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/ui/dialogs/language_dialog.dart';
import 'package:mulk_app/ui/widgets/btn.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Words.changeLanguage.tr(),
                style: AppTextStyles.style600,
              ),
              const Btn(),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              LanguageDialog(context: context).show();
            },
            child: Text(Words.changeLanguage.tr()),
          ),
        ],
      ),
    );
  }
}
