import 'dart:convert';

class SingleStudentPreTermReportResponse {
  bool? ok;
  List<Message>? message;

  SingleStudentPreTermReportResponse({this.ok, this.message});

  SingleStudentPreTermReportResponse.fromJson(Map<String, dynamic> json) {
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
  String? type;
  String? termName;
  String? className;
  String? section;
  String? studentId;
  String? studentName;
  String? description;
  String? creatorID;
  String? creatorName;
  String? session;

  Message(
      {this.id,
        this.type,
        this.termName,
        this.className,
        this.section,
        this.studentId,
        this.studentName,
        this.description,
        this.creatorID,
        this.creatorName,
        this.session});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    termName = json['termName'];
    className = json['className'];
    section = json['section'];
    studentId = json['student_id'];
    studentName = json['student_name'];
    description = json['description'];
    creatorID = json['creatorID'];
    creatorName = json['creatorName'];
    session = json['session'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['termName'] = this.termName;
    data['className'] = this.className;
    data['section'] = this.section;
    data['student_id'] = this.studentId;
    data['student_name'] = this.studentName;
    data['description'] = this.description;
    data['creatorID'] = this.creatorID;
    data['creatorName'] = this.creatorName;
    data['session'] = this.session;
    return data;
  }
}




class SegmentItem {
  String question;
  String answer;

  SegmentItem({required this.question, required this.answer});

  factory SegmentItem.fromJson(Map<String, dynamic> json) {
    return SegmentItem(
      question: json['question'],
      answer: json['answer'],
    );
  }
}

class Segment {
  String segmentName;
  List<SegmentItem> segmentItems;

  Segment({required this.segmentName, required this.segmentItems});

  factory Segment.fromJson(Map<String, dynamic> json) {
    var segmentItemsList = json['segmentItem'] as List;
    List<SegmentItem> items = segmentItemsList
        .map((segmentItem) => SegmentItem.fromJson(segmentItem))
        .toList();

    return Segment(
      segmentName: json['segmentName'],
      segmentItems: items,
    );
  }
}