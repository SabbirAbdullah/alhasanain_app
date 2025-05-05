class AcademicEventModel {
  final int eventId;
  final String title;
  final DateTime start;
  final DateTime end;
  final String eventType;
  final String color;

  AcademicEventModel({
    required this.eventId,
    required this.title,
    required this.start,
    required this.end,
    required this.eventType,
    required this.color,
  });

  factory AcademicEventModel.fromJson(Map<String, dynamic> json) {
    return AcademicEventModel(
      eventId: json['event_ID'],
      title: json['title'],
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      eventType: json['event_Type'],
      color: json['color'],
    );
  }
}
