import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:alhasanain_app/app/data/model/student_homework_data_response.dart';
import 'package:alhasanain_app/app/data/repository/student_data_repository.dart';
import 'package:get/get.dart';

import '../../../home/model/student_ui_data.dart';

import '../model/homework_model.dart';


class HomeWorkListController extends BaseController{
  final StudentDataRepository _repository =
  Get.find(tag: (StudentDataRepository).toString());
  StudentDataResponseUi studentDataResponseUi= StudentDataResponseUi();

  var homeworks = <Homework>[].obs;
  var isLoading = false.obs;
  var selectedDate = ''.obs;

  void fetchHomeworks(String date) async {
    isLoading.value = true;
    try {
      final params = {
        "className": studentDataResponseUi.studentClass ,
        "student_id": studentDataResponseUi.studentId,
        "section": studentDataResponseUi.section,
        "termName": term.value,
        "subject": "",
        "date": date,
        "session": studentDataResponseUi.session,
      };
      final data = await _repository.getHomework(params);
      homeworks.assignAll(data);
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
    String today = "${DateTime.now().day.toString().padLeft(2, '0')}-"
        "${DateTime.now().month.toString().padLeft(2, '0')}-"
        "${DateTime.now().year}";

    selectedDate.value = today;
    fetchHomeworks(today);
    var dataModel = Get.arguments;
    if (dataModel is StudentDataResponseUi) {
      studentDataResponseUi=dataModel;
    }
    super.onInit();
  }



}