
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/student_data_response.dart';
import '../../../data/repository/pref_repository.dart';
import '../../../data/repository/student_data_repository.dart';
import '../../../modules/home/model/student_ui_data.dart';
import '../../base/base_controller.dart';

class NavDrawerController extends BaseController{

  var demoDataUi=StudentDataResponseUi().obs;
  final StudentDataRepository _repository=Get.find(tag: (StudentDataRepository).toString());

  final PrefRepository _prefRepository=Get.find(tag: (PrefRepository).toString());

  final RxList<StudentDataResponseUi> _studentDataListController=RxList.empty();

  List<StudentDataResponseUi> get studentDataList =>
      _studentDataListController.toList();

  getStudentData() async {
    var studentId=await _prefRepository.getString("id");
    var loginRepositoryService = _repository.getStudentData(studentId);
    callDataService(
        loginRepositoryService,
        onSuccess: _handleLoginSuccess,
        onError: _handleLoginError
    );



  }
  _handleLoginSuccess(List<StudentDataResponse>response){

    print("my response${response.length}");


    List<StudentDataResponseUi>? repoList = response
        .map((e) => StudentDataResponseUi(
      studentFirstName: e.studentFirstName != null ? e.studentFirstName! : "Null",
      studentLastName: e.studentLastName != null ? e.studentLastName! : "Null",
    )).toList();

    // if (_isLastPage(repoList!.length, response.totalCount!)) {
    //   pagingController.appendLastPage(repoList);
    // } else {
    //   pagingController.appendPage(repoList);
    // }
    //
    // var newList = [...pagingController.listItems];
    //
    _studentDataListController(repoList);

  }



  _handleLoginError(Exception e){

  }

}