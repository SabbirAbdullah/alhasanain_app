import 'dart:convert';

class SingleFeeBodyParam {
  String studentId;
  String feesId;
  String cusName;
  String cusEmail;
  String cusPhone;
  String cusAdd1;
  String cusAdd2;
  String cusCity;
  String cusCountry;
  String amount;
  String currency;
  List<SelectedFees> desc;
  List<SelectedFees> selectedFees;
  String ptype;

  SingleFeeBodyParam({
    required this.studentId,
    required this.feesId,
    required this.cusName,
    required this.cusEmail,
    required this.cusPhone,
    required this.cusAdd1,
    required this.cusAdd2,
    required this.cusCity,
    required this.cusCountry,
    required this.amount,
    required this.currency,
    required this.desc,
    required this.selectedFees,
    required this.ptype,
  });

  factory SingleFeeBodyParam.fromJson(Map<String, dynamic> json) {
    var selectedFeesList = json['selectedFees'] as List;
    List<SelectedFees> selectedFees = selectedFeesList.map((i) => SelectedFees.fromJson(i)).toList();

    return SingleFeeBodyParam(
      studentId: json['studentId'],
      feesId: json['feesID'],
      cusName: json['cus_name'],
      cusEmail: json['cus_email'],
      cusPhone: json['cus_phone'],
      cusAdd1: json['cus_add1'],
      cusAdd2: json['cus_add2'],
      cusCity: json['cus_city'],
      cusCountry: json['cus_country'],
      amount: json['amount'],
      currency: json['currency'],
      desc: json['desc'],
      selectedFees: selectedFees,
      ptype: json['ptype'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> selectedFeesList = selectedFees.map((i) => i.toJson()).toList();


    return {
      'studentId': studentId,
      'feesID': feesId,
      'cus_name': cusName,
      'cus_email': cusEmail,
      'cus_phone': cusPhone,
      'cus_add1': cusAdd1,
      'cus_add2': cusAdd2,
      'cus_city': cusCity,
      'cus_country': cusCountry,
      'amount': amount,
      'currency': currency,
      'desc': jsonEncode(selectedFeesList),
      'selectedFees': jsonEncode(selectedFeesList),
      'ptype': ptype,
    };
  }
}

class SelectedFees {
  int id;
  String studentId;
  String feesInfo;
  String feesType;
  String dueDate;
  double amount;
  String paymentId;
  String paymentMode;
  String paymentDate;
  double discount;
  double fine;
  double paid;
  double balance;
  String paymentStatus;
  String advancePayment;
  int status2;
  int status3;
  String session;
  String compile;
  String initiateTxn;
  String trxID;
  DateTime createDate;

  SelectedFees({
    required this.id,
    required this.studentId,
    required this.feesInfo,
    required this.feesType,
    required this.dueDate,
    required this.amount,
    required this.paymentId,
    required this.paymentMode,
    required this.paymentDate,
    required this.discount,
    required this.fine,
    required this.paid,
    required this.balance,
    required this.paymentStatus,
    required this.advancePayment,
    required this.status2,
    required this.status3,
    required this.session,
    required this.compile,
    required this.initiateTxn,
    required this.trxID,
    required this.createDate,
  });

  factory SelectedFees.fromJson(Map<String, dynamic> json) {
    return SelectedFees(
      id: json['id'],
      studentId: json['student_id'],
      feesInfo: json['fees_info'],
      feesType: json['feesType'],
      dueDate: json['due_date'],
      amount: json['amount'].toDouble(),
      paymentId: json['payment_id'],
      paymentMode: json['payment_mode'],
      paymentDate: json['payment_date'],
      discount: json['discount'].toDouble(),
      fine: json['fine'].toDouble(),
      paid: json['paid'].toDouble(),
      balance: json['balance'].toDouble(),
      paymentStatus: json['paymentStatus'],
      advancePayment: json['advancePayment'],
      status2: json['status2'],
      status3: json['status3'],
      session: json['session'],
      compile: json['compile'],
      initiateTxn: json['initiateTxn'],
      trxID: json['trxID'],
      createDate: DateTime.parse(json['create_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_id': studentId,
      'fees_info': feesInfo,
      'feesType': feesType,
      'due_date': dueDate,
      'amount': amount,
      'payment_id': paymentId,
      'payment_mode': paymentMode,
      'payment_date': paymentDate,
      'discount': discount,
      'fine': fine,
      'paid': paid,
      'balance': balance,
      'paymentStatus': paymentStatus,
      'advancePayment': advancePayment,
      'status2': status2,
      'status3': status3,
      'session': session,
      'compile': compile,
      'initiateTxn': initiateTxn,
      'trxID': trxID,
      'create_date': createDate.toIso8601String(),
    };
  }
}