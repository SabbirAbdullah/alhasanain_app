import 'package:alhasanain_app/app/network/dio_provider.dart';
import 'package:dio/dio.dart';
import '../model/incident_model.dart';


class IncidentRemoteDate {
  final Dio _dio = DioProvider.dioWithHeaderToken;

  Future<List<IncidentReportModel>> fetchIncidentReports({
    required String studentId,
    required String campus,
    required String session,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _dio.post(
        '/server/getIncidentReport',
        data: {
          "studentId": studentId,
          "campus": campus,
          "session": session,
          if (startDate != null) "startDate": startDate,
          if (endDate != null) "endDate": endDate,
        },
      );

      if (response.statusCode == 200 && response.data['message'] != null) {
        List data = response.data['message'];
        return data.map((e) => IncidentReportModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
