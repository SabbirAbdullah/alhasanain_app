
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import '/app/bindings/initial_binding.dart';
import '/app/core/values/app_colors.dart';
import '/app/routes/app_pages.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'notification_service.dart';




// --- MyApp Widget ---
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final EnvConfig envConfig = BuildConfig.instance.config;

    // Schedule the navigation after the first frame
    Future.delayed(Duration.zero, () {
      final initialMessage = Get.find<NotificationService>().initialMessage;
      if (initialMessage != null) {
        Get.find<NotificationService>().handleNotificationNavigation(initialMessage);
      }
    });

    return GetMaterialApp(
      title: envConfig.appName,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRight,
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      supportedLocales: const [
        Locale('en', ''),
        Locale('bn', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      theme: ThemeData(
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.appBarColor,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        primarySwatch: AppColors.colorPrimarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        primaryColor: AppColors.colorPrimary,
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final EnvConfig _envConfig = BuildConfig.instance.config;
//   late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//   @override
//   void initState() {
//     super.initState();
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     _initializeLocalNotifications();
//     setupPushNotifications();
//   }
//
//   Future<void> _initializeLocalNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/icon');
//
//     const InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//     );
//
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) {
//         // Handle click if needed using response.payload
//       },
//     );
//   }
//
//   Future<void> saveFCMTokenLocally(String fcmToken) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('fcm_token', fcmToken);
//   }
//
//   Future<void> setupPushNotifications() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//     // iOS: Request permissions
//     await messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     // Get FCM token
//     String? fcmToken = await messaging.getToken();
//     print("FCM Token: $fcmToken");
//
//     if (fcmToken != null) {
//       await saveFCMTokenLocally(fcmToken);
//     }
//
//     // Foreground notifications
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       showLocalNotification(message);
//     });
//
//     // App opened from background
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       handleNotificationNavigation(message);
//     });
//
//     // App launched from terminated state
//     RemoteMessage? initialMessage = await messaging.getInitialMessage();
//     if (initialMessage != null) {
//       handleNotificationNavigation(initialMessage);
//     }
//   }
//
//   void handleNotificationNavigation(RemoteMessage message) {
//     final section = message.data['section'];
//
//     switch (section) {
//       case 'fees':
//         Get.to(() =>  StudentFeesPaymentView());
//         break;
//       case 'diary':
//         Get.to(() =>  EDairyView());
//         break;
//       case 'incidentReport':
//         Get.to(() =>  IncidentView());
//         break;
//       case 'ExamSchedule':
//         Get.to(() =>  ExamSchedulePage());
//         break;
//       case 'classtest':
//         Get.to(() =>  CtScreen());
//         break;
//       case 'TermReport':
//         Get.to(() =>  ResultPage());
//         break;
//       case 'MonthlyReport':
//         Get.to(() =>  MonthlyProgressView());
//         break;
//       case 'Event':
//         Get.to(() =>  EventNewsView());
//         break;
//       default:
//         Get.snackbar('No Page', 'No page found for this notification.');
//     }
//   }
//
//   void showLocalNotification(RemoteMessage message) {
//     const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       ticker: 'ticker',
//       sound: RawResourceAndroidNotificationSound('notification'),
//     );
//
//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: androidDetails,
//     );
//
//     flutterLocalNotificationsPlugin.show(
//       0,
//       message.notification?.title ?? 'New Notification',
//       message.notification?.body ?? '',
//       notificationDetails,
//       payload: message.data['url'],
//     );
//   }
//
//   List<Locale> _getSupportedLocales() {
//     return const [
//       Locale('en', ''),
//       Locale('bn', ''),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: _envConfig.appName,
//       debugShowCheckedModeBanner: false,
//       defaultTransition: Transition.leftToRight,
//       initialRoute: AppPages.INITIAL,
//       initialBinding: InitialBinding(),
//       getPages: AppPages.routes,
//       supportedLocales: _getSupportedLocales(),
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//         MonthYearPickerLocalizations.delegate,
//       ],
//       theme: ThemeData(
//         fontFamily: 'Roboto',
//         appBarTheme: AppBarTheme(
//           backgroundColor: AppColors.appBarColor,
//           titleTextStyle: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//           iconTheme: const IconThemeData(color: Colors.white),
//         ),
//         primarySwatch: AppColors.colorPrimarySwatch,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         brightness: Brightness.light,
//         primaryColor: AppColors.colorPrimary,
//         textTheme: const TextTheme(
//           labelLarge: TextStyle(
//             color: Colors.white,
//             fontSize: 14.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
