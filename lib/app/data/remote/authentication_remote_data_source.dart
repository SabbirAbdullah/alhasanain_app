abstract class AuthenticationRemoteDataSource{
  Future<Map<String,dynamic>>studentParentsLogin(String phoneNumber, String password, String type);
}