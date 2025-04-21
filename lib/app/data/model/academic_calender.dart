class AcademicEventModel {
  final int eventId;
  final String title;
  final String start;
  final String end;
  final String eventType;
  final String color;
  final String purpose;
  final String responsible;
  final String hostUserName;

  AcademicEventModel({
    required this.eventId,
    required this.title,
    required this.start,
    required this.end,
    required this.eventType,
    required this.color,
    required this.purpose,
    required this.responsible,
    required this.hostUserName,
  });

  factory AcademicEventModel.fromJson(Map<String, dynamic> json) {
    return AcademicEventModel(
      eventId: json['event_ID'],
      title: json['title'],
      start: json['start'],
      end: json['end'],
      eventType: json['event_Type'],
      color: json['color'],
      purpose: json['purpose'],
      responsible: json['responsible'],
      hostUserName: json['host_UserName'],
    );
  }
}
