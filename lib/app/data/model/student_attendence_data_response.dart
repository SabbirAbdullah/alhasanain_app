class StudentAttandanceDataResponse {
  bool? ok;
  List<Message>? message;

  StudentAttandanceDataResponse({this.ok, this.message});

  StudentAttandanceDataResponse.fromJson(Map<String, dynamic> json) {
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
  String? studentName;
  String? termName;
  String? Class;
  String? school;
  String? section;
  int? attendance;
  String? date;
  String? session;
  String? creatorID;
  String? creatorName;

  Message({this.id, this.studentId, this.studentName, this.termName, this.Class, this.school, this.section, this.attendance, this.date, this.session, this.creatorID, this.creatorName});

  Message.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  studentId = json['student_id'];
  studentName = json['student_name'];
  termName = json['termName'];
  Class = json['class'];
  school = json['school'];
  section = json['section'];
  attendance = json['attendance'];
  date = json['date'];
  session = json['session'];
  creatorID = json['creatorID'];
  creatorName = json['creatorName'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['student_id'] = this.studentId;
  data['student_name'] = this.studentName;
  data['termName'] = this.termName;
  data['class'] = this.Class;
  data['school'] = this.school;
  data['section'] = this.section;
  data['attendance'] = this.attendance;
  data['date'] = this.date;
  data['session'] = this.session;
  data['creatorID'] = this.creatorID;
  data['creatorName'] = this.creatorName;
  return data;
  }
}


