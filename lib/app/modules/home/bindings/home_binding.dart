import 'package:get/get.dart';

import '../../daily_lesson/controllers/day_schedule_controller.dart';
import '../../exam_schedule/controller/exam_schedule_controller.dart';
import '../../notification/controller/notification_controller.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => WeeklyDatesController());
    Get.lazyPut(() => ExamScheduleController());
    Get.lazyPut(() => NotificationController());
  }
}
