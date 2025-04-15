class RoutinePeriod {
  final int periodId;
  final String subjectId;
  final String teacherId;
  final String fName;
  final String lName;

  RoutinePeriod({
    required this.periodId,
    required this.subjectId,
    required this.teacherId,
    required this.fName,
    required this.lName,
  });

  factory RoutinePeriod.fromJson(Map<String, dynamic> json) {
    return RoutinePeriod(
      periodId: json['periodId'],
      subjectId: json['subjectId'],
      teacherId: json['teacherId'],
      fName: json['fName'],
      lName: json['lName'],
    );
  }
}
