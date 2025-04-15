class ClassRoutineDataResponse {
  bool? ok;
  List<Message>? message;

  ClassRoutineDataResponse({this.ok, this.message});

  ClassRoutineDataResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    if (message != null) {
      data['message'] = message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  int? id;
  String? className;
  String? section;
  String? dayName;
  String? slotName;
  String? subjectName;
  String? teacherID;
  String? session;
  String? teacherFname;
  String? teacherLname;

  Message(
      {this.id,
        this.className,
        this.section,
        this.dayName,
        this.slotName,
        this.subjectName,
        this.teacherID,
        this.session,
        this.teacherFname,
        this.teacherLname});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    className = json['className'];
    section = json['section'];
    dayName = json['dayName'];
    slotName = json['slotName'];
    subjectName = json['subjectName'];
    teacherID = json['teacherID'];
    session = json['session'];
    teacherFname = json['teacher_fname'];
    teacherLname = json['teacher_lname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['className'] = className;
    data['section'] = section;
    data['dayName'] = dayName;
    data['slotName'] = slotName;
    data['subjectName'] = subjectName;
    data['teacherID'] = teacherID;
    data['session'] = session;
    data['teacher_fname'] = teacherFname;
    data['teacher_lname'] = teacherLname;
    return data;
  }
}
