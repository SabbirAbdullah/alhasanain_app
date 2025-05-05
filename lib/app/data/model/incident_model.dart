class IncidentReportModel {
  final int id;
  final String studentId;
  final String? submitDate;
  final String dateOfOccurrence;
  final String eventDetails;
  final String? media;
  final String courseOfAction;
  final String counselorName;
  final String campus;
  final String session;
  final int? createAt;
  final int? updateAt;
  final String? status;
  final int? parents;
  final String studentFirstName;
  final String studentLastName;
  final String studentClass;
  final String section;

  IncidentReportModel({
    required this.id,
    required this.studentId,
    this.submitDate,
    required this.dateOfOccurrence,
    required this.eventDetails,
    this.media,
    required this.courseOfAction,
    required this.counselorName,
    required this.campus,
    required this.session,
    this.createAt,
    this.updateAt,
    this.status,
    this.parents,
    required this.studentFirstName,
    required this.studentLastName,
    required this.studentClass,
    required this.section,
  });

  factory IncidentReportModel.fromJson(Map<String, dynamic> json) {
    return IncidentReportModel(
      id: json['id'],
      studentId: json['student_id'] ?? '',
      submitDate: json['submitDate'],
      dateOfOccurrence: json['dateOfOccurrence'] ?? '',
      eventDetails: json['eventDetails'] ?? '',
      media: (json['media'] == "undefined") ? null : json['media'],
      courseOfAction: json['courseOfAction'] ?? '',
      counselorName: json['counselorName'] ?? '',
      campus: json['campus'] ?? '',
      session: json['session'] ?? '',
      createAt: json['createAt'],
      updateAt: json['updateAt'],
      status: json['status'],
      parents: json['parents'] ?? 0,
      studentFirstName: json['student_first_name'] ?? '',
      studentLastName: json['student_last_name'] ?? '',
      studentClass: json['Class'] ?? '',
      section: json['section'] ?? '',
    );
  }
}

