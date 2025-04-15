import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:get/get.dart';

import '../../../core/model/event_news_query_pram.dart';
import '../../../core/widget/event&news/models/event_ news_ui_data.dart';
import '../../../data/model/student_event_news.dart';
import '../../../data/repository/student_data_repository.dart';
import '../../home/model/student_ui_data.dart';

class EventNewsController extends BaseController {
  final StudentDataRepository _repository =
      Get.find(tag: (StudentDataRepository).toString());
  final RxList<EventNewsUiData> _eventNewsListController = RxList.empty();

  List<EventNewsUiData> get eventNewsDataList =>
      _eventNewsListController.toList();

  getEventNewsData(String session, String className) async {
    EventNewsQueryPrem eventNewsQueryPrem = EventNewsQueryPrem(
        session: session, className: className, limit: 10, page: 1);

    var eventNewsRepoService = _repository.getEventNewsData(eventNewsQueryPrem);
    callDataService(eventNewsRepoService,
        onSuccess: _handleEventNewsServiceSuccess, onError: _handleLoginError);
  }

  StudentDataResponseUi studentDataResponseUi = StudentDataResponseUi();
  _handleEventNewsServiceSuccess(StudentEventNews studentEventNews) {
    List<EventNewsUiData>? eventNewsUiData = studentEventNews.message!
        .map((e) => EventNewsUiData(
              name: e.name != null ? e.name! : "Null",
              description: e.des != null ? e.des! : "Null",
              fromData: e.fromDate != null ? e.fromDate! : "Null",
              imageLink: e.image != null ? e.image! : "Null",
            ))
        .toList();
    _eventNewsListController(eventNewsUiData);
  }

  _handleLoginError(Exception e) {}

  @override
  void onInit() {
    var dataModel = Get.arguments;
    if (dataModel is StudentDataResponseUi) {
      studentDataResponseUi = dataModel;
      getEventNewsData(dataModel.studentSession, dataModel.studentClass);
    }
    super.onInit();
  }
}
