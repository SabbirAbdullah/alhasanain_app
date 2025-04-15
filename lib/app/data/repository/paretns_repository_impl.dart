import 'package:alhasanain_app/app/data/model/parents_student_list_response.dart';
import 'package:alhasanain_app/app/data/remote/parents_remote_data_source.dart';
import 'package:alhasanain_app/app/data/repository/parents_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ParentsRepositoryImpl extends ParentsRepository{

  final ParentsRemoteDataSource _remoteSource =
  Get.find(tag: (ParentsRemoteDataSource).toString());
  @override
  Future<ParetnsStudentListResponse> getParentsStudentList(String phoneNumber) {
    return _remoteSource.getParentsStudentList(phoneNumber);
    throw UnimplementedError();
  }

}