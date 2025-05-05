class MonthlyProgressModel {
  final int id;
  final String className;
  final String campus;
  final String term;
  final String fromDate;
  final String toDate;
  final String session;
  final String publish;

  MonthlyProgressModel({
    required this.id,
    required this.className,
    required this.campus,
    required this.term,
    required this.fromDate,
    required this.toDate,
    required this.session,
    required this.publish
  });

  factory MonthlyProgressModel.fromJson(Map<String, dynamic> json) {
    return MonthlyProgressModel(
      id: json['id'] ?? 0,
      className: json['class_name'] ?? '',
      campus: json['campus'] ?? '',
      term: json['term'] ?? '',
      fromDate: json['fromDate'] ?? '',
      toDate: json['toDate'] ?? '',
      session: json['session'] ?? '',
        publish : json['publish']?? '',
    );
  }
}
