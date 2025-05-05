import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:alhasanain_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/model/academic_calender.dart';
import '../../../data/model/student_academic_calender_response.dart';
import '../../../data/repository/academic_calender_repository.dart';
import '../../../data/repository/student_data_repository.dart';
import '../../home/model/student_ui_data.dart';
import '../model/academic_ui_data.dart';

class AcademicCalenderController extends BaseController{
  final StudentDataRepository _repository = Get.find(tag: (StudentDataRepository).toString());

  final AcademicCalendarRepository repository = AcademicCalendarRepository();
final HomeController homeController = Get.put(HomeController());

  var isLoading = false.obs;


  var events = <AcademicEventModel>[].obs;
  var selectedMonth = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    fetchEventsForMonth(selectedMonth.value);
    print("${selectedMonth}");// fetch initially current month
  }

  void fetchEventsForMonth(DateTime date) async {
    try {
      final month = DateFormat('yyyy-MM').format(date);
      final data = await repository.getEvents(month);
      final filteredEvents = _filterEventsByClassType(data);
      events.assignAll(filteredEvents);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch academic calendar");
    }
  }

  void onMonthChanged(DateTime visibleDate) {
    final newMonth = DateFormat('yyyy-MM').format(visibleDate);
    final currentMonth = DateFormat('yyyy-MM').format(selectedMonth.value);
    if (newMonth != currentMonth) { // ✅ fetch only if month changed
      selectedMonth.value = visibleDate;
      fetchEventsForMonth(visibleDate);
    }
  }
  // void fetchEventsForMonth(DateTime date) async {
  //   try {
  //
  //     final data = await repository.getEvents(date);
  //     final filteredEvents = _filterEventsByClassType(data);
  //     events.assignAll(filteredEvents);
  //
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to fetch academic calendar");
  //   }
  // }
  //
  // void onMonthChanged(DateTime visibleDate) {
  //   fetchEventsForMonth(visibleDate);
  // }
  // void fetchAcademicEvent(month) async {
  //   try {
  //     isLoading.value = true;
  //
  //     final data = await repository.getEvents(formattedMonth);
  //     final filteredEvents = _filterEventsByClassType(data); // Assuming this method exists
  //     events.assignAll(filteredEvents);
  //   } catch (e) {
  //     print('Error fetching events: $e');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }


  List<AcademicEventModel> _filterEventsByClassType(List<AcademicEventModel> allEvents) {
    final studentClass = homeController.studentDataList[0].studentClass;
    if (studentClass.startsWith("Hifz")) {
      return allEvents.where((e) =>
      e.eventType == "Hifz" || e.eventType == "Academic").toList();
    } else {
      return allEvents.where((e) =>
      e.eventType == "General" || e.eventType == "Academic").toList();
    }
  }

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