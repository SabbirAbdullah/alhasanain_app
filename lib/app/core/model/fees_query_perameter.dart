class StudentFeesQueryPrem {
  String studentId;
  String feesId;
  String userName;
  String userEmail;
  String userPhone;
  String add1;
  String add2;
  String city;
  String country;
  String amount;
  String currency;
  String desc;
  String selectedFees;

  StudentFeesQueryPrem(
      {required this.studentId,
      required this.city,
      required this.add1,
      required this.add2,
      required this.amount,
      required this.country,
      required this.desc,
      required this.feesId,
      required this.selectedFees,
      required this.userEmail,
      required this.currency,
      required this.userName,
      required this.userPhone});

  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'feesID': feesId,
      'cus_name': userName,
      'cus_email': userEmail,
      'cus_phone': userPhone,
      'cus_add1': add1,
      'cus_add2': add2,
      'cus_city': city,
      'cus_country': country,
      'currency': currency,
      'amount': amount,
      'desc': desc,
      'selectedFees': selectedFees,

    };
  }
}
