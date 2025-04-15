


import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controllers/attendence_controller.dart';

class AttendenceBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => AttendenceController());
  }

}