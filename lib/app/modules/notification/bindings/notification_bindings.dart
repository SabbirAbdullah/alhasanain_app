import 'package:alhasanain_app/app/modules/notification/controller/notification_controller.dart';
import 'package:get/get.dart';


class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController(),
    );
  }
}
