import 'package:get/get.dart';
import '../../../data/remote/daily_lesson_data_impl.dart';
import '../model/day_model.dart';
import '../model/weekly_model.dart';

class WeeklyDatesController extends GetxController {
  // final ApiProvider apiProvider = Get.put(ApiProvider());
  final DailyLessonDataImpl repository = Get.put(DailyLessonDataImpl());
  var weeklyDates = <WeeklyDate>[].obs;
  var selectedWeek = Rxn<WeeklyDate>();
  var isLoading = true.obs;
  var dailyScheduleResponse = Rxn<WeeklyScheduleResponse>();
  final filteredWeeks = <WeeklyDate>[].obs;
  final selectedMonth = Rxn<int>();

  Future<void> fetchWeeklyDates(String term, int classId, int sectionId, String campus, String session) async {
    isLoading(true);
    try {
      final response = await repository.getDailyLesson(term, classId, sectionId, campus, session);
      weeklyDates.value = response.message;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  void filterWeeksByMonth(int month) {
    selectedMonth.value = month;
    filteredWeeks.value = weeklyDates.where((week) {
      final startMonth = DateTime.parse(week.startDate).month;
      final endMonth = DateTime.parse(week.endDate).month;
      return startMonth == month || endMonth == month;
    }).toList();
  }

  Future<void> fetchDailySchedule(int weekId) async {
    isLoading(true);
    try {

      dailyScheduleResponse.value = await repository.getDailyScheduleById(weekId);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
    }
  }

