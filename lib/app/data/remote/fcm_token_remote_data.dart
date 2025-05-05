import 'package:alhasanain_app/app/network/dio_provider.dart';
import 'package:dio/dio.dart';

class FcmTokenRemoteData {
  final Dio _dio = DioProvider.dioWithHeaderToken;

  Future<Response> sendFcmToken({
    required String user,
    required String type,
    required String token,
  }) async {
    final response = await _dio.post(
      '/server/student/updateDeviceToken',
      data: {
        'type': type,
        'user': user,
        'token': token,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return response;
  }
}
