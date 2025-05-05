class ResultPublishInfoModel {
  bool ok;
  List<ResultInfo> message;

  ResultPublishInfoModel({required this.ok, required this.message});

  factory ResultPublishInfoModel.fromJson(Map<String, dynamic> json) {
    return ResultPublishInfoModel(
      ok: json['ok'] ?? false,
      message: (json['message'] as List<dynamic>?)
          ?.map((x) => ResultInfo.fromJson(x))
          .toList() ??
          [],
    );
  }
}

class ResultInfo {
  int id;
  String className;
  String sectionName;
  String campus;
  String type;
  String session;
  String resultFor;
  String status;

  ResultInfo({
    required this.id,
    required this.className,
    required this.sectionName,
    required this.campus,
    required this.type,
    required this.session,
    required this.resultFor,
    required this.status,
  });

  factory ResultInfo.fromJson(Map<String, dynamic> json) {
    return ResultInfo(
      id: json['id'] ?? 0,
      className: json['className'] ?? '',
      sectionName: json['sectionName'] ?? '',
      campus: json['campus'] ?? '',
      type: json['type'] ?? '',
      session: json['session'] ?? '',
      resultFor: json['resultFor'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
