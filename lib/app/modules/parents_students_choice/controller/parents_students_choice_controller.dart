import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:alhasanain_app/app/data/repository/parents_repository.dart';
import 'package:alhasanain_app/app/modules/parents_students_choice/model/parents_student_list_ui_data.dart';
import 'package:get/get.dart';

import '../../../core/base/paging_controller.dart';
import '../../../data/model/parents_student_list_response.dart';
import '../../../data/repository/pref_repository.dart';

class ParentsStudentChoiceController extends BaseController{
  final PrefRepository _prefRepository=
  Get.find(tag: (PrefRepository).toString());
  final ParentsRepository _repository =
  Get.find(tag: (ParentsRepository).toString());

  final RxList<ParentsStudentsUiData> _githubProjectListController =
  RxList.empty();

  String id='';
  List<ParentsStudentsUiData> get projectList =>
      _githubProjectListController.toList();

  final pagingController = PagingController<ParentsStudentsUiData>();

  Future<void> getStudentParents() async {

    if (!pagingController.canLoadNextPage()) return;
    pagingController.isLoadingPage = true;
     String phoneNumber = await _prefRepository.getString('phoneParents');
     if(id!=''){
       phoneNumber=id;
     }
    var githubRepoSearchService = _repository.getParentsStudentList(phoneNumber);

    callDataService(
      githubRepoSearchService,
      onSuccess: _handleProjectListResponseSuccess,
    );

    pagingController.isLoadingPage = false;
  }


  void setStudentId(String studentId)async{
     await _prefRepository.setString("id", studentId);
  }
  void _handleProjectListResponseSuccess(ParetnsStudentListResponse response) {

    List<ParentsStudentsUiData>? repoList = response.message
        ?.map((e) => ParentsStudentsUiData(
        studentId: e.studentId!=null? e.studentId!:"",
      parentsName: e.parentsName!=null? e.parentsName!:"",
      id: e.id!=null? e.id!:0,
      studentLastName: e.studentLastName!=null? e.studentLastName!:"",
      phone: e.phone!=null? e.phone!:"",
      studentFirstName: e.studentFirstName!=null? e.studentFirstName!:"",
    )).toList();
    pagingController.appendPage(repoList!);
    var newList = [...pagingController.listItems];
    _githubProjectListController(newList);
  }


  @override
  void onInit() {
    var data = Get.arguments;
    if (data is String) {
      id=data;
    }
    super.onInit();
  }
}