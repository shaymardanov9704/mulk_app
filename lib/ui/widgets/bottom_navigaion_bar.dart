import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mulk_app/core/utils/app_colors.dart';
import 'package:mulk_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class AppBottomNavyBar extends StatelessWidget {
  const AppBottomNavyBar({
    Key? key,
    this.selectedIndex = 0,
    this.iconSize = 24,
    this.backgroundColor,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;

  final Duration animationDuration;
  final List<AppBottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppColors.lightBackground;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.6),
            blurRadius: 0.6,
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 70,
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final AppBottomNavyBarItem item;
  final Color backgroundColor;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            width: isSelected ? 55 : 40,
            height: isSelected ? 55 : 40,
            duration: animationDuration,
            curve: curve,
            decoration: BoxDecoration(
              color: isSelected
                  ? item.activeColor.withOpacity(0.6)
                  : backgroundColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: SvgPicture.asset(
                item.path,
                width: isSelected ? 34 : 25,
                color: Provider.of<ThemeProvider>(context).isDark
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBottomNavyBarItem {
  AppBottomNavyBarItem({
    this.path = "",
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });

  final String path;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
}
