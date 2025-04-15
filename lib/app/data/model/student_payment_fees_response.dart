class StudentFeesResponse {
  List<Message>? message;

  StudentFeesResponse({this.message});

  StudentFeesResponse.fromJson(Map<String, dynamic> json) {
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
  String? feesInfo;
  String? feesType;
  String? dueDate;
  int? amount;
  String? paymentId;
  String? paymentMode;
  String? paymentDate;
  int? discount;
  int? fine;
  int? paid;
  int? balance;
  String? paymentStatus;
  String? advancePayment;
  int? status2;
  int? status3;
  String? session;
  String? feesMonth;
  String? compile;
  String? initiateTxn;
  String? trxID;
  String? createDate;

  Message(
      {this.id,
        this.studentId,
        this.feesInfo,
        this.feesType,
        this.dueDate,
        this.amount,
        this.paymentId,
        this.paymentMode,
        this.paymentDate,
        this.discount,
        this.fine,
        this.feesMonth,
        this.paid,
        this.balance,
        this.paymentStatus,
        this.advancePayment,
        this.status2,
        this.status3,
        this.session,
        this.compile,
        this.initiateTxn,
        this.trxID,
        this.createDate});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    feesInfo = json['fees_info'];
    feesType = json['feesType'];
    dueDate = json['due_date'];
    amount = json['amount'];
    paymentId = json['payment_id'];
    feesMonth = json['feesMonth'];
    paymentMode = json['payment_mode'];
    paymentDate = json['payment_date'];
    discount = json['discount'];
    fine = json['fine'];
    paid = json['paid'];
    balance = json['balance'];
    paymentStatus = json['paymentStatus'];
    advancePayment = json['advancePayment'];
    status2 = json['status2'];
    status3 = json['status3'];
    session = json['session'];
    compile = json['compile'];
    initiateTxn = json['initiateTxn'];
    trxID = json['trxID'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['fees_info'] = this.feesInfo;
    data['feesType'] = this.feesType;
    data['due_date'] = this.dueDate;
    data['amount'] = this.amount;
    data['payment_id'] = this.paymentId;
    data['feesMonth'] = this.feesMonth;
    data['payment_mode'] = this.paymentMode;
    data['payment_date'] = this.paymentDate;
    data['discount'] = this.discount;
    data['fine'] = this.fine;
    data['paid'] = this.paid;
    data['balance'] = this.balance;
    data['paymentStatus'] = this.paymentStatus;
    data['advancePayment'] = this.advancePayment;
    data['status2'] = this.status2;
    data['status3'] = this.status3;
    data['session'] = this.session;
    data['compile'] = this.compile;
    data['initiateTxn'] = this.initiateTxn;
    data['trxID'] = this.trxID;
    data['create_date'] = this.createDate;
    return data;
  }
}
