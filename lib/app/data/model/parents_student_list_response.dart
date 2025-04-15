class ParetnsStudentListResponse {
  List<Message>? message;

  ParetnsStudentListResponse({this.message});

  ParetnsStudentListResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  int? id;
  String? studentId;
  String? parentsName;
  String? phone;
  String? password;
  String? studentFirstName;
  String? studentLastName;

  Message(
      {this.id,
        this.studentId,
        this.parentsName,
        this.phone,
        this.password,
        this.studentFirstName,
        this.studentLastName});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    parentsName = json['parents_name'];
    phone = json['phone'];
    password = json['password'];
    studentFirstName = json['student_first_name'];
    studentLastName = json['student_last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['parents_name'] = this.parentsName;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['student_first_name'] = this.studentFirstName;
    data['student_last_name'] = this.studentLastName;
    return data;
  }
}