import 'package:alhasanain_app/app/modules/home_mid/homework/controllers/homework_controller.dart';
import 'package:get/get.dart';

class HomeWorkListBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => HomeWorkListController());
  }

}
