import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/values/text_styles.dart';
import 'package:alhasanain_app/app/core/values/url.dart';
import 'package:alhasanain_app/app/modules/complain/view/complain_box_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/widget/loading.dart';
import '../../home/model/student_ui_data.dart';
import '../controllers/complain_box_controller.dart';

class Complain extends StatelessWidget {
  final StudentDataResponseUi studentDataResponseUi;
  final ComplainController controller;

  Complain({super.key, required this.studentDataResponseUi})
      : controller = Get.put(ComplainController(studentDataResponseUi));

  @override
  Widget build(BuildContext context) {
    controller.fetchComplains();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Complain Box'),
        backgroundColor: AppColors.appBarColor,
      ),
      backgroundColor: AppColors.pageBackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 20,
                width: 118,
                child: Text(
                  'Past Complains',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.appBarColor),
                )),
            Obx(() {
              if (controller.isLoading.value) return Loading();
              if (controller.errorMessage.isNotEmpty)
                return Text(controller.errorMessage.value);
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.complainList.length,
                  itemBuilder: (_, index) {
                    final item = controller.complainList[index];

                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${item.complainType}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: 13),
                                  ),
                              PopupMenuButton<String>(
                                color: Colors.white,
                                padding: EdgeInsets.all(1),
                                          onSelected: (value) {
                                            if (value == 'delete') {
                                              controller.deleteComplain(item.id);

                                            }
                                          },
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: 'delete',
                                              child: Text('Delete'),
                                            ),
                                          ],
                                        ),

                                ],
                              ),

                              Obx(() {
                                final isExpanded = controller.isCardExpanded(item.id);

                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${item.complainDes}',
                                      maxLines: isExpanded ? null : 2,
                                      overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    GestureDetector(
                                      onTap: () {
                                        controller.toggleExpanded(item.id);
                                      },
                                      child: Text(
                                        isExpanded ? 'See Less' : 'See More',
                                        style: greyText_13_400,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              SizedBox(
                                height: 16,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    controller.isLoading.value
                                        ?CircularProgressIndicator()
                                    :showImagePreview(
                                        '${AppUrl.baseImageUrl}/${item.img}');
                                  },
                                  child: const Text('See Attachment')),
                              const SizedBox(
                                height: 16,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${item.phone}',
                                    style: greyText_13_400,
                                  ),

                                  Text(
                                    DateFormat('hh:mm a, dd-MMMM-yyyy').format(DateTime.parse("${item.date}")),
                                    style: greyText_13_400,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        color: Colors.white,
        surfaceTintColor: AppColors.appBarColor,
        child: TextButton(
          onPressed: () {
            Get.to(() => ComplainPage(
                  studentDataResponseUi: studentDataResponseUi,
                ));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.appBarColor, width: 1)),
            child: const Center(
              child: Text(
                'Add New Complain',
                style: blueText14_600,
              ),
            ),
          ),
        ),
      ),
    );
  }


  showImagePreview(String imagePath) {
    Get.dialog(
      barrierColor: Colors.black87,
      Dialog(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: -10,
              right: -10,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 20),
                onPressed: () {
                  Get.back(); // Close the dialog
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
