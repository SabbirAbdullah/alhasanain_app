
import 'package:alhasanain_app/app/modules/home_mid/classroutine/controllers/class_routine_controller.dart';
import 'package:get/get.dart';

class ClassRoutineBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ClassRoutineController());
  }
}