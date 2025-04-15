class SubjectListResponse {
  bool? ok;
  List<Message>? message;

  SubjectListResponse({this.ok, this.message});

  SubjectListResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
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
  String? className;
  String? subjectName;
  String? session;
  String? pstatus;

  Message(
      {this.id, this.className, this.subjectName, this.session, this.pstatus});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    className = json['class_name'];
    subjectName = json['subject_name'];
    session = json['session'];
    pstatus = json['pstatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['class_name'] = this.className;
    data['subject_name'] = this.subjectName;
    data['session'] = this.session;
    data['pstatus'] = this.pstatus;
    return data;
  }
}