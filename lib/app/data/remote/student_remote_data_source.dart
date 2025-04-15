import 'package:alhasanain_app/app/core/model/classRoutine_query_param.dart';
import 'package:alhasanain_app/app/core/model/diary_query_prem.dart';
import 'package:alhasanain_app/app/core/model/event_news_query_pram.dart';
import 'package:alhasanain_app/app/core/model/student_attendence_query_param.dart';
import 'package:alhasanain_app/app/core/model/student_classwork_query_param.dart';
import 'package:alhasanain_app/app/core/model/student_ct_query_param.dart';
import 'package:alhasanain_app/app/core/model/student_term_report_param.dart';
import 'package:alhasanain_app/app/data/model/student_classwork_data_response.dart';
import 'package:alhasanain_app/app/data/model/student_data_response.dart';
import 'package:alhasanain_app/app/data/model/student_term_report_data_responses.dart';
import 'package:alhasanain_app/app/data/model/subject_list_response.dart';
import 'package:alhasanain_app/app/modules/home_mid/CT/model/ct_data_ui.dart';
import 'package:alhasanain_app/app/modules/home_mid/attendence/model/attendence_data_ui.dart';
import 'package:alhasanain_app/app/modules/home_mid/classroutine/model/routine_model.dart';

import '../../core/model/mid_school_query_prem.dart';
import '../../core/model/student_homwork_query_param.dart';
import '../../modules/home_mid/classroutine/model/class_period_model.dart';
import '../../modules/home_mid/classwork/model/classwork_model.dart';
import '../../modules/home_mid/homework/model/homework_model.dart';
import '../model/classroutine_data.dart';
import '../model/school_type_response.dart';
import '../model/single_student_pre_term_report_response.dart';
import '../model/student_academic_calender_response.dart';
import '../model/student_attendence_data_response.dart';
import '../model/student_ct_data_response.dart';
import '../model/student_dairy_response.dart';
import '../model/student_event_news.dart';
import '../model/student_homework_data_response.dart';

abstract class StudentRemoteDataSource {
 Future<List<StudentDataResponse>> getStudentData(String studentId);
 Future<StudentHomeWorkDataResponse> getStudentHomeworkData(StudentHomeworkQueryParam queryParam);
 Future<StudentClassworkDataResponse> getStudentClassworkData(StudentClassworkQueryParam queryParam);
 Future<StudentCTDataResponse> getCTData(StudentCTQueryParam queryParam);
 Future<StudentTermReportDataResponse> getTermReportData(StudentTermReportParam queryParam);
 Future<StudentAttandanceDataResponse> getAttendenceData(StudentAttendenceQueryParam queryParam);
 Future<StudentEventNews> getEventNewsData(EventNewsQueryPrem eventNewsQueryPrem);
 Future<StudentDiaryResponse> getDiaryResponse(DairyQueryPrem dairyQueryPrem);
 Future<ClassRoutineDataResponse> getClassroutineResponse(ClassRoutineQueryParam routineQueryParam);
 Future<SubjectListResponse> getStudentSubjects(String className);
 Future<SchoolTypeResponse> getStudentSchoolType(String className);
 Future<SingleStudentPreTermReportResponse>getMidSchoolReportData(MidSchoolReportQueryPrem midSchoolReportQueryPrem);
 Future<AcademicCalenderResponse>getCalenderResponse(String month);
 Future<List<Period>> getClassPeriods(  String className, String session, String campus);
 Future<List<RoutineDay>> getClassRoutines(  String className, String session, String campus, String sectionName);
 Future<List<Classwork>> getClasswork(Map<String, dynamic> params);
 Future <List<Homework>> getHomework(Map<String, dynamic> params);
}