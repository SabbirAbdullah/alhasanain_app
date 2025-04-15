import 'package:get/get.dart';

import '../controllers/day_schedule_controller.dart';
import '/app/modules/home/controllers/home_controller.dart';

class DailyLessonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeeklyDatesController(),
    );
  }
}
