import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:alhasanain_app/app/data/model/student_ct_data_response.dart';
import 'package:alhasanain_app/app/data/repository/student_data_repository.dart';
import 'package:get/get.dart';

import '../../../../core/base/paging_controller.dart';
import '../../../../core/model/student_ct_query_param.dart';
import '../../../home/model/student_ui_data.dart';
import '../model/ct_data_ui.dart';

class CTController extends BaseController {
  final StudentDataRepository _repository =
  Get.find(tag: (StudentDataRepository).toString());

  final RxList<StudentCTResponseUi> _githubProjectListController = RxList.empty();

  List<StudentCTResponseUi> get projectList => _githubProjectListController.toList();

  StudentDataResponseUi studentDataResponseUi = StudentDataResponseUi();
  StudentCTResponseUi studentCTResponseUi = StudentCTResponseUi();
  final pagingController = PagingController<StudentCTResponseUi>();
  // RxString term = ''.obs;
  //
  // void checkTerm() {
  //   final now = DateTime.now();
  //   if (now.month >= 1 && now.month <= 6) {
  //     term.value = 'Final Term';
  //   } else if (now.month >= 7 && now.month <= 12) {
  //     term.value = 'Mid Term';
  //   }
  // }
  final List<String> terms = ["Final Term","Mid Term",];
  RxString selectedTerm = ''.obs;
  // Dropdown items
  final List<String> items = ["CT - 1", "CT - 2",];

  RxString selectedItem = ''.obs;

  // Update selected item
  void updateSelectedItem(String value) {
    selectedItem.value = value;

  }

  void updateTerm(String value) {
    selectedTerm.value = value;

  }

  // Function to get subjects by CT title
  List<String?> getSubjectsByCT(String ctTitle) {
    // Find all items in the list where the title matches the selected CT title
    final matchingCTs = projectList.where((project) => project.title == ctTitle).toList();

    // Extract and return the list of subjects
    return matchingCTs.map((ct) => ct.subject).toList();
  }

  void getStudentCTList() {


    var queryParam = StudentCTQueryParam(
      className: "${studentDataResponseUi.studentClass}",
      section: "${studentDataResponseUi.section}",
      session: "${studentDataResponseUi.studentSession}",
      student_id: "${studentDataResponseUi.studentId}",
      termName: selectedTerm.value,
      title: selectedItem.value

    );

    var githubRepoSearchService = _repository.getCTData(queryParam);

    callDataService(
      githubRepoSearchService,
      onSuccess: _handleProjectListResponseSuccess,
    );

  }

  void _handleProjectListResponseSuccess(StudentCTDataResponse response) {
    List<StudentCTResponseUi>? repoList = response.message
        ?.map((e) => StudentCTResponseUi(
      termName: e.termName != null ? e.termName! : "Null",
      className: e.className != null ? e.className! : "",
      section: e.section != null ? e.section! : "",
      subject: e.subject != null ? e.subject! : "",
      title: e.title != null ? e.title! : "",
      date: e.date != null ? e.date! : "",
      obtainMarks: e.obtainMarks != null ? e.obtainMarks! : "",
      marks: e.marks != null ? e.marks! : "",
      session: e.session != null ? e.session! : "",
    ))
        .toList();
    projectList.clear();  // clear old data

    _githubProjectListController(repoList);

  }


  @override
  void onInit() {

    var dataModel = Get.arguments;
    if (dataModel is StudentDataResponseUi) {
      studentDataResponseUi = dataModel;

    }
    super.onInit();
  }
}
