
import 'package:get/get.dart';

import '../../../../data/model/student_data_response.dart';
import '../../../../data/model/student_event_news.dart';
import '../../../../data/repository/pref_repository.dart';
import '../../../../data/repository/student_data_repository.dart';
import '../../../../modules/home/model/student_ui_data.dart';
import '../../../base/base_controller.dart';
import '../../../model/event_news_query_pram.dart';
import '../models/event_ news_ui_data.dart';




class EventNewsControllers extends BaseController{

  var demoDataUi=StudentDataResponseUi().obs;
  final StudentDataRepository _repository =
  Get.find(tag: (StudentDataRepository).toString());


  final PrefRepository _prefRepository=  Get.find(tag: (PrefRepository).toString());

  final RxList<StudentDataResponseUi> _studentDataListController =
  RxList.empty();

  List<StudentDataResponseUi> get studentDataList =>
      _studentDataListController.toList();


  final RxList<EventNewsUiData> _eventNewsListController =
  RxList.empty();

  List<EventNewsUiData> get eventNewsDataList =>
      _eventNewsListController.toList();


  getEventNewsData()async{

    EventNewsQueryPrem eventNewsQueryPrem=EventNewsQueryPrem(session: '', className: '', limit: 15, page: 1);

    var eventNewsRepoService=_repository.getEventNewsData(eventNewsQueryPrem);
    callDataService(
        eventNewsRepoService,
        onSuccess: _handleEventNewsServiceSuccess,
        onError: _handleLoginError
    );
  }



  _handleEventNewsServiceSuccess(StudentEventNews studentEventNews){
    List<EventNewsUiData>? eventNewsUiData = studentEventNews.message
    !.map((e) => EventNewsUiData(
      name: e.name != null ? e.name! : "Null",
      description: e.des != null ? e.des! : "Null",
    )).toList();
    _eventNewsListController(eventNewsUiData);
  }




  _handleLoginError(Exception e){

  }

}