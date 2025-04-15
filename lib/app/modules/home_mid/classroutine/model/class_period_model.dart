class Period {
  final int id;
  final String className;
  final String campus;
  final String session;
  final String type;
  final String name;
  final String startTime;
  final String endTime;

  Period({
    required this.id,
    required this.className,
    required this.campus,
    required this.session,
    required this.type,
    required this.name,
    required this.startTime,
    required this.endTime,
  });

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      id: json['id'],
      className: json['class_name'],
      campus: json['campus'],
      session: json['session'],
      type: json['type'],
      name: json['name'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}
