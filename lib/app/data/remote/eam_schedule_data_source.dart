import '../../modules/daily_lesson/model/day_model.dart';
import '../../modules/daily_lesson/model/weekly_model.dart';
import '../model/exam_schedule__model.dart';

abstract class EamScheduleDataSource{
  Future<List<dynamic>>getExamSchedule( int classId, String term,  String session);

}