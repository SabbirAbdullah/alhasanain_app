import '../model/academic_calender.dart';
import '../remote/academic_calender_remote_data.dart';

class AcademicCalendarRepository {
  final AcademicCalendarApiService apiService= AcademicCalendarApiService();

  Future<List<AcademicEventModel>> getEvents(String month) async {
    final data = await apiService.fetchAcademicCalendar(month);
    return data.map((e) => AcademicEventModel.fromJson(e)).toList();
  }
}