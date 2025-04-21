class ExamScheduleModel {
  final int? id;
  final int? classId;
  final String? title;
  final String? term;
  final String? session;
  final String? media;
  final int? status;
  final String? compile;
  final DateTime? date;
  final String? className;

  ExamScheduleModel({
    this.id,
    this.classId,
    this.title,
    this.term,
    this.session,
    this.media,
    this.status,
    this.compile,
    this.date,
    this.className,
  });

  factory ExamScheduleModel.fromJson(Map<String, dynamic> json) {
    return ExamScheduleModel(
      id: json['id'],
      classId: json['classId'],
      title: json['title'],
      term: json['term'],
      session: json['session'],
      media: json['media'],
      status: json['status'],
      compile: json['compile'],
      date: json['date'] != null ? DateTime.tryParse(json['date']) : null,
      className: json['class_name'],
    );
  }
}
