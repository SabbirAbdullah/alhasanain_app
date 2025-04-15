import '/app/core/values/app_values.dart';

class StudentCTQueryParam {
  String className;
  String section;
  String session;
  String termName;
  String subject;
  int perPage;
  int pageNumber;
  String student_id;
  String? date;
  String? creatorID;
  String? creatorName;

  StudentCTQueryParam({
    required this.className,
    required this.section,
    required this.session,
    required this.termName,
    required this.student_id,
    required this.subject,
    required this.date,
    this.perPage = AppValues.defaultPageSize,
    this.pageNumber = AppValues.defaultPageNumber,
  });


}
