import 'package:get/get.dart';

import '../controller/parents_login_controller.dart';

class ParentsLoginBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ParentsLoginController());
  }

}