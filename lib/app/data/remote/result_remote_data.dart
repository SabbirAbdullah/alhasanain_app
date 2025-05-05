import 'package:alhasanain_app/app/network/dio_provider.dart';
import 'package:dio/dio.dart';



import 'package:dio/dio.dart';
import '../model/month_progress_model.dart';
import '../model/month_report_model.dart';
import '../model/result_publish_info_model.dart';
import '../model/term_report_model.dart';

class ResultService {
  final Dio _dio = DioProvider.dioWithHeaderToken;

  Future<ResultPublishInfoModel> getResultPublishInfo(Map<String, dynamic> body) async {
    final response = await _dio.post(
      '/server/getResultPublishInfo',
      data: body,
    );
    return ResultPublishInfoModel.fromJson(response.data);
  }

  Future<TermReportModel> getTermReport(Map<String, dynamic> body) async {
    final response = await _dio.post(
      '/server/getTermReport',
      data: body,
    );
    return TermReportModel.fromJson(response.data);
  }


  Future<List<MonthlyProgressModel>> getMonthlyProgressReport({
    required String className,
    required String campus,
    required String session,
    required String term,
  }) async {
    final response = await _dio.post(
      '/server/getMonthlyProgressReport',
      data: {
        "class_name": className,
        "campus": campus,
        "session": session,
        "term": term,
      },
    );

    if (response.statusCode == 200 && response.data['ok'] == true) {
      List data = response.data['message'];
      return data.map((e) => MonthlyProgressModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch monthly progress report');
    }
  }



  Future<List<dynamic>> fetchMonthlyReport({
    required String className,
    required String section,
    required String campus,
    required String studentId,
    required String startDate,
    required String endDate,
  }) async {
    const url = '/server/getMonthlyReportAll';

    final body = {
      "className": className,
      "section": section,
      "campus": campus,
      "studentId": studentId,
      "startDate": startDate,
      "endDate": endDate,
    };

    final response = await _dio.post(url, data: body);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load monthly report');
    }
  }

}

