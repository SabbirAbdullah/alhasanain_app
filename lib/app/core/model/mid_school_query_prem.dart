class
MidSchoolReportQueryPrem {
  String? className;
  String? termName;
  String? studentId;
  String? section;
  String? session;

  MidSchoolReportQueryPrem(
      {this.className,
        this.termName,
        this.studentId,
        this.section,
        this.session});

  MidSchoolReportQueryPrem.fromJson(Map<String, dynamic> json) {
    className = json['className'];
    termName = json['termName'];
    studentId = json['student_id'];
    section = json['section'];
    session = json['session'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['className'] = this.className;
    data['termName'] = this.termName;
    data['student_id'] = this.studentId;
    data['section'] = this.section;
    data['session'] = this.session;
    return data;
  }
}