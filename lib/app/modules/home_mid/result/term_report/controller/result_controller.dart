import 'package:get/get.dart';

import '../../../../../data/model/result_publish_info_model.dart';
import '../../../../../data/model/term_report_model.dart';
import '../../../../../data/repository/result_repository.dart';
import '../../../../home/model/student_ui_data.dart';




class ResultController extends GetxController {
  final ResultRepository _repository = ResultRepository();

  var selectedTerm = ''.obs; // To hold the selected term
  var isLoading = false.obs;
  var terms = ["Mid Term", "Final term"].obs;

  StudentDataResponseUi studentDataResponseUi = StudentDataResponseUi();

  var resultPublishInfo = Rxn<ResultPublishInfoModel>();
  var termReportModel = Rx<TermReportModel?>(null);


  /// Main function to check result publish status
  Future<void> checkResultStatus({
    required String className,
    required String sectionName,
    required String session,
    required String resultFor,
    required String studentId,
    required String campus,
  }) async {
    isLoading.value = true;

    try {
      final body = {
        'className': className,
        'sectionName': sectionName,
        'session': session,
        'campus': campus,
        'resultFor': resultFor,
        'type': 'Term',
      };

      final result = await _repository.fetchResultPublishInfo(body);
      resultPublishInfo.value = result;

      // Check if the result is published
      if (result.message.isNotEmpty &&
          result.message.first.status.toLowerCase() == 'publish') {
        await fetchTermReport(
          className: result.message.first.className,
          sectionName: result.message.first.sectionName,
          campus: result.message.first.campus,
          session: result.message.first.session,
          term: result.message.first.resultFor,
          studentId: studentId,
        );
      } else {
        Get.snackbar('Info', 'Result not published yet!');
        termReportModel.value = null; // Clear previous result
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Function to fetch detailed term report if published
  Future<void> fetchTermReport({
    required String className,
    required String sectionName,
    required String campus,
    required String session,
    required String term,
    required String studentId,
  }) async {
    try {
      final body = {
        'className': className,
        'sectionName': sectionName,
        'campus': campus,
        'session': session,
        'term': term,
        'studentId': studentId,
      };

      final report = await _repository.fetchTermReport(body);
      termReportModel.value = report;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch report: ${e.toString()}');
    }
  }
}

