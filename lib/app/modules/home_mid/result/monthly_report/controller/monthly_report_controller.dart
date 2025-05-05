import 'package:get/get.dart';

import '../../../../../data/model/month_progress_model.dart';
import '../../../../../data/model/month_report_model.dart';
import '../../../../../data/repository/result_repository.dart';

class MonthlyReportController extends GetxController {
  final ResultRepository _repository = ResultRepository();

    List<String> terms = ["Mid Term", "Final Term"].obs;
  var selectedTerm = "".obs;
  var selectedFromDate = ''.obs;
  var selectedToDate = ''.obs;
  var monthlyProgressList = <MonthlyProgressModel>[].obs;
  var selectedProgress = Rxn<MonthlyProgressModel>();

  void fetchMonthlyProgress({
    required String className,
    required String campus,
    required String session,
    required String studentId,
    required String startDate,
    required String endDate,
  }) async {
    if (selectedTerm.value.isEmpty) return;

    try {
      var result = await _repository.fetchMonthlyProgress(
        className: className,
        campus: campus,
        session: session,
        term: selectedTerm.value,
      );
      monthlyProgressList.value = result;
      if (result.isNotEmpty &&
          result.first.publish.toLowerCase() == 'publish') {
        await fetchMonthlyReport(
          className: className,
          section: session,
          campus: campus,
          studentId :studentId ,
          startDate:startDate,
          endDate: endDate,
        );
      }else {
        Get.snackbar('Info', 'Result not published yet!');
        monthlyProgressList.value = []; // Clear previous result
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void selectProgress(MonthlyProgressModel progress) {
    selectedProgress.value = progress;
  }

  var reports = <MonthlyReportModel>[].obs;
  var isLoading = false.obs;

  Future<void> fetchMonthlyReport({
    required String className,
    required String section,
    required String campus,
    required String studentId,
    required String startDate,
    required String endDate,
  }) async {
    try {
      isLoading.value = true;
      reports.value = await _repository.getMonthlyReport(
        className: className,
        section: section,
        campus: campus,
        studentId: studentId,
        startDate: startDate,
        endDate: endDate,
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
