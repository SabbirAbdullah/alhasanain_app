import 'package:flutter/material.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
//01833947894
//112233
//AHB-0211
//5431
void main() {
  EnvConfig prodConfig = EnvConfig(
    appName: "Al Hasanain",
    baseUrl: "https://server.alhasanain.com.bd",
    shouldCollectCrashLog: true,
  );
  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  runApp(const MyApp());
}
