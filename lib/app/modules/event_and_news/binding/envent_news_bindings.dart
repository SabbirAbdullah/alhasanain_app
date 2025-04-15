import 'package:alhasanain_app/app/modules/event_and_news/controller/event_news_controller.dart';
import 'package:get/get.dart';

class EventNewsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EventNewsController());
  }

}