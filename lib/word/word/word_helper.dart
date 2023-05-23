// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:convert';
import 'dart:io';
import 'string_variable_extensions.dart';
import 'extensions.dart';

class WordHelper {
  final String targetLocale;
  final List<String> locales;
  final String assetsPath;
  final String dartPath;

  const WordHelper({
    required this.targetLocale,
    required this.locales,
    required this.assetsPath,
    required this.dartPath,
  });

  Future<void> generate() async {
    print("$runtimeType Start...");
    try {
      await _writeWordFile(assetsPath, dartPath, targetLocale);
      print("$runtimeType Write word file");
      await _writeWordJson(assetsPath, locales, targetLocale);
      print("$runtimeType Write json file");
      print("$runtimeType Success");
    } catch (e) {
      print("$runtimeType Xatolik: $e");
    }
  }

  Future<void> _writeWordFile(
    String assetsPath,
    String dartPath,
    String locale,
  ) async {
    final jsonFile = File("${Directory.current.path}/$assetsPath/$locale.json");
    final dartFile = File("${Directory.current.path}/$dartPath/words.dart");
    final json = jsonDecode(await jsonFile.readAsString());
    final keys = <String>[];
    json.forEach(
      (key, value) => keys.addUnique("$key".toCamelCase().cleanExtraElements()),
    );
    keys.sort();
    await dartFile.writeAsString(keys.dartContent());
  }

  Future<void> _writeWordJson(
    String assetsPath,
    List<String> locales,
    String target,
  ) async {
    final targetFile = File(
      "${Directory.current.path}/$assetsPath/$target.json",
    );
    final Map<String, dynamic> targetJson = jsonDecode(
      await targetFile.readAsString(),
    );

    for (int i = 0; i < locales.length; i++) {
      final jsonFile = File(
        "${Directory.current.path}/$assetsPath/${locales[i]}.json",
      );
      final Map<String, dynamic> json = jsonDecode(
        await jsonFile.readAsString(),
      );
      final data = <String, dynamic>{};
      if (json.isEmpty) break;
      json.forEach(
        (k, v) => data.addAll(
          {
            '"$k"': '"${"$v".replaceAll("\n", "\\n").replaceAll("\"", '\\"')}"',
          },
        ),
      );
      targetJson.forEach((key, value) {
        if (!json.containsKey(key)) data.addAll({'"$key"': '""'});
      });
      final tmp = <String>[];
      data.forEach((key, value) {
        if (!targetJson.containsKey(key.substring(1, key.length - 1))) {
          tmp.add(key);
        }
      });
      for (var key in tmp) {
        data.remove(key);
      }
      final list = data.entries.toList();
      list.sort(((a, b) => a.key.compareTo(b.key)));
      var text = "";
      for (var e in list) {
        text += '  ${e.key}: ${e.value},\n';
      }
      text = text.substring(0, text.length - 2);
      text = "{\n$text\n}";
      await jsonFile.writeAsString(text);
    }
  }
}
