import 'package:flutter/material.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/core/utils/app_text_styles.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsItemWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final Widget? toggle;
  final Function() onTap;

  const SettingsItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.toggle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Provider.of<ThemeProvider>(context).isDark
              ? AppColors.darkBackground
              : AppColors.lightBackground,
          border: Border.all(width: 0.5, color: AppColors.primary),
        ),
        child: Row(
          children: [
            SizedBox(width: 42, child: Center(child: icon)),
            const SizedBox(width: 8),
            Text(
              title,
              style: AppTextStyles.style600.copyWith(
                fontSize: 17,
                color: Provider.of<ThemeProvider>(context).isDark
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
            const Expanded(child: SizedBox()),
            toggle ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
