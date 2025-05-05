import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:alhasanain_app/app/core/widget/loading.dart';
import 'package:alhasanain_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
import '../../event_and_news/view/event_news_view.dart';
import '../../exam_schedule/view/exam_schedule_view.dart';
import '../../home/model/student_ui_data.dart';
import '../../home_mid/CT/views/ct_view.dart';
import '../../home_mid/eDiary/views/eDiary_view.dart';
import '../../home_mid/result/monthly_report/view/monthly_report_view.dart';
import '../../home_mid/result/term_report/view/term_report.dart';
import '../../incident_report/view/incident_view.dart';
import '../../student_fees_payment/view/student_fees_payment_view.dart';
import '../controller/notification_controller.dart';

class NotificationHistoryPage extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  final StudentDataResponseUi ? studentDataResponseUi;
   NotificationHistoryPage({super.key,  this.studentDataResponseUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: CustomAppBar(appBarTitleText: "Notifications"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: Loading());
          }

          if (controller.notifications.isEmpty) {
            return Center(child: Text('No notifications'));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.notifications.length,
                  itemBuilder: (context, index) {
                    final notification = controller.notifications[index];
                    return GestureDetector(
                      onTap: () async {
                        await controller.markAsRead(notification);

                        switch (notification.section) {
                          case 'fees':
                            Get.to(() => StudentFeesPaymentView());
                            break;
                          case 'diary':
                            Get.to(() => EDairyView());
                            break;
                          case 'incidentReport':
                            Get.to(() => IncidentView(studentDataResponseUi:studentDataResponseUi! ,));
                            break;
                          case 'ExamSchedule':
                            Get.to(() => ExamSchedulePage());
                            break;
                          case 'classtest':
                            Get.to(() => CtScreen());
                            break;
                          case 'TermReport':
                            Get.to(() => ResultPage(
                              studentDataResponseUi: studentDataResponseUi!,

                            ));
                            break;
                          case 'MonthlyReport':
                            Get.to(() => MonthlyProgressView(
                              studentDataResponseUi: studentDataResponseUi!,

                            ));
                            break;
                          case 'Event':
                            Get.to(() => EventNewsView());
                            break;
                          default:
                            Get.snackbar('No Page', 'No page found for this notification.');
                        }
                      },
                      child: Card(
                        elevation: 0,
                        color: notification.readMsg ? Colors.grey.shade200 : Colors.blue.shade50,
                        child: ListTile(
                          title: Text(
                            notification.title,
                            style: TextStyle(
                              fontWeight: notification.readMsg ? FontWeight.w500 : FontWeight.w600,
                              fontSize: notification.readMsg ? 12 : 14
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(notification.body,style: TextStyle(fontSize: 11),),
                              Text(
                                DateFormat('hh:mm a, dd-MMMM-yyyy').format(DateTime.parse("${notification.date}")),
                                style: TextStyle(fontSize: 11),
                              ),


                            ],
                          ),
                          trailing: Icon(size: 20,
                            notification.readMsg
                                ? Icons.task_alt_outlined
                                : Icons.mark_email_unread_outlined,
                            color: notification.readMsg ? Colors.grey : Colors.blue,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: controller.currentPage.value > 1
                        ? () => controller
                            .changePage(controller.currentPage.value - 1)
                        : null,
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text(
                      'Page ${controller.currentPage.value} of ${controller.totalPages.value}',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
                  IconButton(
                    onPressed: controller.currentPage.value <
                            controller.totalPages.value
                        ? () => controller
                            .changePage(controller.currentPage.value + 1)
                        : null,
                    icon: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          );
        }),
      ),
    );
  }
}

void navigateEventNews(dynamic homeController) {
  Get.toNamed(Routes.EVENT_AND_NEWS,
      arguments: homeController.studentDataList[0]);
}