import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:alhasanain_app/app/data/repository/authentication_repository.dart';
import 'package:alhasanain_app/app/data/repository/pref_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';

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

  _handleLoginSuccess(Map<String,dynamic> response){
    if (response["ok"] == true) {
      _saveToken(response);
      _onTapNavigateStudent();
    } else {
      Get.snackbar("Message", "Wrong Id or password");
    }
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

_saveToken(Map<String,dynamic> response) async {
  await _prefRepository.setString("token",response['token']);
  await _prefRepository.setString("type","Student");
  await _prefRepository.setString("id","${studentIdController.text.trim()}");
}


  _handleLoginError(Exception e){

  }



  void _onTapNavigateStudent() {
    Get.offAllNamed(Routes.STUDENT_MAIN,arguments:studentIdController.text.trim());
  }




}

