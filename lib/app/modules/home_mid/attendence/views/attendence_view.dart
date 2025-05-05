import 'package:alhasanain_app/app/core/values/app_values.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:alhasanain_app/app/modules/home_mid/attendence/controllers/attendence_controller.dart';
import 'package:alhasanain_app/app/modules/home_mid/attendence/widget/attendence_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../../../core/base/base_view.dart';
import '../model/attendence_data_ui.dart';

class AttendanceScreen extends BaseView<AttendenceController> {


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: "Attendence");
  }
  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
             children: [
              InkWell(
                onTap:(){
                  showMonthPicker(
                    context: context,
                    initialDate: DateTime.now(),
                  ).then((date) {
                    if (date != null) {
                      controller.now=date;
                      controller.formattedDate=DateFormat('yyyy-MM').format(controller.now);
                      controller.getAttendence(controller.formattedDate);
                    }
                  });
                } ,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade100,
                            spreadRadius: 2,
                            blurRadius: 1
                        )]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 8,bottom: 8),
                    child: Row(children: [
      
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                          child:Padding(
                            padding: EdgeInsets.zero,
                            child: SizedBox(
                              height: 45,
                              child: Row(
                                children: [
                                  SizedBox(width: 8,),
                                  Icon(Icons.date_range,size:20),
                                  SizedBox(width: 8,),
                                   Text(controller.formattedDate,style: TextStyle(fontSize: 12),),
                                  const SizedBox(width: 10,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],),
                  ),
                ),
              ),
      
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const AttendenceHeader(),
                   Obx(() => controller.projectList.isEmpty? const Padding(
                     padding: EdgeInsets.all(AppValues.extraLargeSpacing),
                     child: Text("No attendance found"),
                   ):ListView.builder(
                    
                     shrinkWrap: true,
                     itemCount: controller.projectList.length,
                     itemBuilder: (context, index) {
                       return AttendenceWidget(studentAttendenceResponseUI: controller.projectList[index],);
                     },))
                  ],
                ),
              ),
            ],
          ),
    );

    throw UnimplementedError();
  }


}

class AttendenceWidget extends StatelessWidget {
  final StudentAttendenceResponseUI studentAttendenceResponseUI;
  const AttendenceWidget({
    super.key, required this.studentAttendenceResponseUI,
  });

  @override
  Widget build(BuildContext context) {
    String _formatDate(String date) {
      try {
        DateTime parsedDate = DateTime.parse(date); // Assuming date is '2025-04-22'
        return DateFormat('dd-MM-yyyy').format(parsedDate);
      } catch (e) {
        return date; // Return original in case of error
      }
    }
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  _formatDate(studentAttendenceResponseUI.date!),
                  style: const TextStyle(color: Color(0xff565656), fontSize: 12),
                ),
              ),

              if (studentAttendenceResponseUI.attendance=="1") const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.check_circle_outline,size: 20,color: Colors.green,),
              ) else const Padding(
                padding: EdgeInsets.only(right: 95),
                child: Icon(Icons.clear_rounded,size: 20,color: Colors.red,),
              ),

            ],
          ),
        ),
      ],
    );
  }
}

