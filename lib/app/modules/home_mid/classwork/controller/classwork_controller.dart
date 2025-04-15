import 'package:alhasanain_app/app/core/base/base_controller.dart';

import 'package:alhasanain_app/app/data/repository/student_data_repository.dart';
import 'package:get/get.dart';


import '../../../home/model/student_ui_data.dart';
import '../model/classwork_model.dart';

class ClassWorkController extends BaseController{
  final StudentDataRepository _repository =
  Get.find(tag: (StudentDataRepository).toString());
  StudentDataResponseUi studentDataResponseUi= StudentDataResponseUi();

  var classworks = <Classwork>[].obs;
  var isLoading = false.obs;
  var selectedDate = ''.obs;

  void fetchClassworks(String date) async {
    isLoading.value = true;
    try {
      final params = {
        "className": studentDataResponseUi.studentClass,
        "student_id": studentDataResponseUi.studentId,
        "section": studentDataResponseUi.section,
        "termName": term.value,
        "subject": "",
        "date": date,
        "session": studentDataResponseUi.session,
      };
      final data = await _repository.getClasswork(params);
      classworks.assignAll(data);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }




  RxString term = ''.obs;

  void checkTerm() {
    final now = DateTime.now();
    if (now.month >= 1 && now.month <= 6) {
      term.value = 'Final Term';
    } else if (now.month >= 7 && now.month <= 12) {
      term.value = 'Mid Term';
    }
  }




  @override
  void onInit() {
    checkTerm();
    var dataModel = Get.arguments;
    if (dataModel is StudentDataResponseUi) {
      studentDataResponseUi=dataModel;
    }
    super.onInit();
  }




}