import 'package:alhasanain_app/app/core/base/base_controller.dart';
import 'package:alhasanain_app/app/core/model/event_news_query_pram.dart';
import 'package:alhasanain_app/app/data/model/student_event_news.dart';
import 'package:alhasanain_app/app/data/remote/daily_lesson_data_impl.dart';
import 'package:alhasanain_app/app/data/repository/student_data_repository.dart';
import 'package:alhasanain_app/app/core/widget/event&news/models/event_%20news_ui_data.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/model/exam_schedule__model.dart';
import '../../../data/model/notification_model.dart';
import '../../../data/model/student_data_response.dart';
import '../../../data/remote/notification_remote_data.dart';
import '../../../data/repository/exam_schedule_repository_impl.dart';
import '../../../data/repository/notification_repository.dart';
import '../../../data/repository/pref_repository.dart';
import '../../../data/repository/student_payment_repository.dart';
import '../../daily_lesson/model/day_model.dart';
import '../../daily_lesson/model/weekly_model.dart';
import '../model/student_ui_data.dart';

class HomeController extends BaseController {
  var demoDataUi = StudentDataResponseUi().obs;
  final StudentDataRepository _repository = Get.find(tag: (StudentDataRepository).toString());
  final PrefRepository _prefRepository =
      Get.find(tag: (PrefRepository).toString());
  String id = '';
  final RxList<StudentDataResponseUi> _studentDataListController =
      RxList.empty();
  List<StudentDataResponseUi> get studentDataList =>
      _studentDataListController.toList();
  final StudentPaymentRepository _paymentRepository =
  Get.find(tag: (StudentPaymentRepository).toString());

  final RxList<EventNewsUiData> _eventNewsListController = RxList.empty();

  List<EventNewsUiData> get eventNewsDataList =>
      _eventNewsListController.toList();
  /////
  var dailyScheduleResponse = Rxn<WeeklyScheduleResponse>();
  final DailyLessonDataImpl repository = Get.put(DailyLessonDataImpl());
  final ExamScheduleRepositoryImpl _scheduleRepository = Get.put(ExamScheduleRepositoryImpl());
  var latestExamSchedules = <ExamScheduleModel>[].obs;

  final NotificationRepository _notificationRepository= Get. put(NotificationRepository());
  Rx<String> userType = ''.obs;
  var isLoading = true.obs;

  final String todayDay = DateFormat('EEEE').format(DateTime.now());
  var hasError = false.obs;

  var subjects = <Subject>[].obs;

  RxString term = ''.obs;

  void checkTerm() {
    final now = DateTime.now();
    if (now.month >= 1 && now.month <= 6) {
      term.value = 'Final Term';
    } else if (now.month >= 7 && now.month <= 12) {
      term.value = 'Mid Term';
    }
  }
  Future<List<Subject>?> fetchStudentAndWeeklyData() async {
    isLoading.value = true;
    var studentId = await _prefRepository.getString("id");
    if (id != '') {
      studentId = id;
    }
    try {
      // Step 1: Fetch student data
      List<StudentDataResponse> studentDataList = await _repository.getStudentData(studentId);

      if (studentDataList.isNotEmpty) {
        final studentData = studentDataList.first;
        String session = studentData.session!;
        int classId = studentData.cId!;
        int sectionId = studentData.secId!;
        String campus = studentData.campus!;

        // Step 2: Fetch weekly data using the extracted parameters
        WeeklyDateResponse weeklyResponse = await repository.getDailyLesson(
          term.value,
           classId,
          sectionId,
           campus,
          session,
        );
        //step : 3
        String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
        for (var week in weeklyResponse.message) {
          if (week.dates.contains(todayDate)) {

            //step :4
            WeeklyScheduleResponse scheduleResponse = (await repository.getDailyScheduleById(week.id));

            //step 5
            String todayDay = DateFormat('EEEE').format(DateTime.now()); // Get the current day (e.g., Monday)

            for (var daySchedule in scheduleResponse.days) {
              if (daySchedule.day == todayDay) {
                //  print('Match found for today\'s day: $todayDay');
                // print('Subjects for today: ${daySchedule.subjects.map((e) => e.subject).toList()}');
                return daySchedule.subjects;
              }
            }
          }
        }
        print('No match found for today\'s date');
        return null;

        print('Weekly Data: ${weeklyResponse.message[1].dates}');
      }
    } catch (e) {
      print('Error in combined data fetch: $e');
      return null;
    }
    isLoading.value = false;
    return null;
  }

  fetchSubjectsForToday()  async {
    hasError.value = false;

    try {
      List<Subject>? fetchedSubjects = await fetchStudentAndWeeklyData() as List<Subject>?;
      if (fetchedSubjects != null) {
        subjects.value = fetchedSubjects;
        print(subjects);
      }
    } catch (e) {
      hasError.value = true;
      print('Error fetching subjects: $e');
    } finally {
      isLoading.value = false;
    }
  }



  var notifications = <NotificationItem>[].obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;

  var unseenCount = 0.obs;



   fetchNotifications({required int page}) async {

    try {
      isLoading(true);
      final response = await _notificationRepository.fetchNotifications(studentId: studentDataList[0].studentId, page: page);
      notifications.assignAll(response.notifications);
      currentPage.value = response.currentPage;
      totalPages.value = response.totalPages;
      updateUnseenCount();
    } catch (e) {
      print('Error fetching notifications: $e');
    } finally {
      isLoading(false);
    }
  }

  void updateUnseenCount() {
    unseenCount.value = notifications.where((n) => !n.readMsg).length;
  }

  Future<void> markAsRead(NotificationItem notification) async {
    if (!notification.readMsg) {
      final success = await _notificationRepository.markNotificationAsRead(notification.id);
      if (success) {
        notification.readMsg = true;
        updateUnseenCount();
        notifications.refresh(); // update the UI
      }
    }
  }

  void changePage(int page) {
    if (page > 0 && page <= totalPages.value) {
      fetchNotifications(page: page);
    }
  }

  void fetchExamSchedule() async {
    try {
      isLoading.value = true;

      var  data = await _scheduleRepository.getExamSchedule(
        classId: studentDataList[0].cId!,
        session: studentDataList[0].session!,
      );

      if (data.isNotEmpty) {
        if (data.length == 1) {
          latestExamSchedules.value = [data.first];
        } else {
          // Find the latest one by date
          data.sort((a, b) => b.date!.compareTo(a.date!)); // Descending
          latestExamSchedules.value = [data.first];
          print(" ${latestExamSchedules}");// Take the most recent
        }
      } else {
        latestExamSchedules.clear(); // No data
      }

    } catch (e) {
     print(e);
    } finally {
      isLoading.value = false;
    }
  }
  //

  getEventNewsData(String session, String className) async {
    EventNewsQueryPrem eventNewsQueryPrem =
        EventNewsQueryPrem(session: session, className: className, limit: 5, page: 1);

    var eventNewsRepoService = _repository.getEventNewsData(eventNewsQueryPrem);
    callDataService(eventNewsRepoService,
        onSuccess: _handleEventNewsServiceSuccess, onError: _handleLoginError);
  }

  getStudentData() async {
    var studentId = await _prefRepository.getString("id");
    if (id != '') {
      studentId = id;
    }
    userType.value = await _prefRepository.getString("type");
    var loginRepositoryService = _repository.getStudentData(studentId);
    callDataService(loginRepositoryService,
        onSuccess: _handleLoginSuccess, onError: _handleLoginError);
  }

  _handleEventNewsServiceSuccess(StudentEventNews studentEventNews) {
    List<EventNewsUiData>? eventNewsUiData = studentEventNews.message!
        .map((e) => EventNewsUiData(
              name: e.name != null ? e.name! : "Null",
              description: e.des != null ? e.des! : "Null",
              fromData: e.fromDate != null ? e.fromDate! : "Null",
      imageLink:  e.image != null ? e.image! : "Null"
            ))
        .toList();
    _eventNewsListController(eventNewsUiData);
  }

  _handleLoginSuccess(List<StudentDataResponse> response) {
    getEventNewsData("${response[0].session}", "${response[0].studentClass}");
    print("my response${response.length}");

    List<StudentDataResponseUi>? repoList = response
        ?.map((e) => StudentDataResponseUi(

              studentFirstName:
                  e.studentFirstName != null ? e.studentFirstName! : "Null",
              studentLastName:
                  e.studentLastName != null ? e.studentLastName! : "Null",
              studentImage:
                  e.studentPicture != null ? e.studentPicture! : "null",
              studentId: e.studentId != null ? e.studentId! : "null",
              section: e.section != null ? e.section! : "null",
              studentSession: e.session != null ? e.session! : "null",
              studentClass: e.studentClass != null ? e.studentClass! : "null",
              dob: e.dob != null ? e.dob! : "null",
              gender: e.gender != null ? e.gender! : "null",
              category: e.category != null ? e.category! : "null",
              nationality: e.nationality != null ? e.nationality! : "null",
              pob: e.pob != null ? e.pob! : "null",
              fatherName: e.fatherName != null ? e.fatherName! : "null",
              motherName: e.motherName != null ? e.motherName! : "null",
              presentAddress:
                  e.presentAddress != null ? e.presentAddress! : "null",
              fatherContact:
                  e.fatherContact != null ? e.fatherContact! : "null",
              motherContact:
                  e.motherContact != null ? e.motherContact! : "null",
              fatherEmail: e.fatherEmail != null ? e.fatherEmail! : "null",
              motherEmail: e.motherEmail != null ? e.motherEmail! : "null",
              house: e.house != null ? e.house! : "null",
              emergencyCon1:
                  e.emergencyCon1 != null ? e.emergencyCon1! : "null",
              guardianName1:
                  e.guardianName1 != null ? e.guardianName1! : "null",
              permanentAddress:
                  e.permanentAddress != null ? e.permanentAddress! : "null",
              bloodGroup: e.bloodGroup != null ? e.bloodGroup! : "null",
              grealtion1: e.grealtion1 != null ? e.grealtion1! : "null",
               cId: e.cId != null ?e.cId : null,
              secId: e.secId != null?e.secId : null,
             campus: e.campus !=null ?e.campus : null,
             session: e.session !=null ?e.session : null,

            ))
        .toList();
    _studentDataListController(repoList);
    fetchExamSchedule();
    fetchNotifications(page: 1);
    fetchSubjectsForToday();
    checkTerm();


  }



  _handleLoginError(Exception e) {}

  @override
  void onInit() {
    checkTerm();

    var data = Get.arguments;
    if (data is String) {
      id = data;
    }
    super.onInit();
  }
}
