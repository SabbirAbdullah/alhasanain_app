import '/app/core/values/app_values.dart';

class StudentCTQueryParam {
  String ? className;
  String? section;
  String? session;
  String? termName;
  String ? subject;
  int ? perPage;
  int ? pageNumber;
  String?  student_id;
  String? title;
  String? creatorID;
  String? creatorName;

  StudentCTQueryParam({
    required this.className,
    required this.section,
    required this.session,
    required this.termName,
    required this.student_id,
    this.subject,
    required this.title,
    this.perPage = AppValues.defaultPageSize,
    this.pageNumber = AppValues.defaultPageNumber,
  });


}
