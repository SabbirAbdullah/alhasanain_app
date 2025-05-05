import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/loading.dart';
import '../../home/model/student_ui_data.dart';
import '../controllers/complain_box_controller.dart';

class ComplainPage extends StatelessWidget {
  final StudentDataResponseUi studentDataResponseUi;
  final ComplainController controller;

  ComplainPage({super.key, required this.studentDataResponseUi})
      : controller = Get.put(ComplainController(studentDataResponseUi));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        title: Text('Submit a Complain'),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(child: Loading())
            : SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Make Complain',style: blackText16_600,),
              Text('Please, write your complain here',style: black12_400,),

              SizedBox(height: 16),
                const Text(
                  'Date',
                  style: black13_500,
                ),
                const SizedBox(height: 8),

               Container(
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

              SizedBox(height: 12),
              const Text(
                'Complain Type',
                style: black13_500,
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField<String>(
                  items: controller.complainType
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  style: text12_600,
                  decoration:
                  InputDecoration(
                    
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
                    hintText: ('Select a type'),
                    hintStyle: greyDarkTextStyle,
                  ),
                  onChanged: (val) => controller.selectedComplainType.value = val!,

                ),
              ),
              SizedBox(height: 12),
              Text(
                'Complain Detail',
                style: black13_500,
              ),
              const SizedBox(height: 8),
              _buildTextField(
                label: 'Complain Description',
                onChanged: (value) => controller.complainDes.value = value,
                maxLines: 5,
              ),

              SizedBox(height: 20),
              Obx(()=>ImagePickerBox(
                image: controller.image.value,
                onTap: controller.pickAndCompressImage,
              ),),
              SizedBox(height: 20),
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

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                      onPressed: controller.isSubmitEnabled
                          ? () {
                        if (!controller.isChecked.value) {
                          Get.snackbar('Warning', 'You must accept the terms');
                          return;
                        }
                        controller.submitComplain(
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
        );
      }),
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        cursorColor: AppColors.appBarColor,
        onChanged: onChanged,
        maxLines: maxLines,
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
      ),
    );
  }

  Widget _buildImagePicker(ComplainController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Image', style: black13_500),
        SizedBox(height: 8),
        GestureDetector(
          onTap: controller.pickAndCompressImage,
          child: Obx(() => controller.image.value == null
              ? Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey[700]),
          )
              : ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(controller.image.value as String),
              height: 250,
              width: 200,
              fit: BoxFit.cover,
            ),
          )),
        ),
      ],
    );
  }
}

class ImagePickerBox extends StatelessWidget {
  final XFile? image;
  final VoidCallback onTap;
  final double borderRadius;
  final Color? backgroundColor;

  const ImagePickerBox({
    super.key,
    required this.image,
    required this.onTap,
    this.borderRadius = 12,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.width * 0.6;
    final double width = MediaQuery.of(context).size.width * 0.5;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey.shade200,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: image != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.file(
            File(image!.path),  // Unwrap the nullable image
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
        )
            : Icon(
          Icons.camera_enhance_outlined,
          size: 50,
          color: AppColors.appBarColor,
        ),
      ),
    );
  }
}