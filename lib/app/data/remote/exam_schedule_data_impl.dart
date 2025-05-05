import 'package:dio/dio.dart';

import '../../core/base/base_remote_source.dart';
import '../../network/dio_provider.dart';
import 'eam_schedule_data_source.dart';

class ExamScheduleApiService {
   final Dio _dio = DioProvider.dioWithHeaderToken;

  Future<List<dynamic>> fetchExamSchedule({
     required int classId,

      required String session,
  }) async {

    try {
      final response = await _dio.post("/server/getExamSchedule", data: {
        "classId": classId,
        "session": session,
      });

      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        throw Exception('Failed to load exam schedule');
      }
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }
}
