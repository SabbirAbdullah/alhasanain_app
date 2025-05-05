class MonthlyReportModel {
  final String studentId;
  final String studentName;
  final List<SubjectData> subjectData;
  final AttendanceData attendanceData;

  MonthlyReportModel({
    required this.studentId,
    required this.studentName,
    required this.subjectData,
    required this.attendanceData,
  });

  factory MonthlyReportModel.fromJson(Map<String, dynamic> json) {
    return MonthlyReportModel(
      studentId: json['studentId'] ?? '',
      studentName: json['studentName'] ?? '',
      subjectData: (json['subjectData'] as List<dynamic>)
          .map((e) => SubjectData.fromJson(e))
          .toList(),
      attendanceData: AttendanceData.fromJson(json['attendanceData']),
    );
  }
}

class SubjectData {
  final String subjectName;
  final int homeWork;
  final int doneHomeWork;
  final List<ClassTestData> classTestData;

  SubjectData({
    required this.subjectName,
    required this.homeWork,
    required this.doneHomeWork,
    required this.classTestData,
  });

  factory SubjectData.fromJson(Map<String, dynamic> json) {
    return SubjectData(
      subjectName: json['subjectName'] ?? '',
      homeWork: json['homeWork'] ?? 0,
      doneHomeWork: json['doneHomeWork'] ?? 0,
      classTestData: (json['classTestData'] as List<dynamic>)
          .map((e) => ClassTestData.fromJson(e))
          .toList(),
    );
  }
}

class ClassTestData {
  final String classtestTitle;
  final String marks;
  final String obtainMarks;

  ClassTestData({
    required this.classtestTitle,
    required this.marks,
    required this.obtainMarks,
  });

  factory ClassTestData.fromJson(Map<String, dynamic> json) {
    return ClassTestData(
      classtestTitle: json['classtestTitle'] ?? '',
      marks: json['marks'] ?? '',
      obtainMarks: json['obtain_marks'] ?? '',
    );
  }
}

class AttendanceData {
  final int totalDays;
  final int present;
  final int absent;

  AttendanceData({
    required this.totalDays,
    required this.present,
    required this.absent,
  });

  factory AttendanceData.fromJson(Map<String, dynamic> json) {
    return AttendanceData(
      totalDays: json['totalDays'] ?? 0,
      present: json['present'] ?? 0,
      absent: json['absent'] ?? 0,
    );
  }
}
