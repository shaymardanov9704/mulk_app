// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';

extension MyWords on Words {
  String tr([dynamic key]) {
   return "$name${key == null ? "" : "$key"}".tr();
  }
}

enum Words {about, ayah1, ayah10, ayah11, ayah12, ayah13, ayah14, ayah15, ayah16, ayah17, ayah18, ayah19, ayah2, ayah20, ayah21, ayah22, ayah23, ayah24, ayah25, ayah26, ayah27, ayah28, ayah29, ayah3, ayah30, ayah4, ayah5, ayah6, ayah7, ayah8, ayah9, basmala, darkMode, firstT, info, infoList, lan, lightMode, read, settings, study, tafser1, tafser10, tafser11, tafser12, tafser13, tafser14, tafser15, tafser16, tafser17, tafser18, tafser19, tafser20, tafser21, tafser22, tafser23, tafser24, tafser25, tafser26, tafser27, tafser28, tafser29, tafser3, tafser30, tafser4, tafser5, tafser6, tafser7, tafser8, tafser9, tafserr, tafsir2, title}