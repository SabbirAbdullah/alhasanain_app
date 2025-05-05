import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:alhasanain_app/app/data/repository/authentication_repository.dart';
import 'package:alhasanain_app/app/data/repository/pref_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../data/repository/fcm_token_repository.dart';
import '../../../../routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
class StudentLoginController extends BaseController{

  TextEditingController studentIdController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  final AuthenticationRepository _repository =
  Get.find(tag: (AuthenticationRepository).toString());
  final PrefRepository _prefRepository=
  Get.find(tag: (PrefRepository).toString());

  loginStudent() {
    var loginRepositoryService = _repository.userLogin(
        studentIdController.text, passwordController.text, "student");
    callDataService(
        loginRepositoryService,
        onSuccess: _handleLoginSuccess,
        onError: _handleLoginError
    );
  }
  _handleLoginSuccess(Map<String, dynamic> response) {
    if (response["ok"] == true) {
      _saveToken(response);
      _onTapNavigateStudent();
      _sendTokenToApi();
    } else {
      Fluttertoast.showToast(
          msg: "Wrong Id or Password",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 16.0);
    }
  }

  _saveToken(Map<String, dynamic> response) async {
    await _prefRepository.setString("token", response['token']);
    await _prefRepository.setString("type", "Student");
    await _prefRepository.setString("id", "${studentIdController.text.trim()}");
  }

  void _onTapNavigateStudent() {
    Get.offAllNamed(Routes.STUDENT_MAIN, arguments: studentIdController.text.trim());
  }

  Future<String?> getOrCreateFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('fcm_token');

    if (token != null) {
      return token;
    } else {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      token = await messaging.getToken();
      if (token != null) {
        await prefs.setString('fcm_token', token);
      }
      return token;
    }
  }

  _sendTokenToApi() async {
    String? fcmToken = await getOrCreateFCMToken();
    if (fcmToken != null) {
      await sendToken(fcmToken);
    } else {
      Fluttertoast.showToast(
          msg: "Failed to generate FCM token",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 16.0);
    }
  }

  final FcmRepository fcmRepository = Get.put(FcmRepository());
  Future<void> sendToken(String token) async {
    final user = studentIdController.text;
    final type = "student";

    if (user.isNotEmpty && type.isNotEmpty) {
      final success = await fcmRepository.updateDeviceToken(user, type, token);
      if (success) {
        print('✅ FCM token sent successfully');
      } else {
        print('❌ Failed to send FCM token');
      }
    } else {
      print('⚠️ User info not found');
    }
  }

  _handleLoginError(Exception e){
  }

// _handleLoginSuccess(Map<String,dynamic> response){
  //   if(response["message"]){
  //     _saveToken(response);
  //     _onTapNavigateStudent();
  //   }
  //   else{
  //     Get.snackbar("Message", "Wrong Id or password");
  //   }
  // }






}

