// Classwork Model
class Classwork {
  final int? id;
  final String? school;
  final String? termName;
  final String? className;
  final String? section;
  final String? subject;
  final String? title;
  final String? description;
  final String? media;
  final String? date;
  final int? weeklyDateId;
  final String? creatorID;
  final String? creatorName;
  final String? session;
  final String? progress;

  Classwork({
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

  factory Classwork.fromJson(Map<String, dynamic> json) {
    return Classwork(
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
