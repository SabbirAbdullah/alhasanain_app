import '/app/core/values/app_values.dart';

class StudentTermReportParam {
  String className;
  String section;
  String session;
  String termName;
  String subject;
  int perPage;
  int pageNumber;
  String student_id;
  // "className":"FIVE (V)",
  // "section":"B 1",
  // "session":"2023-2024",
  // "student_id":"1600005",
  // "termName":"Mid Term",
  // "subject":""
  StudentTermReportParam({
    required this.className,
    required this.section,
    required this.session,
    required this.termName,
    required this.student_id,
    required this.subject,
    this.perPage = AppValues.defaultPageSize,
    this.pageNumber = AppValues.defaultPageNumber,
  });


}
