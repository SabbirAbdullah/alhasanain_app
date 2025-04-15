import 'package:alhasanain_app/app/modules/academic_calender/controllers/academic_calender_controller.dart';
import 'package:get/get.dart';

class AcademicCalenderBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicCalenderController());
  }

}