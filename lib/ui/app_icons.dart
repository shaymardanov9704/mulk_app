import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  AppIcons._();

  static SvgPicture mosque = SvgPicture.asset("assets/icons/mosque.svg");
  static SvgPicture book = SvgPicture.asset("assets/icons/book.svg");
  static SvgPicture openBook = SvgPicture.asset("assets/icons/open_book.svg");
  static SvgPicture settings = SvgPicture.asset("assets/icons/settings.svg");
  static SvgPicture back = SvgPicture.asset("assets/icons/back.svg");
  static SvgPicture moon = SvgPicture.asset("assets/icons/moon.svg");
  static SvgPicture moonDark = SvgPicture.asset("assets/icons/moon_dark.svg");
  static SvgPicture bookI = SvgPicture.asset("assets/icons/book_i.svg");
  static SvgPicture info = SvgPicture.asset("assets/icons/info.svg");
  static SvgPicture share = SvgPicture.asset("assets/icons/share.svg");
  static SvgPicture earth = SvgPicture.asset("assets/icons/earth.svg");
  static SvgPicture drawer = SvgPicture.asset("assets/icons/drawer.svg");
  static SvgPicture playStore = SvgPicture.asset("assets/icons/play_store.svg");
  static SvgPicture notification = SvgPicture.asset("assets/icons/notification.svg");
}

extension CustomSvg on SvgPicture {
  SvgPicture copyWith({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) {
    final picture = pictureProvider as ExactAssetPicture;
    if (colorFilter != null) {
      var colorString = "$colorFilter"
          .substring("$colorFilter".indexOf("value: Color(") + 13);
      colorString = colorString.substring(0, colorString.indexOf(")),"));
      color = color ?? Color(int.parse(colorString));
    }
    return SvgPicture.asset(
      picture.assetName,
      width: width ?? this.width,
      height: height ?? this.height,
      fit: fit ?? this.fit,
      color: color,
    );
  }

  String get path => (pictureProvider as ExactAssetPicture).assetName;
}

extension Extension on Image {
  Image copyWith({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) {
    return Image(
      image: image,
      width: width ?? this.width,
      height: height ?? this.height,
      fit: fit ?? this.fit,
      color: color ?? this.color,
    );
  }

  String get path {
    final path = "$image";
    const key = ', name: "';
    if (path.contains(key)) {
      return path.substring(path.indexOf(key) + key.length, path.length - 2);
    }
    return "";
  }
}
