
import '../model/month_progress_model.dart';
import '../model/month_report_model.dart';
import '../model/result_publish_info_model.dart';
import '../model/term_report_model.dart';
import '../remote/result_remote_data.dart';
import 'package:dio/dio.dart';


class ResultRepository {
  final ResultService _service = ResultService();

  Future<ResultPublishInfoModel> fetchResultPublishInfo(Map<String, dynamic> body) {
    return _service.getResultPublishInfo(body);
  }

  Future<TermReportModel> fetchTermReport(Map<String, dynamic> body) {
    return _service.getTermReport(body);
  }
///monthReport
  Future<List<MonthlyProgressModel>> fetchMonthlyProgress({
    required String className,
    required String campus,
    required String session,
    required String term,
  }) {
    return _service.getMonthlyProgressReport(
      className: className,
      campus: campus,
      session: session,
      term: term,
    );
  }

  Future<List<MonthlyReportModel>> getMonthlyReport({
    required String className,
    required String section,
    required String campus,
    required String studentId,
    required String startDate,
    required String endDate,
  }) async {
    final response = await _service.fetchMonthlyReport(
      className: className,
      section: section,
      campus: campus,
      studentId: studentId,
      startDate: startDate,
      endDate: endDate,
    );

    return (response as List)
        .map((e) => MonthlyReportModel.fromJson(e))
        .toList();
  }
}

