class StudentHomeWorkDataResponse {
  bool? ok;
  List<Message>? message;
  int? totalPage;

  StudentHomeWorkDataResponse({this.ok, this.message, this.totalPage});

  StudentHomeWorkDataResponse.fromJson(Map<String, dynamic> json) {
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
  String? school;
  String? termName;
  String? className;
  String? section;
  String? subject;
  String? title;
  String? date;
  String? creatorID;
  String? creatorName;
  String? session;
  String? progress;

  Message(
      {this.id,
        this.school,
        this.termName,
        this.className,
        this.section,
        this.subject,
        this.title,
        this.date,
        this.creatorID,
        this.creatorName,
        this.session,
        this.progress});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    school = json['school'];
    termName = json['termName'];
    className = json['className'];
    section = json['section'];
    subject = json['subject'];
    title = json['title'];
    date = json['date'];
    creatorID = json['creatorID'];
    creatorName = json['creatorName'];
    session = json['session'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school'] = this.school;
    data['termName'] = this.termName;
    data['className'] = this.className;
    data['section'] = this.section;
    data['subject'] = this.subject;
    data['title'] = this.title;
    data['date'] = this.date;
    data['creatorID'] = this.creatorID;
    data['creatorName'] = this.creatorName;
    data['session'] = this.session;
    data['progress'] = this.progress;
    return data;
  }
}