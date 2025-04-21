import 'package:alhasanain_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import '../../../data/model/exam_schedule__model.dart';
import '../../../data/repository/exam_schedule_repository.dart';
import '../../../data/repository/exam_schedule_repository_impl.dart';


class ExamScheduleController extends GetxController {



  final ExamScheduleRepositoryImpl _repository = Get.put(ExamScheduleRepositoryImpl()) ;
final HomeController homeController = Get.put(HomeController());
  var examSchedules = <ExamScheduleModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void fetchSchedule() async {
    try {
      isLoading.value = true;
      final data = await _repository.getExamSchedule(
        classId: homeController.studentDataList[0].cId!,

        session:  homeController.studentDataList[0].session!,
      );
      examSchedules.value = data as List<ExamScheduleModel>;

    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }


  final Rxn<ExamScheduleModel> latestSchedule = Rxn<ExamScheduleModel>();



}
