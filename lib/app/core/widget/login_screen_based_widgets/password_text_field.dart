import 'package:get/get.dart';

class TogglePasswordController extends GetxController {
  // Observable to track if the password is visible or not
  var isPasswordVisible = false.obs;

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}