import 'package:alhasanain_app/app/data/remote/authentication_remote_data_source.dart';
import 'package:alhasanain_app/app/data/repository/authentication_repository.dart';
import 'package:get/get.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository{

  final AuthenticationRemoteDataSource _remoteSource =
  Get.find(tag: (AuthenticationRemoteDataSource).toString());
  @override
  Future<Map<String, dynamic>> userLogin(String phoneNumber, String password, String type) {
    return _remoteSource.studentParentsLogin(phoneNumber, password, type);
    throw UnimplementedError();
  }
}