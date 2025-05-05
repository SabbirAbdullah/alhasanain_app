class StudentCTDataResponse {
  bool? ok;
  List<Message>? message;
  int? totalPage;

  StudentCTDataResponse({this.ok, this.message, this.totalPage});

  StudentCTDataResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    data['totalPage'] = this.totalPage;
    return data;
  }
}

class Message {
  int? id;
  String? termName;
  String? school;
  String? className;
  String ? campus;
  String? section;
  String? subject;
  String? title;
  String? marks;
  String? date;
  String? creatorID;
  String? creatorName;
  String? session;
  String? obtainMarks;

  Message(
      {this.id,
        this.termName,
        this.school,
        this.className,
        this.section,
        this.subject,
        this.title,
        this.marks,
        this.date,
        this.creatorID,
        this.creatorName,
        this.session,
        this.obtainMarks});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    termName = json['termName'];
    school = json['school'];
    campus = json['campus'];
    className = json['className'];
    section = json['section'];
    subject = json['subject'];
    title = json['title'];
    marks = json['marks'];
    date = json['date'];
    creatorID = json['creatorID'];
    creatorName = json['creatorName'];
    session = json['session'];
    obtainMarks = json['obtain_marks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['termName'] = this.termName;
    data['school'] = this.school;
    data['className'] = this.className;
    data['section'] = this.section;
    data['campus']= this.campus;
    data['subject'] = this.subject;
    data['title'] = this.title;
    data['marks'] = this.marks;
    data['date'] = this.date;
    data['creatorID'] = this.creatorID;
    data['creatorName'] = this.creatorName;
    data['session'] = this.session;
    data['obtain_marks'] = this.obtainMarks;
    return data;
  }
}


