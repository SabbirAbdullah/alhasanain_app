import '/app/core/values/app_values.dart';

class StudentAttendenceQueryParam {
  int? id;
  String? studentId;
  String? studentName;
  String? termName;
  String? Class;
  String? school;
  String? section;
  String? attendance;
  String? date;
  String? session;
  String? creatorID;
  String? creatorName;
  int? perPage;
  int pageNumber;

  // "className":"FIVE (V)",
  // "section":"B 1",
  // "session":"2023-2024",
  // "student_id":"1600005",
  // "termName":"Mid Term",
  // "subject":""
  StudentAttendenceQueryParam({
    this.section,
 this.perPage,
    required this.pageNumber,
    this.session,
    this.termName,
    this.id,
    this.creatorID,
    this.creatorName,
    this.Class,
    this.attendance,
    this.studentId,
    this.school,
    this.studentName,
    this.date,
  });
}
