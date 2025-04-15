import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/values/text_styles.dart';
import 'package:alhasanain_app/app/modules/complain/view/complain_box_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/complain_box_controller.dart';

final  ComplainController controller = Get.put(ComplainController());

class Complain extends StatefulWidget {
  const Complain({super.key});

  @override
  State<Complain> createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Complain Box'),
        backgroundColor: AppColors.appBarColor,
      ),
      backgroundColor: AppColors.pageBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Technical Issues",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 13),
                          ),
                        ],
                      ),
                      Obx(
                            () =>Column(
                                mainAxisSize: MainAxisSize.min,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                              Text( 'I am concerned about the cleanliness and of the school premises. The playground and hallways often have litter, and the washrooms need regular cleaning.',
                                maxLines: controller.isExpanded.value ? null : 2,
                                overflow: controller.isExpanded.value ? TextOverflow.visible : TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {
                                  controller.toggleExpanded();
                                },
                                child: Text(
                                  controller.isExpanded.value ? 'See Less' : 'See More',
                                  style: greyText_13_400,
                                ),
                              ),
                                                        ],
                                                      ),

                      ),

                      const SizedBox(
                        height: 16,
                      ),
                       GestureDetector(
                            onTap:  () {
                              controller.showImagePreview('assets/images/Complain_image.png');
                            },
                            child: const Text('See Attachment')
                        ),

                      const SizedBox(height: 16,),
                      const Text(
                        'Muntasir Hasan',
                        style: greyText_13_400,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '01829337594',
                            style: greyText_13_400,
                          ),
                          Text(
                            '2024-08-14',
                            style: greyText_13_400,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              // Container(
              //   width: double.infinity,
              //   height: 381,
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Center(
              //           child: Container(
              //             height: 189,
              //             width: double.infinity,
              //             decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(10),
              //                 image: DecorationImage(
              //                     image: AssetImage(
              //                         'assets/images/Complain_image.png'),
              //                     fit: BoxFit.cover)),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 12,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             Text(
              //               "Technical Issues",
              //               style: TextStyle(
              //                   fontWeight: FontWeight.w600, fontSize: 13),
              //             ),
              //           ],
              //         ),
              //         Text(
              //           'I am concerned about the cleanliness and of the school premises. The playground and hallways often have litter, and the washrooms need regular cleaning.',
              //           style: greyText_13_400,
              //         ),
              //         SizedBox(
              //           height: 16,
              //         ),
              //         Text(
              //           'Muntasir Hasan',
              //           style: greyText_13_400,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               '01829337594',
              //               style: greyText_13_400,
              //             ),
              //             Text(
              //               '2024-08-14',
              //               style: greyText_13_400,
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 16,
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        color: Colors.white,
        surfaceTintColor: AppColors.appBarColor,
        child: TextButton(
          onPressed: () {
            Get.to(() => const ComplainBoxForm());
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
}
