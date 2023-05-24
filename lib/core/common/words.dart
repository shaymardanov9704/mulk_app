import 'package:easy_localization/src/public_ext.dart';

extension MyWords on Words {
  String tr([dynamic key]) {
    return "$name${key == null ? "" : "\$$key"}".tr();
  }
}

enum Words {about, ayah, basmala, changeLanguage, cyr, darkMode, en, firstT, info, infoList, lan, lightMode, read, ru, settings, study, tafser, tafserTitle, title, uz}