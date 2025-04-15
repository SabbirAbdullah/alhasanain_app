
class Subject {
  final String subject;
  final String lessonPlan;
  final String books;
  final String notebooks;
  final String homework;

  Subject({
    required this.subject,
    required this.lessonPlan,
    required this.books,
    required this.notebooks,
    required this.homework,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      subject: json['subject'],
      lessonPlan: json['lesson_plan'],
      books: json['books'],
      notebooks: json['notebooks'],
      homework: json['homework'],
    );
  }
}

class DaySchedule {
  final String day;
  final List<Subject> subjects;

  DaySchedule({
    required this.day,
    required this.subjects,
  });

  factory DaySchedule.fromJson(Map<String, dynamic> json) {
    return DaySchedule(
      day: json['day'],
      subjects: List<Subject>.from(json['subjects'].map((x) => Subject.fromJson(x))),
    );
  }
}

class WeeklyScheduleResponse {
  final String startDate;
  final String endDate;
  final String campus;
  final String session;
  final List<DaySchedule> days;

  WeeklyScheduleResponse({
    required this.startDate,
    required this.endDate,
    required this.campus,
    required this.session,
    required this.days,
  });

  factory WeeklyScheduleResponse.fromJson(Map<String, dynamic> json) {
    return WeeklyScheduleResponse(
      startDate: json['start_date'],
      endDate: json['end_date'],
      campus: json['campus'],
      session: json['session'],
      days: List<DaySchedule>.from(json['days'].map((x) => DaySchedule.fromJson(x))),
    );
  }
}
