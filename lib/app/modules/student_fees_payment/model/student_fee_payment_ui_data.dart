class StudentPaymentFeeUiData {
  int id;
  String studentId;
  String feesInfo;
  String feesType;
  String dueDate;
  int amount;
  String paymentId;
  String paymentMode;
  String paymentDate;
  int discount;
  int fine;
  int paid;
  int balance;
  String paymentStatus;
  String feesMonth;
  String advancePayment;
  int status2;
  int status3;
  String session;
  String compile;
  String initiateTxn;
  String trxID;

  StudentPaymentFeeUiData({
    this.id=0,
    this.studentId = '',
    this.feesInfo = '',
    this.feesType = '',
    this.dueDate = '',
    this.amount = 0,
    this.paymentId = '',
    this.paymentMode = '',
    this.feesMonth = '',
    this.paymentDate = '',
    this.discount = 0,
    this.fine = 0,
    this.paid = 0,
    this.balance = 0,
    this.paymentStatus = '',
    this.advancePayment = '',
    this.status2 = 0,
    this.status3 = 0,
    this.session = '',
    this.compile = '',
    this.initiateTxn = '',
    this.trxID = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['fees_info'] = this.feesInfo;
    data['feesType'] = this.feesType;
    data['due_date'] = this.dueDate;
    data['amount'] = this.amount;
    data['payment_id'] = this.paymentId;
    data['payment_mode'] = this.paymentMode;
    data['payment_date'] = this.paymentDate;
    data['feesMonth'] = this.feesMonth;
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
    return data;
  }

}
