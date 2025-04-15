import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../controllers/academic_calender_controller.dart';

class AcademicEventTile extends StatelessWidget {
  const AcademicEventTile({
    super.key,
    required this.controller,
  });
  final AcademicCalenderController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.academicCalender.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/empty.png',
                  height: 100,
                ),
                Text("No Academic Activities")
              ],
            ),
          )
        : ListView.builder(
            itemCount: controller.academicCalender.length,
            itemBuilder: (context, index) {
              DateTime startDateTime =
                  DateTime.parse(controller.academicCalender[index].start);
              String startDate =
                  "${startDateTime.day.toString().padLeft(2, '0')}/${startDateTime.month.toString().padLeft(2, '0')}/${startDateTime.year}";
              DateTime endDateTime =
                  DateTime.parse(controller.academicCalender[index].start);
              String endDate =
                  "${endDateTime.day.toString().padLeft(2, '0')}/${endDateTime.month.toString().padLeft(2, '0')}/${endDateTime.year}";
              return  Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8),
                child: Card(
                    color: Colors.white,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Text(
                                          getWeekdayName(startDateTime),
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.red,
                                          fontWeight: FontWeight.w400),
                                        ),

                                    ),
                                    width: 54,


                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight:
                                                Radius.circular(AppValues.radius_8),
                                            topLeft:
                                                Radius.circular(AppValues.radius_8))),
                                  ),


                                  Container(
                                    width: 54,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(AppValues.radius_8),
                                            bottomRight:
                                                Radius.circular(AppValues.radius_8))),
                                    child:  Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${startDateTime.day}",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                  ),

                                ],
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 46,
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 14,

                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                //event
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 17,width: 3,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.colorGreen,),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      controller.academicCalender[index].title,
                                      style: TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.w500,color: AppColors.colorGreen),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8,),

                                Text(
                                  "$startDate to $endDate",
                                  style:
                                      TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  "${controller.academicCalender[index].purpose}",
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                ),
              );
            }));
  }
}

String getWeekdayName(DateTime date) {
  const List<String> weekdays = ['Jan', 'Feb', 'Mar', 'Api', 'May', 'Jun', 'Jul','Aug','Sep','Oct''Nov','Dec'];

  // Ensure that the provided date is not null
  if (date == null) {
    return 'Invalid Date';
  }

  // Get the weekday index (0 for Monday, 1 for Tuesday, etc.)
  int weekdayIndex = date.month - 1;

  // Use the weekday index to retrieve the corresponding weekday name
  return weekdays[weekdayIndex];
}