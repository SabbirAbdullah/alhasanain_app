abstract class AuthenticationRepository {
  Future<Map<String,dynamic>> userLogin(String phoneNumber, String password, String type);
}
