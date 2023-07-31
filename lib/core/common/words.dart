import 'package:easy_localization/src/public_ext.dart';

extension MyWords on Words {
  String tr([dynamic key]) {
    return "$name${key == null ? "" : "\$$key"}".tr();
  }
}

enum Words {about, ayah, basmala, cancel, changeLanguage, chooseLang, chooseLangDes, cyr, darkMode, en, exitApp, exitAppDescription, firstTafser, info, infoList, lan, lightMode, main, no, notification, ok, rateApp, read, ru, settings, share, study, tafser, tafserTitle, title, uz, yes}