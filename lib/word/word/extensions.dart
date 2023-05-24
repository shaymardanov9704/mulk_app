extension MyList on List {
  String dartContent() {
    var text = "$this";
    text = text.substring(1, text.length - 1);

    return """
import 'package:easy_localization/src/public_ext.dart';

extension MyWords on Words {
  String tr([dynamic key]) {
    return "\$name\${key == null ? "" : "\\\$\$key"}".tr();
  }
}

enum Words {$text}""";
  }
}
