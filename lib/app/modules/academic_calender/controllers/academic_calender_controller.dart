import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:get/get.dart';

import '../../../data/model/student_academic_calender_response.dart';
import '../../../data/repository/student_data_repository.dart';
import '../model/academic_ui_data.dart';

class AcademicCalenderController extends BaseController{
  final StudentDataRepository _repository = Get.find(tag: (StudentDataRepository).toString());


  final RxList<AcademicCalenderUiData> _getAcademicCalenderData =
  RxList.empty();

  List<AcademicCalenderUiData> get academicCalender =>
      _getAcademicCalenderData.toList();


  getMonthAcademicEvents(String month){
    var monthlyCallService=_repository.getCalenderResponse(month);
    callDataService(monthlyCallService,onSuccess: _monthlyEventSuccess);
  }

  _monthlyEventSuccess(AcademicCalenderResponse response) {

    List<AcademicCalenderUiData>? repoList = response.message
        ?.map((e) => AcademicCalenderUiData(
      title: e.title != null ? e.title! : "Null",
      start: e.start != null ? e.start! : "Null",
      eventType: e.eventType != null ? e.eventType! : "",
      end: e.end != null ? e.end! : "",
      hostUserName: e.hostUserName != null ? e.hostUserName! : "",
      purpose: e.purpose != null ? e.purpose! : "",


    ))
        .toList();




    _getAcademicCalenderData(repoList);
  }


}