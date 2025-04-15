// Homework Model
class Homework {
  final int? id; // Make nullable
  final String? school; // Make nullable
  final String? termName; // Make nullable
  final String? className; // Make nullable
  final String? section; // Make nullable
  final String? subject; // Make nullable
  final String? title; // Make nullable
  final String? description; // Already nullable
  final String? media; // Already nullable
  final String? date; // Make nullable
  final int? weeklyDateId; // Make nullable
  final String? creatorID; // Make nullable
  final String? creatorName; // Make nullable
  final String? session; // Make nullable
  final String? progress; // Make nullable

  Homework({
    this.id,
    this.school,
    this.termName,
    this.className,
    this.section,
    this.subject,
    this.title,
    this.description,
    this.media,
    this.date,
    this.weeklyDateId,
    this.creatorID,
    this.creatorName,
    this.session,
    this.progress,
  });

  factory Homework.fromJson(Map<String, dynamic> json) {
    return Homework(
      id: json['id'],
      school: json['school'],
      termName: json['termName'],
      className: json['className'],
      section: json['section'],
      subject: json['subject'],
      title: json['title'],
      description: json['description'],
      media: json['media'],
      date: json['date'],
      weeklyDateId: json['weekly_date_id'],
      creatorID: json['creatorID'],
      creatorName: json['creatorName'],
      session: json['session'],
      progress: json['progress'],
    );
  }
}
