import 'package:alhasanain_app/app/modules/home_mid/eDiary/controllers/eDiary_controller.dart';
import 'package:get/get.dart';

class EDiryBingings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => EDairyController());
  }

}