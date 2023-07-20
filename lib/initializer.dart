import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'infrastructure/config/build_config.dart';
import 'infrastructure/config/env_config.dart';
import 'infrastructure/config/environment.dart';
import 'infrastructure/shared/log.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      EnvConfig devConfig = EnvConfig(
        appName: "Test",
        baseUrl: '',
        baseUrlGooglePlace: '',
        shouldCollectCrashLog: true,
      );
      BuildConfig.instantiate(
        envType: Environment.development,
        envConfig: devConfig,
      );
      _initLog();
      _initScreenPreference();

    } catch (err) {
      rethrow;
    }
  }

  static _initLog() {
    Log.init();
    Log.setLevel(Level.ALL);
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

}
