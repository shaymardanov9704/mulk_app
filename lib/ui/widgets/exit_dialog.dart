import 'package:flutter/material.dart';
import 'package:mulk_app/core/common/words.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ExitDialog extends StatelessWidget {
  final Function() ok;

  const ExitDialog({Key? key, required this.ok}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Provider.of<ThemeProvider>(context).isDark
                ? AppColors.darkBackground
                : AppColors.lightBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  Words.exitApp.tr(),
                  style: AppTextStyles.style600.copyWith(fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  Words.exitAppDescription.tr(),
                  style: AppTextStyles.style500,
                ),
              ),
              Container(
                height: 1,
                color: AppColors.primary,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(Words.no.tr()),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: double.infinity,
                      color: AppColors.primary,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: ok,
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(Words.yes.tr()),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
