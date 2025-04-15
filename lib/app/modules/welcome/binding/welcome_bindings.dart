import 'package:alhasanain_app/app/modules/welcome/controller/welcome_controller.dart';
import 'package:get/get.dart';

class WelcomeBindings extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => WelcomeController());
  }

}