import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:alhasanain_app/app/data/repository/authentication_repository.dart';
import 'package:alhasanain_app/app/data/repository/pref_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  _handleLoginSuccess(Map<String, dynamic> response) {
    if (response["ok"]) {
      _saveToken(response);
      _onTapNavigateParents();
    } else {
      Fluttertoast.showToast(
          msg: "Wrong Password",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 16.0);
    }
  }

  _saveToken(Map<String, dynamic> response) async {
    await _prefRepository.setString("token", response['token']);
    await _prefRepository.setString("type", "Parents");
    await _prefRepository.setString(
        "phoneParents", "${parentIdController.text.trim()}");
  }

  _handleLoginError(Exception e) {
    Fluttertoast.showToast(
        msg: errorMessage, toastLength: Toast.LENGTH_SHORT, fontSize: 16.0);
  }

  void _onTapNavigateParents() {
    Get.toNamed(Routes.PARENTS_STUDENT_CHOISE,
        arguments: parentIdController.text.trim());
  }
}
