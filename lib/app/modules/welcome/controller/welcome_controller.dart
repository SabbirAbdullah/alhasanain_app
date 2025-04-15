import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:get/get.dart';

import '../../../data/repository/authentication_repository.dart';
import '../../../data/repository/pref_repository.dart';
import '../../../routes/app_pages.dart';

class WelcomeController extends BaseController{
  var activeScreen = 0.obs; // 0 for default, 1 for Student Login, 2 for Parent Login
  final PrefRepository _prefRepository=  Get.find(tag: (PrefRepository).toString());
  final AuthenticationRepository _repository =
  Get.find(tag: (AuthenticationRepository).toString());
@override
  void onInit() {
  _prefRepository.getString("token").then((value) => {
    if(value!=""){
      _prefRepository.getString("type").then((value) => {
        if(value=="Student"){
          _onTapNavigateStudent()
        }
        else if(value=="Parents"){
          _onTapNavigateParents()
        }
      })
    }
  });
    super.onInit();
  }

  void _onTapNavigateStudent() {
    Get.toNamed(Routes.STUDENT_MAIN,);
  }

  void _onTapNavigateParents() {
    Get.toNamed(Routes.PARENTS_STUDENT_CHOISE,);
  }
}