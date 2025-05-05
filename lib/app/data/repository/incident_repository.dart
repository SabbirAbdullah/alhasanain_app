
import '../model/incident_model.dart';
import '../remote/incident_remote_date.dart';

class IncidentRepository {
  final IncidentRemoteDate _apiService = IncidentRemoteDate();

  Future<List<IncidentReportModel>> getIncidentReports({
    required String studentId,
    required String campus,
    required String session,
    String? startDate,
    String? endDate,
  }) {
    return _apiService.fetchIncidentReports(
      studentId: studentId,
      campus: campus,
      session: session,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
