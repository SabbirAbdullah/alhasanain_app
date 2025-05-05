import 'package:alhasanain_app/app/network/dio_provider.dart';
import 'package:dio/dio.dart';

class AcademicCalendarApiService {
  final Dio _dio = DioProvider.dioWithHeaderToken;

  Future<List<dynamic>> fetchAcademicCalendar(String month) async {
    const String url = '/server/student/getStudentAcademicCalendarNew';

    try {
      final response = await _dio.post(
        url,
        data: {
          "month": month,

        },
      );

      if (response.statusCode == 200 && response.data['ok'] == true) {
        return response.data['data'];
      } else {
        throw Exception("Failed to load calendar");
      }
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }
}
