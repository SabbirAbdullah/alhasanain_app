
import 'package:get/get.dart';

import '../controllers/ct_controller.dart';

class CTListBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => CTController());
  }

}