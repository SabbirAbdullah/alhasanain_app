import 'package:alhasanain_app/app/network/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../model/notification_model.dart';


class NotificationRemoteData {
  final Dio _dio = DioProvider.dioWithHeaderToken;

  Future<NotificationResponseModel> getNotifications({required String studentId, required int page}) async {
    final response = await _dio.post(
      '/server/getNotificationForStudent',
      data: {
        "studentId": studentId,
        "page": page,
      },
    );
    return NotificationResponseModel.fromJson(response.data);
  }

  Future<bool> updateReadNotification({required int id}) async {
    final response = await _dio.post(
      '/server/UpdateReadNotification',
      data: {
        "id": id,
      },
    );
    return response.data['message'] ?? false;
  }
}
