import 'package:alhasanain_app/app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/event_and_news/view/event_news_view.dart';
import 'modules/exam_schedule/view/exam_schedule_view.dart';
import 'modules/home_mid/CT/views/ct_view.dart';
import 'modules/home_mid/eDiary/views/eDiary_view.dart';
import 'modules/home_mid/result/monthly_report/view/monthly_report_view.dart';
import 'modules/home_mid/result/term_report/view/term_report.dart';
import 'modules/incident_report/view/incident_view.dart';
import 'modules/notification/view/notification_view.dart';
import 'modules/student_fees_payment/view/student_fees_payment_view.dart';

// --- Notification Service ---
class NotificationService extends GetxService {
  RemoteMessage? _initialMessage;

  Future<void> init() async {
    await _initializeLocalNotifications();
    await _setupPushNotifications();

    // Save initial message (do not navigate yet!)
    _initialMessage = await _messaging.getInitialMessage();
  }

  RemoteMessage? get initialMessage => _initialMessage;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
    // Just to be super-safe, always listen when service created
    _listenTokenRefresh();
  }



  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/launcher_icon');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("Notification payload: ${response.payload}");
      },
    );
  }

  Future<void> _setupPushNotifications() async {
    // Request permission for iOS
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Get and save the token
    await _getAndSaveFcmToken();

    // Listen to token refresh
    _listenTokenRefresh();

    // Foreground notifications
    FirebaseMessaging.onMessage.listen(_onMessage);

    // App opened from background
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    // App opened from terminated
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      handleNotificationNavigation(initialMessage);
    }
  }

  Future<void> _getAndSaveFcmToken() async {
    try {
      String? token = await _messaging.getToken();
      if (token != null) {
        print("FCM Token generated: $token");
        await _saveFCMTokenLocally(token);
        // Call your API to update device token here if needed
      }
    } catch (e) {
      print("Error getting FCM token: $e");
    }
  }

  void _listenTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      print('FCM Token refreshed: $newToken');
      await _saveFCMTokenLocally(newToken);
      // Update device token on server again here
    });
  }

  void _onMessage(RemoteMessage message) {
    showLocalNotification(message);
  }

  void _onMessageOpenedApp(RemoteMessage message) {
    handleNotificationNavigation(message);
  }

  void handleNotificationNavigation(RemoteMessage message) {
    final className = message.data['className'];
    final id = message.data['id']; // Optional: use it if needed for specific pages

    // Prevent navigation if already on the initial page
    // if (Get.currentRoute != AppPages.INITIAL) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      switch (className) {
        case 'fees':
          Get.to(() => StudentFeesPaymentView());
          break;
        case 'diary':
          Get.to(() => EDairyView());
          break;
        case 'incidentReport':
          Get.to(() => IncidentView());
          break;
        case 'ExamSchedule':
          Get.to(() => ExamSchedulePage());
          break;
        case 'classtest':
          Get.to(() => CtScreen());
          break;
        case 'TermReport':
          Get.to(() => ResultPage());
          break;
        case 'MonthlyReport':
          Get.to(() => MonthlyProgressView());
          break;
        case 'Event':
          Get.to(() => EventNewsView());
          break;
        default:
          Get.to(() => NotificationHistoryPage());
      }
    });
  }


  void showLocalNotification(RemoteMessage message) {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      ticker: 'ticker',
      sound: RawResourceAndroidNotificationSound('notification'),
    );

    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidDetails);

    flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'New Notification',
      message.notification?.body ?? '',
      notificationDetails,
      payload: message.data['className'], // optional
    );
  }

  Future<void> _saveFCMTokenLocally(String fcmToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcm_token', fcmToken);
  }

  Future<void> clearFcmToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('fcm_token');

    try {
      await _messaging.deleteToken(); // delete token from FCM side also
      print("FCM Token cleared successfully");
    } catch (e) {
      print("Error clearing FCM token: $e");
    }
  }
}