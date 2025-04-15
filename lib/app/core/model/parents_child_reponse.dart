class ParentsChildResponse {
  int? id;
  String? studentId;
  String? parentsName;
  String? phone;
  String? password;
  String? studentFirstName;
  String? studentLastName;

  ParentsChildResponse(
      {this.id,
        this.studentId,
        this.parentsName,
        this.phone,
        this.password,
        this.studentFirstName,
        this.studentLastName});

  ParentsChildResponse.fromJson(Map<String, dynamic> json) {
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