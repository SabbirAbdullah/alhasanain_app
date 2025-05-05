import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:alhasanain_app/app/modules/home/model/student_ui_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'monthly_report/view/monthly_report_view.dart';
import 'term_report/view/term_report.dart';

class ResultView extends StatelessWidget {
  final StudentDataResponseUi studentDataResponseUi;
   ResultView({super.key,  required this.studentDataResponseUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: 'Result'),

      backgroundColor: AppColors.pageBackground,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 50,width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to the Academic Transcript page
                    Get.to(() => ResultPage(studentDataResponseUi:studentDataResponseUi ,));
                  },
                  child: Text('Term Report',style: TextStyle(color: Colors.white),),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                height: 50,width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to the Academic Transcript page
                    Get.to(() => MonthlyProgressView(studentDataResponseUi: studentDataResponseUi,));
                  },
                  child: Text('Monthly Report',style: TextStyle(color: Colors.white),),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
