import 'package:get/get.dart';

import '../controller/parents_students_choice_controller.dart';

class ParentsStudentChoiceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ParentsStudentChoiceController());
  }

}