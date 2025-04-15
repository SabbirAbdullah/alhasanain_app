import 'package:alhasanain_app/app/core/model/classRoutine_query_param.dart';
import 'package:alhasanain_app/app/core/model/diary_query_prem.dart';
import 'package:alhasanain_app/app/core/model/event_news_query_pram.dart';
import 'package:alhasanain_app/app/core/model/mid_school_query_prem.dart';
import 'package:alhasanain_app/app/core/model/student_attendence_query_param.dart';
import 'package:alhasanain_app/app/core/model/student_classwork_query_param.dart';
import 'package:alhasanain_app/app/core/model/student_ct_query_param.dart';
import 'package:alhasanain_app/app/core/model/student_term_report_param.dart';
import 'package:alhasanain_app/app/data/model/classroutine_data.dart';
import 'package:alhasanain_app/app/data/model/single_student_pre_term_report_response.dart';
import 'package:alhasanain_app/app/data/model/student_academic_calender_response.dart';
import 'package:alhasanain_app/app/data/model/student_attendence_data_response.dart';
import 'package:alhasanain_app/app/data/model/student_classwork_data_response.dart';
import 'package:alhasanain_app/app/data/model/student_ct_data_response.dart';
import 'package:alhasanain_app/app/data/model/student_dairy_response.dart';
import 'package:alhasanain_app/app/data/model/student_data_response.dart';
import 'package:alhasanain_app/app/data/model/student_event_news.dart';
import 'package:alhasanain_app/app/data/model/student_term_report_data_responses.dart';
import 'package:alhasanain_app/app/data/model/subject_list_response.dart';
import 'package:alhasanain_app/app/data/remote/student_remote_data_source.dart';
import 'package:alhasanain_app/app/data/repository/student_data_repository.dart';
import 'package:alhasanain_app/app/modules/home_mid/classroutine/model/class_period_model.dart';
import 'package:alhasanain_app/app/modules/home_mid/classroutine/model/routine_model.dart';
import 'package:alhasanain_app/app/modules/home_mid/classwork/model/classwork_model.dart';
import 'package:alhasanain_app/app/modules/home_mid/homework/model/homework_model.dart';
import 'package:get/get.dart';

import '../../core/model/student_homwork_query_param.dart';
import '../model/school_type_response.dart';
import '../model/student_homework_data_response.dart';

class StudentDataRepositoryImpl extends StudentDataRepository{

  final StudentRemoteDataSource _remoteSource =
  Get.find(tag: (StudentRemoteDataSource).toString());

  @override
  Future<List<StudentDataResponse>> getStudentData(String id) {
    return _remoteSource.getStudentData(id);
    throw UnimplementedError();
  }

  @override
  Future<StudentHomeWorkDataResponse> getHomeWorkData(StudentHomeworkQueryParam queryParam) {
    return _remoteSource.getStudentHomeworkData(queryParam);
    throw UnimplementedError();
  }

  @override
  Future<StudentCTDataResponse> getCTData(StudentCTQueryParam queryParam) {
    return _remoteSource.getCTData(queryParam);
    throw UnimplementedError();
  }

  @override
  Future<StudentTermReportDataResponse> getTermReportData(StudentTermReportParam queryParam) {
    return _remoteSource.getTermReportData(queryParam);
    throw UnimplementedError();
  }
  @override
  Future<StudentAttandanceDataResponse> getAttendenceData(StudentAttendenceQueryParam queryParam) {
    return _remoteSource.getAttendenceData(queryParam);
    throw UnimplementedError();
  }

  @override
  Future<StudentEventNews> getEventNewsData(EventNewsQueryPrem eventNewsQueryPrem) {
    return _remoteSource.getEventNewsData(eventNewsQueryPrem);

    throw UnimplementedError();
  }

  @override
  Future<StudentAttandanceDataResponse> getAttandanceData(StudentAttendenceQueryParam studentAttendenceQueryPara) {
    return _remoteSource.getAttendenceData(studentAttendenceQueryPara);
    throw UnimplementedError();
  }

  @override
  Future<StudentDiaryResponse> getStudentDairy(DairyQueryPrem dairyQueryPrem) {
    return _remoteSource.getDiaryResponse(dairyQueryPrem);
    throw UnimplementedError();
  }

  @override
  Future<StudentClassworkDataResponse> getClassWork(StudentClassworkQueryParam queryParam) {
    return _remoteSource.getStudentClassworkData(queryParam);
    throw UnimplementedError();
  }

  @override
  Future<ClassRoutineDataResponse> getClassRoutine(ClassRoutineQueryParam routineQueryParam) {
    return _remoteSource.getClassroutineResponse(routineQueryParam);
    throw UnimplementedError();
  }

  @override
  Future<SubjectListResponse> getStudentSubjects(String className) {
    return _remoteSource.getStudentSubjects(className);
    throw UnimplementedError();
  }

  @override
  Future<SchoolTypeResponse> getStudentSchoolType(String className) {
    return _remoteSource.getStudentSchoolType(className);
    throw UnimplementedError();
  }

  @override
  Future<SingleStudentPreTermReportResponse> getMidSchoolReportData(MidSchoolReportQueryPrem midSchoolReportQueryPrem) {
    return _remoteSource.getMidSchoolReportData(midSchoolReportQueryPrem);
    throw UnimplementedError();
  }

  @override
  Future<AcademicCalenderResponse> getCalenderResponse(String month) {
    return _remoteSource.getCalenderResponse(month);
    throw UnimplementedError();
  }

  @override
  Future<List<Period>> getClassPeriods(String className, String session, String campus) {

    return _remoteSource.getClassPeriods( className,  session, campus);
  }

  @override
  Future<List<RoutineDay>> getClassRoutines(String className, String session, String campus, String sectionName) {
    return _remoteSource.getClassRoutines( className, sectionName, session, campus);
  }

  @override
  Future<List<Homework>> getHomework(Map<String, dynamic> params) {
   return _remoteSource.getHomework(params);
  }

  @override
  Future<List<Classwork>> getClasswork(Map<String, dynamic> params) {
    return _remoteSource.getClasswork(params);
  }

}