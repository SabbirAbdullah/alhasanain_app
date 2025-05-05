import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:alhasanain_app/app/data/repository/authentication_repository.dart';
import 'package:alhasanain_app/app/data/repository/pref_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../data/repository/fcm_token_repository.dart';
import '../../../../routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentsLoginController extends BaseController {
  TextEditingController parentIdController = TextEditingController();
  TextEditingController parentPasswordController = TextEditingController();

  final AuthenticationRepository _repository =
      Get.find(tag: (AuthenticationRepository).toString());
  final PrefRepository _prefRepository =
      Get.find(tag: (PrefRepository).toString());
  loginParents() {
    var loginRespitoryService = _repository.userLogin(
        parentIdController.text, parentPasswordController.text, "parent");
    callDataService(loginRespitoryService,
        onSuccess: _handleLoginSuccess, onError: _handleLoginError);
  }

  _handleLoginSuccess(Map<String, dynamic> response) async {
    if (response["ok"]) {
      await _saveToken(response);
      await _sendFcmTokenToServer();
      _onTapNavigateParents();
    } else {
      Fluttertoast.showToast(
        msg: "Wrong Password",
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 16.0,
      );
    }
  }

  Future<void> _saveToken(Map<String, dynamic> response) async {
    await _prefRepository.setString("token", response['token']);
    await _prefRepository.setString("type", "Parents");
    await _prefRepository.setString("phoneParents", parentIdController.text.trim());
  }

  void _onTapNavigateParents() {
    Get.offAllNamed(
      Routes.PARENTS_STUDENT_CHOISE,
      arguments: parentIdController.text.trim(),
    );
  }

  Future<void> _sendFcmTokenToServer() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      await _prefRepository.setString("fcm_token", fcmToken);
      await sendTokenToApi(fcmToken);
    } else {
      Fluttertoast.showToast(
        msg: "Failed to generate FCM token",
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 16.0,
      );
    }
  }

  final FcmRepository fcmRepository = Get.put(FcmRepository());

  Future<void> sendTokenToApi(String fcmToken) async {
    final userId = parentIdController.text.trim();
    const userType = "parent";

    if (userId.isNotEmpty) {
      final success = await fcmRepository.updateDeviceToken(userId, userType, fcmToken);
      if (success) {
        print('✅ FCM token sent successfully');
      } else {
        print('❌ Failed to send FCM token');
      }
    } else {
      print('⚠️ User info not found');
    }
  }

  _handleLoginError(Exception e) {
    Fluttertoast.showToast(
        msg: errorMessage, toastLength: Toast.LENGTH_SHORT, fontSize: 16.0);
  }

}
