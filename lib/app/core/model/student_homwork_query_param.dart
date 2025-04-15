import '/app/core/values/app_values.dart';

class StudentHomeworkQueryParam {
  String className;
  String section;
  String session;
  String studentId;
  String termName;
  String subject;
  String date;
  int perPage;
  int pageNumber;
  // "className":"FIVE (V)",
  // "section":"B 1",
  // "session":"2023-2024",
  // "student_id":"1600005",
  // "termName":"Mid Term",
  // "subject":""
  StudentHomeworkQueryParam({
    required this.className,
    required this.section,
    required this.session,
    required this.studentId,
    required this.termName,
    required this.subject,
    required this.date,
    this.perPage = AppValues.defaultPageSize,
    this.pageNumber = AppValues.defaultPageNumber,
  });


}
