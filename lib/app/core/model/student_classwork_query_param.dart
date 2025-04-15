
import '/app/core/values/app_values.dart';

class StudentClassworkQueryParam {
  String className;
  String section;
  String session;
  String studentId;
  String termName;
  String subject;
  int perPage;
  int pageNumber;
  // "className":"FIVE (V)",
  // "section":"B 1",
  // "session":"2023-2024",
  // "student_id":"1600005",
  // "termName":"Mid Term",
  // "subject":""
  StudentClassworkQueryParam({
    required this.className,
    required this.section,
    required this.session,
    required this.studentId,
    required this.termName,
    required this.subject,
    this.perPage = AppValues.defaultPageSize,
    this.pageNumber = AppValues.defaultPageNumber,
  });


}
