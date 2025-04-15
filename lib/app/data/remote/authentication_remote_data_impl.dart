import 'package:alhasanain_app/app/core/base/base_remote_source.dart';
import 'package:alhasanain_app/app/data/remote/authentication_remote_data_source.dart';

import '../../network/dio_provider.dart';

class AuthenticationRemoteDataImpl extends BaseRemoteSource implements AuthenticationRemoteDataSource{
  @override
  Future<Map<String, dynamic>> studentParentsLogin(String phoneNumber, String password, String type) {
    var endpoint = "${DioProvider.baseUrl}/server/student/studentParentLogin";
    var dioCall = dioClient.post(endpoint,data: {
      "phone": phoneNumber, //unique
      "password": password,
      "type":type
    } );


    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => response.data);
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

}