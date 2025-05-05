import 'package:alhasanain_app/app/data/model/exam_schedule__model.dart';
import 'package:alhasanain_app/app/data/repository/exam_schedule_repository.dart';
import 'package:get/get.dart';

import '../remote/exam_schedule_data_impl.dart';


class ExamScheduleRepositoryImpl {
  final ExamScheduleApiService _apiService = ExamScheduleApiService();

  Future<List<ExamScheduleModel>> getExamSchedule({
    required int classId,

    required String  session,
  }) async {
    final data = await _apiService.fetchExamSchedule(
      classId: classId,
      session: session,
    );

    return data.map<ExamScheduleModel>((item) => ExamScheduleModel.fromJson(item)).toList();
  }
}
