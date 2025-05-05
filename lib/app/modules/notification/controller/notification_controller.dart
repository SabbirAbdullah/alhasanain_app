import 'package:alhasanain_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import '../../../data/model/notification_model.dart';
import '../../../data/repository/notification_repository.dart';
import '../../../data/repository/pref_repository.dart';
import '../../home/model/student_ui_data.dart';


class NotificationController extends GetxController {
  final NotificationRepository repository = Get. put(NotificationRepository());
  final HomeController homeController = Get.put(HomeController());
  final PrefRepository _prefRepository =
  Get.find(tag: (PrefRepository).toString());
  String id = '';
  var notifications = <NotificationItem>[].obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var isLoading = false.obs;
  var unseenCount = 0.obs;


  @override
  void onInit() {
    super.onInit();
    fetchNotifications(page: 1);
  }

  void fetchNotifications({required int page}) async {
    var studentId = await _prefRepository.getString("id");
    if (id != '') {
      studentId = id;
    }
    try {
      isLoading(true);
      final response = await repository.fetchNotifications(studentId: studentId, page: page);
      notifications.assignAll(response.notifications);
      currentPage.value = response.currentPage;
      totalPages.value = response.totalPages;
      updateUnseenCount();
    } catch (e) {
      print('Error fetching notifications: $e');
    } finally {
      isLoading(false);
    }
  }

  void updateUnseenCount() {
    unseenCount.value = notifications.where((n) => !n.readMsg).length;
  }

  Future<void> markAsRead(NotificationItem notification) async {
    if (!notification.readMsg) {
      final success = await repository.markNotificationAsRead(notification.id);
      if (success) {
        notification.readMsg = true;
        updateUnseenCount();
        notifications.refresh(); // update the UI
      }
    }
  }

  void changePage(int page) {
    if (page > 0 && page <= totalPages.value) {
      fetchNotifications(page: page);
    }
  }
}
