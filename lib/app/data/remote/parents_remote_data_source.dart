import '../model/parents_student_list_response.dart';

abstract class ParentsRemoteDataSource{
  Future<ParetnsStudentListResponse>getParentsStudentList(String phoneNumber);
}
