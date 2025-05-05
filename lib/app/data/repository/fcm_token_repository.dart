
import '../remote/fcm_token_remote_data.dart';

class FcmRepository {
  final FcmTokenRemoteData  _apiService = FcmTokenRemoteData();

  Future<bool> updateDeviceToken(String user, String type, String token) async {
    try {
      final response = await _apiService.sendFcmToken(
        user: user,
        type: type,
        token: token,
      );
      return response.statusCode == 200;
    } catch (e) {
      print("Repository error: $e");
      return false;
    }
  }
}
