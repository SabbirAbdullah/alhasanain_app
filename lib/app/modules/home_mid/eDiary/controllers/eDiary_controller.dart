import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:alhasanain_app/app/core/model/diary_query_prem.dart';
import 'package:alhasanain_app/app/data/model/student_dairy_response.dart';
import 'package:alhasanain_app/app/data/model/subject_list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/base/paging_controller.dart';
import '../../../../data/repository/student_data_repository.dart';
import '../../../home/model/student_ui_data.dart';
import '../model/eDairyUi.dart';

class EDairyController extends BaseController{

  final dateTextETController=TextEditingController();
  late DateTime selectedDate = DateTime.now();
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  String formattedDate = "";



  final StudentDataRepository _repository =
  Get.find(tag: (StudentDataRepository).toString());
  final RxList<EDairyUi> _githubProjectListController =
  RxList.empty();
  List<EDairyUi> get projectList =>
      _githubProjectListController.toList();

  final pagingController = PagingController<EDairyUi>();
  StudentDataResponseUi studentDataResponseUi=StudentDataResponseUi();

  RxList<String>subjectList=<String>[].obs;


  void getSubjectList(String className){
    var subjectCallRepo=_repository.getStudentSubjects(className);

    callDataService(subjectCallRepo,onSuccess:_saveSubjectList );
  }

  clearDiaryData(){
    _githubProjectListController.clear();
    getStudentEDairyData();
  }
  getStudentEDairyData() async {
    if (!pagingController.canLoadNextPage()) {
      print('Cannot load next page');
      return;
    }

    pagingController.isLoadingPage = true;
    print('Starting to load data');

    try {
      var formattedMonth = DateFormat('yyyy-MM').format(selectedDate);
      var formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

      var queryParam = DairyQueryPrem(
        className: "${studentDataResponseUi.studentClass}",
        section: "${studentDataResponseUi.section}",
        session: "${studentDataResponseUi.studentSession}",
        studentId: "${studentDataResponseUi.studentId}",
        month: formattedMonth,
        date: formattedDate,
      );

      var githubRepoSearchService = _repository.getStudentDairy(queryParam);

      await callDataService(
        githubRepoSearchService,
        onSuccess: _handleProjectListResponseSuccess,
      );

      print('Data loaded successfully');
    } catch (e) {
      print('Error loading data: $e');
    } finally {
      pagingController.isLoadingPage = false;
    }
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getStudentEDairyData();
  }

  onLoadNextPage() {
    logger.i("On load next");

    getStudentEDairyData();
  }

  void _handleProjectListResponseSuccess(StudentDiaryResponse response) {


    List<EDairyUi>? repoList = response.message
        ?.map((e) => EDairyUi(

      title: e.subject != null ? e.subject! : "",
      description: e.note !=null ? e.note! :"",
      date: e.date !=null ? e.date! :"",


    ))
        .toList();

    if (_isLastPage(pagingController.pageNumber, 1)) {
      pagingController.appendLastPage(repoList!);
    } else {
      pagingController.appendPage(repoList!);
    }

    var newList = [...pagingController.listItems];

    _githubProjectListController(newList);

    getSubjectList(studentDataResponseUi.studentClass);
  }

  bool _isLastPage(int currentPage, int totalCount) {
    return currentPage >= totalCount;
  }

  _saveSubjectList(SubjectListResponse response) {
    response.message?.forEach((element) {
      subjectList.add("${element.subjectName}");
    });
  }



  @override
  void onInit() {
    var dataModel = Get.arguments;
    if (dataModel is StudentDataResponseUi) {
      studentDataResponseUi=dataModel;
      getStudentEDairyData();

    }
    super.onInit();
  }



}