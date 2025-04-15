import 'package:alhasanain_app/app/data/remote/daily_lesson_data_source.dart';
import '../../modules/daily_lesson/model/day_model.dart';
import '../../modules/daily_lesson/model/weekly_model.dart';
import '../../network/dio_provider.dart';
import '../../core/base/base_remote_source.dart';


class DailyLessonDataImpl extends BaseRemoteSource
    implements DailyLessonDataSource {
  @override
  Future<WeeklyDateResponse> getDailyLesson(String term, int classId,
      int sectionId, String campus, String session) async {
    var endpoint = "${DioProvider.baseUrl}/server/getWeeklyDates";
    final dioCall = await dioClient.post(
      endpoint,
      data: {
        'term': term,
        'classId': classId,
        'sectionId': sectionId,
        'campus': campus,
        'session': session,
      },
    );

    if (dioCall.statusCode == 200) {
      return WeeklyDateResponse.fromJson(dioCall.data);
    } else {
      throw Exception('Failed to load weekly dates');
    }
  }
  @override
  Future<WeeklyScheduleResponse> getDailyScheduleById(int id) async {
    var endpoint =
        "${DioProvider.baseUrl}/server/getWeeklyScheduleById";
    final dioCall = await dioClient.post(
      endpoint,
      data: {
        'id': id,
      },
    );

    if (dioCall.statusCode == 200) {
      return WeeklyScheduleResponse.fromJson(dioCall.data[0]);
    } else {
      throw Exception('Failed to load daily schedule');
    }
  }


}