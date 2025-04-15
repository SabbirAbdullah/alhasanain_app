import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:alhasanain_app/app/core/model/classRoutine_query_param.dart';
import 'package:alhasanain_app/app/data/model/classroutine_data.dart';
import 'package:alhasanain_app/app/data/repository/student_data_repository.dart';
import 'package:alhasanain_app/app/modules/home_mid/classroutine/model/class_routine_data_ui.dart';
import 'package:get/get.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../home/model/student_ui_data.dart';
import '../model/class_period_model.dart';
import '../model/routine_model.dart';

class ClassRoutineController extends BaseController {
  var demoDataUi = StudentDataResponseUi().obs;
  final StudentDataRepository _repository =
  Get.find(tag: (StudentDataRepository).toString());

  final RxList<ClassRoutineResponseUI> _githubProjectListController =
  RxList.empty();

  List<ClassRoutineResponseUI> get projectList =>
      _githubProjectListController.toList();

  final pagingController = PagingController<ClassRoutineResponseUI>();


  void getClassRoutine() {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;

    var queryParam = ClassRoutineQueryParam(
        className: 'Tamhid-1',
        section: 'D',
        session: '2024-2025');



    var githubRepoSearchService = _repository.getClassRoutine(queryParam);

    callDataService(
      githubRepoSearchService,
      onSuccess: _handleProjectListResponseSuccess,
    );

    pagingController.isLoadingPage = false;
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getClassRoutine();
  }

  onLoadNextPage() {
    logger.i("On load next");

    getClassRoutine();
  }

  void _handleProjectListResponseSuccess(ClassRoutineDataResponse response) {


    List<ClassRoutineResponseUI>? repoList = response.message
        ?.map((e) => ClassRoutineResponseUI(
      id: e.id != null ? e.id! : 0,
      subjectName: e.subjectName != null ? e.subjectName! : "Null",
      className: e.className != null ? e.className! : "",
      section: e.section != null ? e.section! : "",
      dayName: e.dayName != null ? e.dayName! : "",
      slotName: e.slotName != null ? e.slotName! : "",
      teacherID: e.teacherID != null ? e.teacherID! : "",
      teacherFname: e.teacherFname != null ? e.teacherFname! : "",
      session: e.session != null ? e.session! : "",
      teacherLname: e.teacherLname != null ? e.teacherLname! : "",
    ))
        .toList();

    if (_isLastPage(pagingController.pageNumber, 2)) {
      pagingController.appendLastPage(repoList!);
    } else {
      pagingController.appendPage(repoList!);
    }

    var newList = [...pagingController.listItems];

    _githubProjectListController(newList);


  }

  bool _isLastPage(int currentPage, int totalCount) {
    return currentPage >= totalCount;
  }
  final RxList<StudentDataResponseUi> _studentDataListController =
      RxList.empty();
  List<StudentDataResponseUi> get studentDataList =>
      _studentDataListController.toList();
  var periods = <Period>[].obs;
  var isLoading = false.obs;


  StudentDataResponseUi studentDataResponseUi= StudentDataResponseUi();

  Future<void> fetchPeriods(dynamic className, dynamic session, dynamic campus) async {
    isLoading.value = true;
    try {
      final data = await _repository.getClassPeriods(
          className ,
         session,
         campus,
      );
      periods.value = data;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  var routineDays = <RoutineDay>[].obs;

  void fetchRoutines(dynamic className, dynamic session, dynamic campus, dynamic sectionName) async {
    isLoading.value = true;
    try {
      final data = await _repository.getClassRoutines(
          className ,
         session,
         campus,
        sectionName,
      );
      routineDays.value = data;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }




  var combinedData = <dynamic>[].obs;

  // Future<void> fetchData(
  //     // Optional parameter
  //     ) async {
  //   isLoading.value = true;
  //   try {
  //     // Fetch periods
  //     final periodData = await _service.fetchPeriods(
  //         className: "Tamhid-1", session: "2024-2025", campus: "Boys Campus");
  //     // Fetch routines
  //     final routineData = "D" != null
  //         ? await _routineService.fetchRoutines(
  //             className: "Tamhid-1",
  //             session: "2024-2025",
  //             campus: "Boys Campus",
  //             sectionName: "D",
  //           )
  //         : <RoutineDay>[]; // Empty list if sectionName is null
  //
  //     // Combine data into a single list
  //     combinedData.value = [
  //       ...periodData, // Add periods
  //       ...routineData // Add routines
  //     ];
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
  }
}
