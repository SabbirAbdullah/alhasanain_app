

import 'package:alhasanain_app/app/core/model/student_attendence_query_param.dart';
import 'package:alhasanain_app/app/data/model/student_attendence_data_response.dart';
import 'package:alhasanain_app/app/modules/home/model/student_ui_data.dart';
import 'package:alhasanain_app/app/modules/home_mid/attendence/model/attendence_data_ui.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../../data/repository/student_data_repository.dart';
import '../../CT/model/ct_data_ui.dart';

class AttendenceController extends BaseController{

  final StudentDataRepository _repository =
  Get.find(tag: (StudentDataRepository).toString());

  final RxList<StudentAttendenceResponseUI> _githubProjectListController =
  RxList.empty();

  List<StudentAttendenceResponseUI> get projectList =>
      _githubProjectListController.toList();

  final pagingController = PagingController<StudentAttendenceResponseUI>();
  DateTime now = DateTime.now();
  String formattedDate = "";
  StudentDataResponseUi studentDataResponseUi=StudentDataResponseUi();


  void getDateAttendence(String date) {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;

    var queryParam = StudentAttendenceQueryParam(
      section: "",
      session: "",
      termName: "",
      creatorID: "",
      creatorName: "",
      Class: "",
      attendance: "",
      studentId: studentDataResponseUi.studentId,
      school: "",
      studentName: "",
      date:date,
      pageNumber: pagingController.pageNumber,

    );

    var githubRepoSearchService = _repository.getAttandanceData(queryParam);

    callDataService(
      githubRepoSearchService,
      onSuccess: _handleDatetListResponseSuccess,
    );

    pagingController.isLoadingPage = false;
  }


  void getAttendence(String date) {


    var queryParam = StudentAttendenceQueryParam(
        section: "",
        session: "",
        termName: "",
        creatorID: "",
        creatorName: "",
        Class: "",
        attendance: "",
        studentId: studentDataResponseUi.studentId,
        school: "",
        studentName: "",
         date:date,


    );

    var githubRepoSearchService = _repository.getAttandanceData(queryParam);

    callDataService(
      githubRepoSearchService,
      onSuccess: _handleProjectListResponseSuccess,
    );

  }

  onRefreshPage() {
    pagingController.initRefresh();
    getAttendence(formattedDate);
  }

  onLoadNextPage() {
    logger.i("On load next");

    getAttendence(formattedDate);
  }

  void _handleProjectListResponseSuccess(StudentAttandanceDataResponse response) {

    List<StudentAttendenceResponseUI>? repoList = response.message
        ?.map((e) => StudentAttendenceResponseUI(
      date: e.date != null ? e.date! : "",
        attendance: e.attendance?.toString() ?? "",
      studentId: e.studentId!=null? e.studentId:""

    ))
        .toList();



    _githubProjectListController(repoList);


  }

  bool _isLastPage(int currentPage, int totalCount) {
    return currentPage >= totalCount;
  }



@override
void onInit() {
  var dataModel = Get.arguments;
  if (dataModel is StudentDataResponseUi) {
    studentDataResponseUi=dataModel;
     formattedDate=DateFormat('yyyy-MM').format(now);
    getAttendence(formattedDate);
  }
  super.onInit();
}


  // _handleDatetListResponseSuccess(StudentAttandanceDataResponse response) {
  //   List<StudentAttendenceResponseUI>? repoList = response.message
  //       ?.map((e) => StudentAttendenceResponseUI(
  //       date: e.date != null ? e.date! : "",
  //       attendance: e.attendance!=null? e.attendance:"",
  //       studentId: e.studentId!=null? e.studentId:""
  //
  //   ))
  //       .toList();
  //
  //   _githubProjectListController(repoList);
  // }


  _handleDatetListResponseSuccess(StudentAttandanceDataResponse response) {
    List<StudentAttendenceResponseUI>? repoList = response.message
        ?.map((e) => StudentAttendenceResponseUI(
      date: e.date ?? "",
      attendance: e.attendance?.toString() ?? "",
      studentId: e.studentId ?? "",
    ))
        .toList();


    _githubProjectListController(repoList);
  }


}