class WeeklyDate {
  final int id;
  final String weekName;
  final String term;
  final int classId;
  final int sectionId;
  final String campus;
  final String session;
  final String startDate;
  final String endDate;
  final String teacherId;
  final String compile;
  final String createDate;
  final String? updateDate;
  final List<String> dates;
  final List<String> days;

  WeeklyDate({
    required this.id,
    required this.weekName,
    required this.term,
    required this.classId,
    required this.sectionId,
    required this.campus,
    required this.session,
    required this.startDate,
    required this.endDate,
    required this.teacherId,
    required this.compile,
    required this.createDate,
    this.updateDate,
    required this.dates,
    required this.days,
  });

  factory WeeklyDate.fromJson(Map<String, dynamic> json) {
    return WeeklyDate(
      id: json['id'],
      weekName: json['weekName'],
      term: json['term'],
      classId: json['class_id'],
      sectionId: json['section_id'],
      campus: json['campus'],
      session: json['session'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      teacherId: json['teacher_id'],
      compile: json['compile'],
      createDate: json['create_date'],
      updateDate: json['update_date'],
      dates: List<String>.from(json['dates']),
      days: List<String>.from(json['days']),
    );
  }
}

class WeeklyDateResponse {
  final bool ok;
  final List<WeeklyDate> message;

  WeeklyDateResponse({
    required this.ok,
    required this.message,
  });

  factory WeeklyDateResponse.fromJson(Map<String, dynamic> json) {
    return WeeklyDateResponse(
      ok: json['ok'],
      message: List<WeeklyDate>.from(json['message'].map((x) => WeeklyDate.fromJson(x))),
    );
  }
}
