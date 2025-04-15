class AcademicCalenderResponse {
  bool? ok;
  List<Message>? message;

  AcademicCalenderResponse({this.ok, this.message});

  AcademicCalenderResponse.fromJson(Map<String, dynamic> json) {
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
  int? eventID;
  String? title;
  String? start;
  String? end;
  String? eventType;
  String? purpose;
  String? hostUserName;

  Message(
      {this.eventID,
        this.title,
        this.start,
        this.end,
        this.eventType,
        this.purpose,
        this.hostUserName});

  Message.fromJson(Map<String, dynamic> json) {
    eventID = json['event_ID'];
    title = json['title'];
    start = json['start'];
    end = json['end'];
    eventType = json['event_Type'];
    purpose = json['purpose'];
    hostUserName = json['host_UserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_ID'] = this.eventID;
    data['title'] = this.title;
    data['start'] = this.start;
    data['end'] = this.end;
    data['event_Type'] = this.eventType;
    data['purpose'] = this.purpose;
    data['host_UserName'] = this.hostUserName;
    return data;
  }
}