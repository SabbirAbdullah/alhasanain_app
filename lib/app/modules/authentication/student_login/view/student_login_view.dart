import 'package:alhasanain_app/app/core/base/base_view.dart';
import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/modules/authentication/student_login/controller/student_login_controller.dart';
import 'package:alhasanain_app/app/modules/authentication/student_login/view/widget/students_login_widget.dart';
import 'package:alhasanain_app/app/modules/welcome/widget/login_footer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widget/login_screen_based_widgets/password_text_field.dart';
import '../../../privacy_policies/terms_condition.dart';
import '../../../privacy_policies/views/privacy_policy.dart';
class StudentLoginView extends BaseView<StudentLoginController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(toolbarHeight: 0,
      backgroundColor:  Color(0xffe6f9ff),

    );
    throw UnimplementedError();
  }

  @override
  Widget body(BuildContext context) {


    return Obx(() {
      return Container(
        decoration: BoxDecoration(gradient: AppColors.appBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StudentsLoginWidget.alhasanainBanner(),
              Spacer(),

              StudentsLoginWidget.topView(),
              SizedBox(
                height: 16,
              ),
              StudentsLoginWidget.getTextFormField(
                  "Student ID", controller.studentIdController, false),
              SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 50,
                    width: Get.width*.85,
                    child: TextField(
                      cursorColor: AppColors.appBarColor,
                      obscureText: !controller.isPasswordVisible.value,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(controller.isPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {
                            controller.togglePasswordVisibility();
                          },
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                            BorderSide(color: Colors.grey.shade100)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                            BorderSide(color: Colors.grey.shade100)),
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),

              // StudentsLoginWidget.forgetPassword(),
              SizedBox(
                height: 16,
              ),
              Container(
                width: Get.width*.85,
                height: 50,
                child: TextButton(
                  onPressed: controller.loginStudent,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Spacer(flex: 1,),
              Column(
                children: [
                  Text("By logging in, you agree to our "),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: () {
                          // Navigate to Privacy Policy page
                          Get.to(() => PrivacyPolicyPage());
                        },
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('&'),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          // Navigate to Terms & Conditions page
                          Get.to(() => TermsAndConditionsPage());
                        },
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              CopyrightText()


            ],
          ),
        ),
      );
    });
    throw UnimplementedError();
  }
}
