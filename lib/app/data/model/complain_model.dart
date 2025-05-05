class ComplainRequestModel {
  final String complainBy;
  final String complainDes;
  final String complainType;
  final String date;
  final String session;
  final String phone;
  final String compile;
  final int status;
  final String imgPath; // local image path

  ComplainRequestModel({
    required this.complainBy,
    required this.complainDes,
    required this.complainType,
    required this.date,
    required this.session,
    required this.phone,
    required this.compile,
    required this.status,
    required this.imgPath,
  });
}

class ComplainViewModel {
  final int id;
  final String session;
  final String complainType;
  final String complainBy;
  final String phone;
  final String complainDes;
  final String img;
  final String status;
  final String date;
  final String compile;

  ComplainViewModel({
    required this.id,
    required this.session,
    required this.complainType,
    required this.complainBy,
    required this.phone,
    required this.complainDes,
    required this.img,
    required this.status,
    required this.date,
    required this.compile,
  });

  factory ComplainViewModel.fromJson(Map<String, dynamic> json) {
    return ComplainViewModel(
      id: json['id'],
      session: json['session'],
      complainType: json['complain_type'],
      complainBy: json['complainBy'],
      phone: json['phone'],
      complainDes: json['complain_des'],
      img: json['img'],
      status: json['status'],
      date: json['date'],
      compile: json['compile'],
    );
  }
}

// models/delete_response_model.dart
class ComplainDeleteResponseModel {
  final int affectedRows;

  ComplainDeleteResponseModel({required this.affectedRows});

  factory ComplainDeleteResponseModel.fromJson(Map<String, dynamic> json) {
    return ComplainDeleteResponseModel(
      affectedRows: json['message']['affectedRows'] ?? 0,
    );
  }
}
