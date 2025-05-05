import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/model/incident_model.dart';
import '../../../data/repository/incident_repository.dart';


class IncidentController extends GetxController {
  final IncidentRepository _repository = IncidentRepository();
  RxString selectedDateRange = ''.obs;
  var incidentList = <IncidentReportModel>[].obs;
  var isLoading = false.obs;

  DateTime? startDate;
  DateTime? endDate;

  Future<void> fetchIncidentReports({
    required String studentId,
    required String campus,
    required String session,
  }) async {
    try {
      isLoading(true);
      final reports = await _repository.getIncidentReports(
        studentId: studentId,
        campus: campus,
        session: session,
        startDate: startDate != null ? DateFormat('yyyy-MM-dd').format(startDate!) : null,
        endDate: endDate != null ? DateFormat('yyyy-MM-dd').format(endDate!) : null,
      );

      // 🔥 Filter: Keep only where parents == 1
      final filteredReports = reports.where((incident) => incident.parents == 1).toList();

      incidentList.assignAll(filteredReports);

    } catch (e) {
      print('Error fetching incidents: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> pickDateRange(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      selectedDateRange.value =
      "${picked.start.toIso8601String().split('T').first} - ${picked.end.toIso8601String().split('T').first}";
      // Optionally you can store start and end separately too
    }
  }

}
