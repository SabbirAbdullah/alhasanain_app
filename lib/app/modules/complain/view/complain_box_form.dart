import 'package:alhasanain_app/app/core/values/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/complain_box_controller.dart';

final  ComplainController controller = Get.put(ComplainController());
class ComplainBoxForm extends StatefulWidget {
  const ComplainBoxForm({super.key});

  @override
  State<ComplainBoxForm> createState() => _ComplainBoxFormState();
}

class _ComplainBoxFormState extends State<ComplainBoxForm> {

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Complain Box Form'),
        backgroundColor: AppColors.appBarColor,
      ),
      backgroundColor: AppColors.pageBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18,top:18,bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Make Complain',style: blackText16_600,),
                  Text('Please, write your complain here',style: black12_400,),

                ],),
              const SizedBox(height: 16,),

              //date
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Date',
                      style: black13_500,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          height: screenHeight * 0.045,
                          width: screenWidth * 0.88,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: TextField(
                              controller: TextEditingController(
                                  text: controller.selectedDate.value),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade100)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade100)),
                                hintText: ('dd--mm--yy'),
                                hintStyle: greyDarkTextStyle,
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.calendar_month_outlined,
                                    color: AppColors.appBarColor,
                                  ),
                                  onPressed: () =>
                                      controller.pickDate(context),
                                ),
                              ),
                              readOnly: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 16,
              ),

              //complain type
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Complain Type',
                      style: black13_500,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          height: screenHeight * 0.045,
                          width: screenWidth * 0.88,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: TextField(
                              controller: TextEditingController(
                                  text: controller
                                      .selectedComplain.value),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade100)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade100,
                                  ),
                                ),
                                hintText: ('complain type'),
                                hintStyle: greyDarkTextStyle,
                                suffixIcon: DropdownButtonHideUnderline(

                                  child: DropdownButton<String>(
                                    dropdownColor: AppColors.pageBackground,
                                    value: controller
                                        .selectedComplain.value.isEmpty
                                        ? null
                                        : controller
                                        .selectedComplain.value,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onChanged: (String? newValue) {
                                      controller
                                          .updateItem(newValue);
                                    },
                                    items: controller.complainType
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              ),
                              readOnly: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 16,
              ),

              //complain by
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Complain By',
                      style: black13_500,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          height: screenHeight * 0.045,
                          width: screenWidth * 0.88,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: AppColors.appBarColor ,

                            controller: TextEditingController(

                                text: controller.complainBy.value),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                  BorderSide(color: Colors.grey.shade100)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                ),
                              ),
                              hintText: ('Enter Your Name'),
                              hintStyle: greyDarkTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 16,
              ),

              //mobile num
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mobile Number',
                      style: black13_500,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          height: screenHeight * 0.045,
                          width: screenWidth * 0.88,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: TextField(
                              cursorColor: AppColors.appBarColor ,
                              controller: TextEditingController(
                                  text: controller
                                      .complainMobNum.value),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade100)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade100,
                                  ),
                                ),
                                hintText: ('Enter Your Mobile Number'),
                                hintStyle: greyDarkTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 16,
              ),
              //complain detail
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Complain Detail',
                      style: black13_500,
                    ),const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          height: screenHeight * 0.12,
                          width: screenWidth * 0.88,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: AppColors.appBarColor ,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade100)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade100,
                                  ),
                                ),
                                hintText: 'Complaint details',
                                hintStyle: greyDarkTextStyle),
                            maxLines: 5, // Allows multi-line input
                            controller: TextEditingController(
                                text: controller
                                    .complaintDetails.value),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 16,
              ),

              //file attachment
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      'Choose Attachment',
                      style: black13_500,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          height: screenHeight * 0.045,
                          width: screenWidth * 0.88,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: controller.pickImage,
                                child: const Text(
                                  'Choose Attachment',
                                  style: blueText12_500,
                                ),
                              ),
                              Container(
                                width: 1.0, // Thickness of the Divider
                                // Height of the Divider
                                color: Colors.grey, // Color of the Divider
                              ),
                              Text(controller.imageName.value),
                            ],
                          ),
                        ),
                      ],
                    )

                  ],
                );
              }),
              const SizedBox(
                height: 16,
              ),

              Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Checkbox(
                        value: controller.isChecked.value,
                        onChanged: controller.toggleCheckbox,
                        activeColor: controller.isChecked.value
                            ? AppColors.appBarColor
                            : Colors.white,
                      )),
                      const Text('Are you sure to submit'),
                      const Spacer(),
                      Obx(() => Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                          onPressed: controller.isSubmitEnabled
                              ? () {
                            // Handle submit action her

                            Get.snackbar(
                              'Submitted',
                              'Your form has been submitted!',
                            );
                          }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.isSubmitEnabled
                                ? AppColors.appBarColor
                                : Colors.grey,
                          ),
                          child: const Text(
                            'Submit',
                            style: whiteText12,
                          ),
                        ),
                      )),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
