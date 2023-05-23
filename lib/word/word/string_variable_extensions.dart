extension MyVariableString on String {
  String toCamelCase() {
    var data = toSnakeCase();
    var result = "";
    for (int i = 0; i < data.length; i++) {
      var temp = data[i];
      if (i > 0 && data[i - 1] == "_") {
        temp = data[i].toUpperCase();
      }
      result += temp;
    }
    return result.replaceAll("_", "");
  }

  String toPascalCase() {
    var data = toSnakeCase();
    if (data.isEmpty) return "";
    data = "${data[0].toUpperCase()}${data.substring(1)}";
    var result = "";
    for (int i = 0; i < data.length; i++) {
      var temp = data[i];
      if (i > 0 && data[i - 1] == "_") {
        temp = data[i].toUpperCase();
      }
      result += temp;
    }
    return result.replaceAll("_", "");
  }

  String toSnakeCase() {
    var data = "";
    var result = "";

    if (!_hasLowerCase()) {
      return toLowerCase();
    }

    for (int i = 0; i < length; i++) {
      if (RegExp(r'^[A-Z]').hasMatch(this[i])) {
        data += "_";
      }
      data += this[i];
    }
    data = "_${data.toLowerCase()}_";

    for (int i = 1; i < data.length; i++) {
      if (data[i - 1] != "_" || data[i] != "_") {
        result += data[i];
      }
    }

    if (result[result.length - 1] == "_") {
      result = result.substring(0, result.length - 1);
    }
    return result;
  }

  String cleanExtraElements() {
    var text = this;
    final index = text.lastIndexOf("\$");
    if (index != -1 && index != 0) {
      text = text.substring(0, index);
    }
    return text;
  }

  String toKrill() {
    var s = this;
    for (int i = 0; i < _words.length; i++) {
      s = s.replaceAll(_words[i].uz, _words[i].ru);
    }
    return s;
  }

  bool _hasLowerCase() {
    for (int i = 0; i < length; i++) {
      if (RegExp(r'^[a-z]').hasMatch(this[i])) {
        return true;
      }
    }
    return false;
  }
}

extension MyList on List {
  void addUnique(dynamic value) {
    for (int i = 0; i < length; i++) {
      if (this[i] == value) return;
    }
    add(value);
  }
}

const _words = <_WordModel>[
  _WordModel(ru: "ш", uz: "sh"),
  _WordModel(ru: "щ", uz: "sha"),
  _WordModel(ru: "ч", uz: "ch"),
  _WordModel(ru: "ў", uz: "o'"),
  _WordModel(ru: "ғ", uz: "g'"),
  _WordModel(ru: "ц", uz: "s"),
  _WordModel(ru: "я", uz: "ya"),
  _WordModel(ru: "ё", uz: "yo"),
  _WordModel(ru: "ю", uz: "yu"),
  _WordModel(ru: "ъ", uz: "'"),
  _WordModel(ru: "ы", uz: ""),
  _WordModel(ru: "ь", uz: ""),
  _WordModel(ru: "а", uz: "a"),
  _WordModel(ru: "б", uz: "b"),
  _WordModel(ru: "д", uz: "d"),
  _WordModel(ru: "э", uz: "e"),
  _WordModel(ru: "ф", uz: "f"),
  _WordModel(ru: "г", uz: "g"),
  _WordModel(ru: "ҳ", uz: "h"),
  _WordModel(ru: "и", uz: "i"),
  _WordModel(ru: "ж", uz: "j"),
  _WordModel(ru: "к", uz: "k"),
  _WordModel(ru: "л", uz: "l"),
  _WordModel(ru: "м", uz: "m"),
  _WordModel(ru: "н", uz: "n"),
  _WordModel(ru: "о", uz: "o"),
  _WordModel(ru: "п", uz: "p"),
  _WordModel(ru: "қ", uz: "q"),
  _WordModel(ru: "р", uz: "r"),
  _WordModel(ru: "с", uz: "s"),
  _WordModel(ru: "т", uz: "t"),
  _WordModel(ru: "у", uz: "u"),
  _WordModel(ru: "й", uz: "y"),
  _WordModel(ru: "х", uz: "x"),
  _WordModel(ru: "в", uz: "v"),
  _WordModel(ru: "з", uz: "z"),
];

class _WordModel {
  final String ru;
  final String uz;

  const _WordModel({required this.ru, required this.uz});
}
