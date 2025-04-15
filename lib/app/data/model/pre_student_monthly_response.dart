class PreStudentMonthlyResponse {
  bool? ok;
  Message? message;

  PreStudentMonthlyResponse({this.ok, this.message});

  PreStudentMonthlyResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  List<Result>? result;
  List<Result2>? result2;
  List<Result3>? result3;

  Message({this.result, this.result2, this.result3});

  Message.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    if (json['result2'] != null) {
      result2 = <Result2>[];
      json['result2'].forEach((v) {
        result2!.add(new Result2.fromJson(v));
      });
    }
    if (json['result3'] != null) {
      result3 = <Result3>[];
      json['result3'].forEach((v) {
        result3!.add(new Result3.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    if (this.result2 != null) {
      data['result2'] = this.result2!.map((v) => v.toJson()).toList();
    }
    if (this.result3 != null) {
      data['result3'] = this.result3!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? studentId;
  String? studentName;
  String? subject;
  int? doneHomeWork;
  int? totalHomeWork;
  int? doneClassWork;
  int? totalClassWork;

  Result(
      {this.studentId,
        this.studentName,
        this.subject,
        this.doneHomeWork,
        this.totalHomeWork,
        this.doneClassWork,
        this.totalClassWork});

  Result.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    studentName = json['student_name'];
    subject = json['subject'];
    doneHomeWork = json['doneHomeWork'];
    totalHomeWork = json['TotalHomeWork'];
    doneClassWork = json['doneClassWork'];
    totalClassWork = json['TotalClassWork'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['student_name'] = this.studentName;
    data['subject'] = this.subject;
    data['doneHomeWork'] = this.doneHomeWork;
    data['TotalHomeWork'] = this.totalHomeWork;
    data['doneClassWork'] = this.doneClassWork;
    data['TotalClassWork'] = this.totalClassWork;
    return data;
  }
}

class Result2 {
  String? studentId;
  String? studentName;
  String? subject;
  String? selectedTestID;
  String? selectedTest;
  String? totalMarks;
  String? obtainMarks;

  Result2(
      {this.studentId,
        this.studentName,
        this.subject,
        this.selectedTestID,
        this.selectedTest,
        this.totalMarks,
        this.obtainMarks});

  Result2.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    studentName = json['student_name'];
    subject = json['subject'];
    selectedTestID = json['selectedTestID'];
    selectedTest = json['selectedTest'];
    totalMarks = json['total_marks'];
    obtainMarks = json['obtain_marks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['student_name'] = this.studentName;
    data['subject'] = this.subject;
    data['selectedTestID'] = this.selectedTestID;
    data['selectedTest'] = this.selectedTest;
    data['total_marks'] = this.totalMarks;
    data['obtain_marks'] = this.obtainMarks;
    return data;
  }
}

class Result3 {
  int? totalPresentDays;
  int? totalWorkingDays;

  Result3({this.totalPresentDays, this.totalWorkingDays});

  Result3.fromJson(Map<String, dynamic> json) {
    totalPresentDays = json['totalPresentDays'];
    totalWorkingDays = json['totalWorkingDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPresentDays'] = this.totalPresentDays;
    data['totalWorkingDays'] = this.totalWorkingDays;
    return data;
  }
}