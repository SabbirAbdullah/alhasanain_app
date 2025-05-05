// views/delete_account_page.dart
import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/delete_controller.dart';

class DeleteAccountPage extends StatelessWidget {
  final DeleteAccountController controller = Get.put(DeleteAccountController());
  final TextEditingController emailController = TextEditingController();

  DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.pageBackground,
      appBar: CustomAppBar(appBarTitleText: 'Delete My Account'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Enter your email address to request account deletion. An email will be sent to our support team.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ElevatedButton.icon(
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color(
                    0xfdffffff))),
                onPressed: () {
                  controller.sendDeleteRequest();
                },
                icon: const Icon(Icons.email,color: AppColors.appBarColor,),
                label: const Text('Request Delete',style: TextStyle(color: AppColors.appBarColor),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
