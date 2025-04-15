import 'package:get/get.dart';
import '../controller/student_login_controller.dart';

class StudentLoginBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => StudentLoginController());
  }

}