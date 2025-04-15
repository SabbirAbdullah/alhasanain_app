import 'dart:core';

class StudentEventNews {
  bool? ok;
  List<Message>? message;

  StudentEventNews({this.ok, this.message});

  StudentEventNews.fromJson(Map<String, dynamic> json) {
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
  String? eventFor;
  String? eventType;
  String? studentClass;
  String? name;
  String? image;
  String? des;
  String? fromDate;
  String? toDate;
  String? session;
  String? createAt;

  Message({this.id, this.eventFor, this.eventType, this.studentClass, this.name, this.image, this.des, this.fromDate, this.toDate, this.session, this.createAt});

  Message.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  eventFor = json['event_for'];
  eventType = json['event_type'];
  studentClass = json['class'];
  name = json['name'];
  image = json['image'];
  des = json['des'];
  fromDate = json['fromDate'];
  toDate = json['toDate'];
  session = json['session'];
  createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['event_for'] = this.eventFor;
  data['event_type'] = this.eventType;
  data['class'] = this.studentClass;
  data['name'] = this.name;
  data['image'] = this.image;
  data['des'] = this.des;
  data['fromDate'] = this.fromDate;
  data['toDate'] = this.toDate;
  data['session'] = this.session;
  data['createAt'] = this.createAt;
  return data;
  }
}