import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mulk_app/core/hive/cache_hive.dart';
import 'package:mulk_app/core/hive/hive_base.dart';

final di = GetIt.instance;

Future<void> setup({bool testServerEnabled = kDebugMode}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setupConfigs();
  await _setupFactories();
}

Future<void> _setupConfigs() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );
}

Future<void> _setupFactories() async {
  di.registerSingleton(HiveBase());
  await di.get<HiveBase>().init();
  di.registerFactory(() => CacheHive(di.get<HiveBase>().cacheBox));
}
