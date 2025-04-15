import '../model/parents_student_list_response.dart';

abstract class ParentsRepository {
  Future<ParetnsStudentListResponse>getParentsStudentList(String phoneNumber);
}
