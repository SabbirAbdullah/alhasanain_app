import 'package:alhasanain_app/app/data/repository/daily_lesson_repository.dart';
import 'package:get/get.dart';

import '../../modules/daily_lesson/model/day_model.dart';
import '../../modules/daily_lesson/model/weekly_model.dart';

class DailyLessonImpl extends DailyLessonRepository{

  final DailyLessonRepository _remoteSource =
  Get.find(tag: (DailyLessonRepository).toString());
  @override
  Future<WeeklyDateResponse> getDailyLesson( String term, int classId, int sectionId, String campus, String session) {
    return _remoteSource.getDailyLesson(term,classId,sectionId,campus,session);
    throw UnimplementedError();
  }

  @override
  Future <WeeklyScheduleResponse> getDailyScheduleById( int id ) {
    return _remoteSource.getDailyScheduleById(id);
    throw UnimplementedError();
  }

}