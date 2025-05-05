import 'package:alhasanain_app/app/core/base/base_remote_source.dart';
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
import 'package:alhasanain_app/app/data/model/student_homework_data_response.dart';
import 'package:alhasanain_app/app/data/model/student_term_report_data_responses.dart';
import 'package:alhasanain_app/app/data/model/subject_list_response.dart';
import 'package:alhasanain_app/app/data/remote/student_remote_data_source.dart';

import '../../core/model/student_homwork_query_param.dart';
import '../../modules/home_mid/classroutine/model/class_period_model.dart';
import '../../modules/home_mid/classroutine/model/routine_model.dart';
import '../../modules/home_mid/classwork/model/classwork_model.dart';
import '../../modules/home_mid/homework/model/homework_model.dart';
import '../../network/dio_provider.dart';
import 'package:dio/dio.dart';

import '../model/school_type_response.dart';

class StudentRemoteDataImpl extends BaseRemoteSource
    implements StudentRemoteDataSource {
  @override
  Future<List<StudentDataResponse>> getStudentData(String studentId) {
    var endpoint =
        "${DioProvider.baseUrl}/server/student/getStudentDashboardbyID";
    var dioCall = dioClient.post(endpoint, data: {"student_id": studentId});

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseStudentDataResponse(response));
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<StudentHomeWorkDataResponse> getStudentHomeworkData(
      StudentHomeworkQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}/server/student/getHomeWorkList";
    var dioCall = dioClient.post(endpoint, data: {
      "className": queryParam.className,
      "section": queryParam.section,
      "session": queryParam.session,
      "student_id": queryParam.studentId,
      "termName": queryParam.termName,
      "subject": queryParam.subject,
      "date":""

    }, queryParameters: {
      "pageSize": queryParam.perPage,
      "page": queryParam.pageNumber
    });

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseHomeworkDataResponse(response));
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

  @override
  Future<StudentClassworkDataResponse> getStudentClassworkData(
      StudentClassworkQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}/server/student/getClassWorkList";
    var dioCall = dioClient.post(endpoint, data: {
      "className": queryParam.className,
      "section": queryParam.section,
      "session": queryParam.session,
      "student_id": queryParam.studentId,
      "termName": queryParam.termName,
      "subject": queryParam.subject,
      "date":''
    }, queryParameters: {
      "pageSize": queryParam.perPage,
      "page": queryParam.pageNumber
    });

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseClassWorkDataResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StudentCTDataResponse> getCTData(StudentCTQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}/server/student/getClassTestList";
    var dioCall = dioClient.post(endpoint, data: {
      "className": queryParam.className,
      "section": queryParam.section,
      "session": queryParam.session,
      "student_id": queryParam.student_id,
      "termName": queryParam.termName,
      'title':queryParam.title
    });
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseCTDataResponse(response));
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

  @override
  Future<StudentTermReportDataResponse> getTermReportData(
      StudentTermReportParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}/server/student/getClassTestList";
    var dioCall = dioClient.post(endpoint, data: {
      "className": queryParam.className,
      "section": queryParam.section,
      "session": queryParam.session,
      "student_id": queryParam.student_id,
      "termName": queryParam.termName,
      "subject": queryParam.subject
    }, queryParameters: {
      "pageSize": queryParam.perPage,
      "page": queryParam.pageNumber
    });
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseTermReportDataResponse(response));
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }
  @override
  Future<ClassRoutineDataResponse> getClassroutineResponse(ClassRoutineQueryParam routineQueryParam) {
    var endpoint="${DioProvider.baseUrl}/server/student/getStudentClasssRoutine";
    var dioCall=dioClient.post(endpoint,data: routineQueryParam.toJson());
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseClassRoutineDataResponse(response));
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }
  @override
  Future<StudentAttandanceDataResponse> getAttendenceData(StudentAttendenceQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}/server/student/getStudentAttendanceByID";
    var dioCall = dioClient.post(endpoint, data: {
      "month": queryParam.date,
      "student_id": queryParam.studentId,
    });

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseAttendanceDataResponse(response));
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<StudentEventNews> getEventNewsData(EventNewsQueryPrem eventNewsQueryPrem) {
    var endpoint = "${DioProvider.baseUrl}/server/student/getStudentEventNews";
    var dioCall = dioClient.post(endpoint, data: eventNewsQueryPrem.toJson());
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseEventNewsDataResponse(response));
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

  @override
  Future<StudentDiaryResponse> getDiaryResponse(DairyQueryPrem dairyQueryPrem) {
    var endpoint = "${DioProvider.baseUrl}/server/student/getStudentDiary";
    var dioCall = dioClient.post(endpoint, data:dairyQueryPrem.toJson(),);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseStudentDairyData(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SubjectListResponse> getStudentSubjects(String className) {
    var endpoint = "${DioProvider.baseUrl}/server/student/getSubjectList";
    var dioCall = dioClient.post(endpoint, data: {
      "className":className,
    });
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseSubjectResponse(response));
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

  @override
  Future<SchoolTypeResponse> getStudentSchoolType(String className) {
    var endpoint = "${DioProvider.baseUrl}/server/student/getSchoolName";
    var dioCall = dioClient.post(endpoint, data: {
      "class_name":className,
    });
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseSchoolResponse(response));
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();

  }

  @override
  Future<SingleStudentPreTermReportResponse> getMidSchoolReportData(MidSchoolReportQueryPrem midSchoolReportQueryPrem) {
    var endpoint = "${DioProvider.baseUrl}/server/getSingleStudentPreTermReport";
    var dioCall = dioClient.post(endpoint, data:midSchoolReportQueryPrem.toJson());
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseMidSchoolResponseData(response));
    } catch (e) {
      rethrow;
    }

  }



  @override
  Future<AcademicCalenderResponse> getCalenderResponse(String month) {

    var endpoint = "${DioProvider.baseUrl}/server/student/getStudentAcademicCalendarNew";
    var dioCall = dioClient.post(endpoint, data:{
      "month":month,
    });

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseAcademicCalenderData(response));
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }
  @override
  Future<List<Period>> getClassPeriods(String className, String session, String campus,) async {
    var  endpoint = "${DioProvider.baseUrl}/server/getPeriodsList";
    try {
      final response = await dioClient.post(
        endpoint,
        data: {
          'class_name': className,
          'session': session,
          'campus': campus,
        },
      );
      if (response.statusCode == 200) {
        final List periodsJson = response.data['message'];
        return periodsJson.map((json) => Period.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load periods');
      }
    } catch (e) {
      throw Exception('Error fetching periods: $e');
    }
  }

  @override
  Future<List<RoutineDay>> getClassRoutines(String className, String sectionName, String session, String campus,) async {
    var  endpoint = "${DioProvider.baseUrl}/server/getRoutinesForView";
    try {
      final response = await dioClient.post(
          endpoint, data: {
        'class_name': className,
        'section_name': sectionName,
        'session': session,
        'campus': campus,
      });

      final List<dynamic> message = response.data['message'];
      return message.map((e) => RoutineDay.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to load routines: $e");
    }
  }

  @override
  Future<List<Homework>> getHomework(Map<String, dynamic> params) async {
    var  endpoint = "${DioProvider.baseUrl}/server/student/getHomeWorkList";
    try {
      final response = await dioClient.post(endpoint, data: params);
      if (response.data['ok'] == true) {
        List<dynamic> data = response.data['message'];
        return data.map((e) => Homework.fromJson(e)).toList();
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      throw Exception('Failed to load homework: $e');
    }
  }
  @override
  Future<List<Classwork>> getClasswork(Map<String, dynamic> params) async {
    var  endpoint = "${DioProvider.baseUrl}/server/student/getClassWorkList";
    try {
      final response = await dioClient.post(endpoint, data: params);
      if (response.data['ok'] == true) {
        List<dynamic> data = response.data['message'];
        return data.map((e) => Classwork.fromJson(e)).toList();
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      throw Exception('Failed to load classwork: $e');
    }
  }



  List<StudentDataResponse> _parseStudentDataResponse(
      Response<dynamic> response) {
    var studentDataJson = response.data['message'] as List;
    List<StudentDataResponse> studentData = studentDataJson
        .map((tagJson) => StudentDataResponse.fromJson(tagJson))
        .toList();

    return studentData;
  }

  StudentHomeWorkDataResponse _parseHomeworkDataResponse(
      Response<dynamic> response) {
    var homeworkDataJson = response.data;
    StudentHomeWorkDataResponse homeworkData =
    StudentHomeWorkDataResponse.fromJson(homeworkDataJson);
    return homeworkData;
  }
  StudentClassworkDataResponse _parseClassWorkDataResponse(
      Response<dynamic> response) {
    var classworkDataJson = response.data;
    StudentClassworkDataResponse classworkData =
    StudentClassworkDataResponse.fromJson(classworkDataJson);
    return classworkData;
  }

  StudentCTDataResponse _parseCTDataResponse(Response<dynamic> response) {
    var CTDataJson = response.data;
    StudentCTDataResponse CTData = StudentCTDataResponse.fromJson((CTDataJson));
    return CTData;
  }

  StudentTermReportDataResponse _parseTermReportDataResponse(
      Response<dynamic> response) {
    var TermReportDataJson = response.data;
    StudentTermReportDataResponse TermReportData =
    StudentTermReportDataResponse.fromJson((TermReportDataJson));
    return TermReportData;
  }


  StudentAttandanceDataResponse _parseAttendanceDataResponse(
      Response<dynamic> response) {
    var AttendanceDataJson = response.data;
    StudentAttandanceDataResponse AttendanceData =
    StudentAttandanceDataResponse.fromJson((AttendanceDataJson));
    return AttendanceData;
  }




  StudentEventNews _parseEventNewsDataResponse(
      Response<dynamic> response) {
    var eventNewsDataJson = response.data;
    StudentEventNews studentEventNews =
    StudentEventNews.fromJson(eventNewsDataJson);
    return studentEventNews;
  }


  ClassRoutineDataResponse _parseClassRoutineDataResponse(
      Response<dynamic> response) {
    var classRoutineDataJson = response.data;
    ClassRoutineDataResponse classRoutine=
    ClassRoutineDataResponse.fromJson(classRoutineDataJson);
    return classRoutine;
  }



  StudentDiaryResponse _parseStudentDairyData(
      Response<dynamic> response) {
    var eventNewsDataJson = response.data;
    StudentDiaryResponse studentEventNews =
    StudentDiaryResponse.fromJson(eventNewsDataJson);
    return studentEventNews;
  }


  _parseMidSchoolResponseData(Response response) {
    return SingleStudentPreTermReportResponse.fromJson(response.data);
  }
  _parseSubjectResponse(Response response) {
    return SubjectListResponse.fromJson(response.data);
  }
  _parseSchoolResponse(Response response) {
    return SchoolTypeResponse.fromJson(response.data);
  }



}

_parseAcademicCalenderData(Response response) {
  return AcademicCalenderResponse.fromJson(response.data);
}

