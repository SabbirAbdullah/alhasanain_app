
import 'package:alhasanain_app/app/modules/daily_lesson/model/weekly_model.dart';

import '../../modules/daily_lesson/model/day_model.dart';

abstract class DailyLessonRepository {
  Future<WeeklyDateResponse>getDailyLesson(String term, int classId, int sectionId, String campus, String session);
  Future<WeeklyScheduleResponse>getDailyScheduleById(int id);
}