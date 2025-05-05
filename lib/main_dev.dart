import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'app/notification_service.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Received a background message: ${message.data}");
}
// --- Main Function ---
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  EnvConfig prodConfig = EnvConfig(
    appName: "Al Hasanain",
    baseUrl: "https://server.alhasanain.com.bd",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: prodConfig,
  );

  // Initialize and register the NotificationService
  await Get.putAsync(() async {
    final service = NotificationService();
    await service.init();
    return service;
  });

  runApp(const MyApp());
}



