import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/widget/pdf_viewer.dart';
import '../controller/exam_schedule_controller.dart';

class ExamSchedulePage extends StatelessWidget {
  final ExamScheduleController controller = Get.put(ExamScheduleController());

  ExamSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger fetch on build (you can move to onInit in controller if preferred)
    controller.fetchSchedule();

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        title: const Text("Exam Schedule"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: Loading());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        if (controller.examSchedules.isEmpty) {
          return const Center(child: Text("No exam schedules found."));
        }
        return ListView.builder(
          itemCount: controller.examSchedules.length,
          itemBuilder: (context, index) {
            final item = controller.examSchedules[index];
            return Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
              child: ListTile(
                  title: Text(item.title??'No Title',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),),
                  subtitle: Text('Session: ${item.session ?? ''}',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                  trailing: const Icon(Icons.picture_as_pdf, color: Colors.red),
                  onTap: () {
                    final mediaUrl = item.media;
                    if (mediaUrl != null && mediaUrl.isNotEmpty) {
                      final fullUrl = 'https://server.alhasanain.com.bd/server/public/image/$mediaUrl';
                      Get.to(() => PdfViewerPage(
                        pdfUrl: fullUrl,
                        title: item.title ?? 'Exam Schedule',
                      ));
                    } else {
                      Get.snackbar("No File", "No PDF available for this schedule");
                    }
                  },
                
              ),
            );
          },
        );

      }),
    );
  }
}
