import 'word/word_helper.dart';

void main() async => await word.generate();

const word = WordHelper(
  targetLocale: "uz-UZ",
  locales: ["uz-UZ", "en-EN", "ru-RU", "uz-CYR"],
  assetsPath: "assets/tr",
  dartPath: "lib/core/common",
);
