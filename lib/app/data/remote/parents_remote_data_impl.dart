import 'package:alhasanain_app/app/core/base/base_remote_source.dart';
import 'package:alhasanain_app/app/data/model/parents_student_list_response.dart';
import 'package:alhasanain_app/app/data/remote/parents_remote_data_source.dart';
import 'package:dio/src/response.dart';

import '../../network/dio_provider.dart';

class ParetnsRemoteDataImpl extends BaseRemoteSource implements ParentsRemoteDataSource{
  @override
  Future<ParetnsStudentListResponse> getParentsStudentList(String phone) {
    var endpoint = "${DioProvider.baseUrl}/server/student/getParentsChild";
    var dioCall = dioClient.post(endpoint,data: {
      "phone":phone
    });

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseParentsStudentListResponse(response));
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

}

_parseParentsStudentListResponse(Response response) {
  return ParetnsStudentListResponse.fromJson(response.data);
}