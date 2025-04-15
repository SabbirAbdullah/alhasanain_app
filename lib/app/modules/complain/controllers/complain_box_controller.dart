import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ComplainController extends GetxController{
  var complainBy = ''.obs;
  var imageName = ''.obs;
  var selectedDate = ''.obs;
  var complaintDetails = ''.obs;
  var isExpanded = false.obs;
  var complainMobNum = ''.obs;
  var imagePath = ''.obs;
  var isChecked = false.obs;

  final ImagePicker _picker = ImagePicker();
  // Computed property to determine if the submit button should be enabled
  bool get isSubmitEnabled => isChecked.value;

  var selectedComplain = ''.obs;

  final List<String> complainType = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
  // Method to update the selected item
  void updateItem(String? newValue) {
    if (newValue != null) {
      selectedComplain.value = newValue;
    }
  }
  // Function to toggle checkbox state
  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }
  // Method to show date picker and update the date
  Future<void> pickDate(BuildContext context) async {

    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (date != null) {
      selectedDate.value = DateFormat('dd-MM-yyyy').format(date);
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageName.value = pickedFile.name;
    } else {
      imageName.value = 'No file choosen';
    }
  }

  // Method to update the image path
  void setImagePath(String path) {
    imagePath.value = path;
  }

void showImagePreview(String imagePath) {
  final ComplainController imageController = Get.put(ComplainController());
  imageController.setImagePath(imagePath);

  Get.dialog(
    barrierColor: Colors.black87,
    Dialog(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Obx(
                () => Image.asset(
              imageController.imagePath.value,
              fit: BoxFit.cover,
            ),
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