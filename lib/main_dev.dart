import 'package:flutter/material.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'flavors/environment.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "Al Hasanain",
    baseUrl: "https://server.alhasanain.com.bd",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const MyApp());
}
