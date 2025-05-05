import 'package:alhasanain_app/app/network/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

import '../model/complain_model.dart';

class ComplainRemoteData {
  final Dio _dio = DioProvider.dioWithHeaderToken;

  Future<bool> submitComplain(ComplainRequestModel model) async {
    String url = '/server/addComplainBox';

    final mimeTypeData = lookupMimeType(model.imgPath)!.split('/');

    FormData formData = FormData.fromMap({
      "complainBy": model.complainBy,
      "complain_des": model.complainDes,
      "complain_type": model.complainType,
      "date": model.date,
      "session": model.session,
      "phone": model.phone,
      "compile": model.compile,
      "status": model.status.toString(),
      "img": await MultipartFile.fromFile(
        model.imgPath,
        filename: model.imgPath.split('/').last,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
      ),
    });

    final response = await _dio.post(url, data: formData);

    if (response.statusCode == 200) {
      return response.data['message'] == true;
    } else {
      throw Exception('Failed to submit complain');
    }
  }

  Future<List<ComplainViewModel>> fetchComplains(String phone) async {
    try {
      final response = await _dio.post("/server/getComplainBoxDataByUser", data: {'phone': phone});
      final List data = response.data['message'];
      return data.map((json) => ComplainViewModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch complaints: $e');
    }
  }

  Future<ComplainDeleteResponseModel> deleteComplainById(int id) async {
    const url = '/server/DeleteComplainBoxDataById';

    final response = await _dio.post(url, data: {'id': id});
    return ComplainDeleteResponseModel.fromJson(response.data);
  }
}
