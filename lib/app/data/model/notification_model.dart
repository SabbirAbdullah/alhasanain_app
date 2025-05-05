class NotificationResponseModel {
  final int currentPage;
  final int totalPages;
  final int totalNotifications;
  final List<NotificationItem> notifications;

  NotificationResponseModel({
    required this.currentPage,
    required this.totalPages,
    required this.totalNotifications,
    required this.notifications,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      totalNotifications: json['totalNotifications'],
      notifications: List<NotificationItem>.from(
        json['notifications'].map((x) => NotificationItem.fromJson(x)),
      ),
    );
  }
}

class NotificationItem {
  final int id;
  final String user;
  final String title;
  final String body;
  final String section;
  final String contentId;
  final DateTime date;
  bool readMsg;

  NotificationItem({
    required this.id,
    required this.user,
    required this.title,
    required this.body,
    required this.section,
    required this.contentId,
    required this.date,
    required this.readMsg,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      user: json['user'],
      title: json['title'],
      body: json['body'],
      section: json['section'],
      contentId: json['content_Id'],
      date: DateTime.parse(json['date']),
      readMsg: json['readMsg'] == "true", // API gives "true"/"false" string
    );
  }
}
