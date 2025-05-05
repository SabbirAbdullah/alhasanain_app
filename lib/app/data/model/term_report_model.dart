class TermReportModel {
  bool? ok;
  List<StudentData>? message;

  TermReportModel({this.ok, this.message});

  factory TermReportModel.fromJson(Map<String, dynamic> json) {
    return TermReportModel(
      ok: json['ok'] ?? false,
      message: (json['message'] as List<dynamic>?)
          ?.map((e) => StudentData.fromJson(e))
          .toList() ?? [],
    );
  }
}

class StudentData {
  String? studentId;
  String? campus;
  String? studentName;
  StudentDetails? data;

  StudentData({
    this.studentId = '',
    this.campus = '',
    this.studentName = '',
    this.data,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) {
    return StudentData(
      studentId: json['student_id'] ?? '',
      campus: json['campus'] ?? '',
      studentName: json['student_name'] ?? '',
      data: json['data'] != null ? StudentDetails.fromJson(json['data']) : null,
    );
  }
}

class StudentDetails {
  List<GradingMark>? gradingMarks;
  List<SubjectResult>? subjectResult;
  List<AttendanceData>? attendanceData;
  List<StudentPerformance>? studentPerformance;

  StudentDetails({
    this.gradingMarks,
    this.subjectResult,
    this.attendanceData,
    this.studentPerformance,
  });

  factory StudentDetails.fromJson(Map<String, dynamic> json) {
    return StudentDetails(
      gradingMarks: (json['gradingMarks'] as List<dynamic>?)
          ?.map((e) => GradingMark.fromJson(e))
          .toList() ?? [],
      subjectResult: (json['subjectResult'] as List<dynamic>?)
          ?.map((e) => SubjectResult.fromJson(e))
          .toList() ?? [],
      attendanceData: (json['attendanceData'] as List<dynamic>?)
          ?.map((e) => AttendanceData.fromJson(e))
          .toList() ?? [],
      studentPerformance: (json['studentPerformance'] as List<dynamic>?)
          ?.map((e) => StudentPerformance.fromJson(e))
          .toList() ?? [],
    );
  }
}

class GradingMark {
  int? id;
  String? className;
  String? minNumber;
  String? maxNumber;
  String? grade;
  String? performance;
  String? description;
  String? session;

  GradingMark({
    this.id = 0,
    this.className = '',
    this.minNumber = '',
    this.maxNumber = '',
    this.grade = '',
    this.performance = '',
    this.description = '',
    this.session = '',
  });

  factory GradingMark.fromJson(Map<String, dynamic> json) {
    return GradingMark(
      id: json['id'] ?? 0,
      className: json['className'] ?? '',
      minNumber: json['minNumber'] ?? '',
      maxNumber: json['maxNumber'] ?? '',
      grade: json['grade'] ?? '',
      performance: json['performance'] ?? '',
      description: json['description'] ?? '',
      session: json['session'] ?? '',
    );
  }
}

class SubjectResult {
  int? id;
  String? studentId;
  String? studentName;
  String? subject;
  String? termName;
  String? className;
  String? section;
  dynamic termObtainMarks;
  String? termTotalMarks;
  String? ctObtainMarks;
  String? ctTotalMarks;
  String? doneClassWork;
  String? totalClassWork;
  String? doneHomeWork;
  String? totalHomeWork;
  String? cwObtainMarks;
  String? cwTotalMarks;
  String? hwObtainMarks;
  String? hwTotalMarks;
  String? session;
  String? creatorId;
  String? creatorName;
  String? cdate;
  dynamic totalMarks;
  dynamic obtainMarks;
  dynamic grandObtainMarks;
  String? grade;
  String? performance;
  String? description;

  SubjectResult({
    this.id = 0,
    this.studentId = '',
    this.studentName = '',
    this.subject = '',
    this.termName = '',
    this.className = '',
    this.section = '',
    this.termObtainMarks = 0,
    this.termTotalMarks = '',
    this.ctObtainMarks = '',
    this.ctTotalMarks = '',
    this.doneClassWork = '',
    this.totalClassWork = '',
    this.doneHomeWork = '',
    this.totalHomeWork = '',
    this.cwObtainMarks = '',
    this.cwTotalMarks = '',
    this.hwObtainMarks = '',
    this.hwTotalMarks = '',
    this.session = '',
    this.creatorId = '',
    this.creatorName = '',
    this.cdate = '',
    this.totalMarks = 0,
    this.obtainMarks = 0,
    this.grandObtainMarks = 0,
    this.grade = '',
    this.performance = '',
    this.description = '',
  });

  factory SubjectResult.fromJson(Map<String, dynamic> json) {
    return SubjectResult(
      id: json['id'] ?? 0,
      studentId: json['student_id'] ?? '',
      studentName: json['student_name'] ?? '',
      subject: json['subject'] ?? '',
      termName: json['termName'] ?? '',
      className: json['className'] ?? '',
      section: json['section'] ?? '',
      termObtainMarks: json['Term_Obtaint_Marks'] ?? 0,
      termTotalMarks: json['Term_Total_Marks'] ?? '',
      ctObtainMarks: json['CT_Obtaint_Marks']?.toString() ?? '',
      ctTotalMarks: json['CT_Total_Marks']?.toString() ?? '',
      doneClassWork: json['doneClassWork']?.toString() ?? '',
      totalClassWork: json['TotalClassWork']?.toString() ?? '',
      doneHomeWork: json['doneHomeWork']?.toString() ?? '',
      totalHomeWork: json['TotalHomeWork']?.toString() ?? '',
      cwObtainMarks: json['CW_Obtaint_Marks']?.toString() ?? '',
      cwTotalMarks: json['CW_Total_Marks']?.toString() ?? '',
      hwObtainMarks: json['HW_Obtaint_Marks']?.toString() ?? '',
      hwTotalMarks: json['HW_Total_Marks']?.toString() ?? '',
      session: json['session'] ?? '',
      creatorId: json['creator_ID']?.toString() ?? '',
      creatorName: json['creator_Name'] ?? '',
      cdate: json['cdate'] ?? '',
      totalMarks: json['total_marks'] ?? 0,
      obtainMarks: json['obtain_marks'] ?? 0,
      grandObtainMarks: json['Grand_Obtain_Marks'] ?? 0,
      grade: json['grade'] ?? '',
      performance: json['performance'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class AttendanceData {
  int? totalDays;
  int? present;
  int? absent;
  String? studentId;
  String? campus;
  String? studentName;

  AttendanceData({
    this.totalDays,
    this.present,
    this.absent,
    this.studentId,
    this.campus,
    this.studentName,
  });

  factory AttendanceData.fromJson(Map<String, dynamic> json) {
    return AttendanceData(
      totalDays: json['total_days'] ?? 0,
      present: json['present'] ?? 0,
      absent: json['absent'] ?? 0,
      studentId: json['student_id'] ?? '',
      campus: json['campus'] ?? '',
      studentName: json['student_name'] ?? '',
    );
  }
}


class StudentPerformance {
  String? studentId;
  String? name;
  String? punctuality;
  String? behavior;
  String? cleanliness;
  String? handwriting;
  String? comments;
  String? term;
  String? session;
  String? compile;
  String? createDate;
  String? updateDate;
  String? campus;
  int? totalDays;  // Added totalDays field

  StudentPerformance({
    this.studentId = '',
    this.name = '',
    this.punctuality = '',
    this.behavior = '',
    this.cleanliness = '',
    this.handwriting = '',
    this.comments = '',
    this.term = '',
    this.session = '',
    this.compile = '',
    this.createDate = '',
    this.updateDate = '',
    this.campus = '',
    this.totalDays = 0,  // Initialize totalDays
  });

  factory StudentPerformance.fromJson(Map<String, dynamic> json) {
    return StudentPerformance(
      studentId: json['studentId'] ?? '',
      name: json['name'] ?? '',
      punctuality: json['punctuality'] ?? '',
      behavior: json['behavior'] ?? '',
      cleanliness: json['cleanliness'] ?? '',
      handwriting: json['handwriting'] ?? '',
      comments: json['comments'] ?? '',
      term: json['term'] ?? '',
      session: json['session'] ?? '',
      compile: json['compile'] ?? '',
      createDate: json['create_date'] ?? '',
      updateDate: json['update_date'] ?? '',
      campus: json['campus'] ?? '',
      totalDays: json['totalDays'] ?? 0,  // Parse totalDays from JSON
    );
  }
}

