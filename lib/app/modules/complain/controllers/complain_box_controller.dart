import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../core/widget/image_compress.dart';
import '../../../data/model/complain_model.dart';
import '../../../data/repository/complian_repository.dart';
import '../../../data/repository/pref_repository.dart';
import '../../home/model/student_ui_data.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;


class ComplainController extends GetxController {

  final StudentDataResponseUi studentDataResponseUi;

  ComplainController(this.studentDataResponseUi);

  final ComplainRepository repository = ComplainRepository();
  final PrefRepository _prefRepository =
  Get.find(tag: (PrefRepository).toString());
  final complainBy = ''.obs;
  final complainDes = ''.obs;
  RxString selectedComplainType = "".obs;

  final compile = ''.obs;

  RxString selectedDate = "".obs;
  final isLoading = false.obs;

  final List<String> complainType = [
    'Academic Issues',
    'Administrative Issues',
    'Infrastructure Issues',
    'Technical Issues',
    'Extracurricular Activities',
    'Safety and Security',
    'Canteen and Food Services',
    'Transportation Issues',
    'Staff and Faculty Concerns',
    'Other',
  ];


  final ImagePicker picker = ImagePicker();
  Rx<XFile?> image = Rx<XFile?>(null);

  Future<void> pickAndCompressImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final compressedImage = await compressImage(pickedFile);
      image.value = compressedImage; // Update the image with compressed file
    }
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      selectedDate.value = "${pickedDate.day.toString().padLeft(2, '0')}-"
          "${pickedDate.month.toString().padLeft(2, '0')}-"
          "${pickedDate.year}";

    }
  }

  Future<void> submitComplain() async {
    var phone = await _prefRepository.getString('phoneParents');
    final imageFile = image.value;

    final model = ComplainRequestModel(
      complainBy: 'Parentss',
      complainDes: complainDes.value,
      complainType: selectedComplainType.value,
      date: studentDataResponseUi.campus!,
      session: studentDataResponseUi.session!,
      phone: phone,
      compile: "${phone}, parents",
      status: 1,
      imgPath: imageFile!.path,
    );

    try {
      isLoading.value = true;
      final success = await repository.submitComplain(model);
      isLoading.value = false;

      if (success) {
        Get.snackbar('Success', 'Complain submitted successfully');
        fetchComplains();
      } else {
        Get.snackbar('Failed', 'Submission failed');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  var isChecked = false.obs;

  final ImagePicker _picker = ImagePicker();

  // Computed property to determine if the submit button should be enabled
  bool get isSubmitEnabled => isChecked.value;

  var selectedComplain = ''.obs;


  // Method to update the selected item

  // Function to toggle checkbox state
  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  var complainList = <ComplainViewModel>[].obs;

  var errorMessage = ''.obs;

  void fetchComplains() async {
    var phone = await _prefRepository.getString('phoneParents');
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final data = await repository.getComplains(phone);
      complainList.value = data;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  /// delete
  RxBool isDeleting = false.obs;

  Future<void> deleteComplain(int id) async {
    isDeleting.value = true;
    try {
      final response = await repository.deleteComplain(id);
      if (response.affectedRows == 1) {
        Get.snackbar("Success", "Complain deleted successfully");
        fetchComplains();
      } else {
        Get.snackbar("Error", "Failed to delete complain");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isDeleting.value = false;
    }
  }

  var expandedMap = <int, RxBool>{}.obs;

  void toggleExpanded(int id) {
    if (!expandedMap.containsKey(id)) {
      expandedMap[id] = true.obs;
    } else {
      expandedMap[id]!.value = !expandedMap[id]!.value;
    }
  }

  bool isCardExpanded(int id) {
    return expandedMap[id]?.value ?? false;
  }


}




