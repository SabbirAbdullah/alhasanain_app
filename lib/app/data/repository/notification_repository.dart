// lib/data/repository/notification_repository.dart



import 'package:alhasanain_app/app/data/model/notification_model.dart';

import '../remote/notification_remote_data.dart';

class NotificationRepository {
  final NotificationRemoteData apiService = NotificationRemoteData();

  Future<NotificationResponseModel> fetchNotifications({required String studentId, required int page}) {
    return apiService.getNotifications(studentId: studentId, page: page);
  }

  Future<bool> markNotificationAsRead(int id) {
    return apiService.updateReadNotification(id: id);
  }
}
