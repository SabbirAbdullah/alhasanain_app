class DairyQueryPrem {
  String? className;
  String? session;
  String? studentId;
  String? section;
  String? month;
  String? date;

  DairyQueryPrem(
      {required this.className,required this.session, required this.studentId,required this.section,required this.month,required this.date});

  DairyQueryPrem.fromJson(Map<String, dynamic> json) {
    className = json['className'];
    session = json['session'];
    studentId = json['student_id'];
    section = json['section'];
    month = json['month'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['className'] = this.className;
    data['session'] = this.session;
    data['student_id'] = this.studentId;
    data['section'] = this.section;
    data['month'] = this.month;
    data['date'] = this.date;
    return data;
  }
}