class StudentDiaryResponse {
  bool? ok;
  List<Message>? message;

  StudentDiaryResponse({this.ok, this.message});

  StudentDiaryResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) { message!.add(new Message.fromJson(v)); });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  int? id;
  String? studentId;
  String? studentClass;
  String? section;
  String? subject;
  String? session;
  String? note;
  String? date;

  Message({this.id, this.studentId, this.studentClass, this.section, this.subject, this.session, this.note, this.date});

  Message.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  studentId = json['student_id'];
  studentClass = json['class'];
  section = json['section'];
  subject = json['subject'];
  session = json['session'];
  note = json['note'];
  date = json['date'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['student_id'] = this.studentId;
  data['class'] = this.studentClass;
  data['section'] = this.section;
  data['subject'] = this.subject;
  data['session'] = this.session;
  data['note'] = this.note;
  data['date'] = this.date;
  return data;
  }
}

