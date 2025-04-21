import 'package:alhasanain_app/app/core/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/day_schedule_controller.dart';
import '../model/day_model.dart';
import '../model/weekly_model.dart';

class DailyLesson extends StatefulWidget {
  const DailyLesson({super.key});

  @override
  State<DailyLesson> createState() => _DailyLessonState();
}

class _DailyLessonState extends State<DailyLesson> {
  final WeeklyDatesController controller = Get.put(WeeklyDatesController());
  final HomeController homeController = Get.put(HomeController());
  // Observable variables to hold selected values for term, week, and day
  final Rx<DaySchedule?> selectedDay = Rx<DaySchedule?>(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Lesson'),
      ),
      backgroundColor: AppColors.pageBackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return const Loading(); // Reset if not found
              }
              // Check if the selected week exists in the list
              if (!controller.weeklyDates.contains(controller.selectedWeek.value)) {
                controller.selectedWeek.value = null;
                // Reset if not found
              }
              return DropdownButtonFormField<WeeklyDate>(
                isExpanded: true,dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  icon: const Icon(Icons.keyboard_arrow_down),
                decoration:     InputDecoration(
                  contentPadding: const EdgeInsets.only(left:16, right: 8, top: 8, bottom: 8),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12,

                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12,

                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                hint: const Text('Select a Week',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
                value: controller.selectedWeek.value,
                items: controller.weeklyDates.map((WeeklyDate week) {
                  return DropdownMenuItem<WeeklyDate>(


                    value: week,
                    child: ListTile(minTileHeight: 10,
                      title: Text(week.weekName.isNotEmpty
                          ? week.weekName
                          : '${week.startDate} - ${week.endDate}'),
                      trailing: Text(week.weekName.isNotEmpty
                          ? '${week.startDate} - ${week.endDate}'
                      : ""),
                    ),
                  );
                }).toList(),
                onChanged: (WeeklyDate? selectedWeek) {
                  if (selectedWeek != null) {
                    controller.selectedWeek.value = selectedWeek;
                    // Reset selectedDay when week changes
                    selectedDay.value = null;
                    controller.fetchDailySchedule(selectedWeek.id);
                  }
                }
              );
            }),
            const SizedBox(height: 6,),

            // Day Selection Dropdown
            Obx(() {
              if(controller.isLoading.value){
                return Container();
              }
              if (controller.dailyScheduleResponse.value == null) {
                return Container(); // Do nothing if there's no schedule loaded
              }
              var dailySchedule = controller.dailyScheduleResponse.value!.days;
              return DropdownButtonFormField<DaySchedule>(
                isExpanded: true,dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(16),
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration:     InputDecoration(
                  contentPadding: const EdgeInsets.only(left:16, right: 8, top: 8, bottom: 8),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12,

                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12,

                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12,

                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hint: const Text('Select a Day',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                value: selectedDay.value,
                items: dailySchedule.map((DaySchedule day) {
                  return DropdownMenuItem<DaySchedule>(
                    value: day,
                    child: Text(day.day),
                  );
                }).toList(),
                onChanged: (DaySchedule? day) {
                  if (day != null) {
                    selectedDay.value = day;
                  }
                },
              );
            }),
            const SizedBox(height: 6,),

            // Display the selected day's subjects if available
            Obx(() {
              if (selectedDay.value == null) {
                return Container(); // Show nothing if no day is selected
              }
              return Expanded(
                child:CustomScrollView(
                    slivers: [
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 3.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index, ) {
                      final subject = selectedDay.value!.subjects[index];
                      final daySchedule = selectedDay.value!;
                      return GestureDetector(
                        onTap: () {
                          // Show alert dialog when card is tapped
                          showDialog(
                            context: context,

                            builder: (BuildContext context,) {
                              return AlertDialog(
                                backgroundColor: AppColors.pageBackground,
                                actionsAlignment: MainAxisAlignment.end,
                                scrollable: true,
                                actionsPadding: const EdgeInsets.only(bottom: 4, right: 8),
                                contentPadding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 6),
                                insetPadding: const EdgeInsets.all(12),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                titlePadding: const EdgeInsets.only(left: 16,top: 10),
                                title: const Text(
                                  "Lesson Details",
                                  style:
                                  TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                                ),

                                content:
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .90,
                                  child:
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  border: Border.all(color: AppColors.appBarColor,)
                                              ),
                                              child:  Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4.0, bottom: 4, right: 8, left: 8),
                                                child: Text(
                                                  daySchedule.day,
                                                  style: const TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                //border: Border.all(color: AppColors.appBarColor, width: 1))
                                              ),
                                              child:  Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4.0, bottom: 4, right: 8, left: 8),
                                                child: Text(
                                                  daySchedule.subjects[index].subject,
                                                  style: const TextStyle(
                                                      color: AppColors.appBarColor,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * .2,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                'Materials',
                                                style: TextStyle(
                                                    color: AppColors.appBarColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: Text(
                                                ":${daySchedule.subjects[index].books}",
                                                overflow: TextOverflow.visible,
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * .2,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                'Lessons',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color:AppColors.appBarColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            flex: 4,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: Text(
                                                ":${daySchedule.subjects[index].lessonPlan}",
                                                overflow: TextOverflow.visible,
                                                maxLines: null, // Adjust as needed
                                                style: const TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * .2,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                'Homework',
                                                style: TextStyle(
                                                    color: AppColors.appBarColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),

                                          Expanded(
                                              flex: 4,
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 8.0),
                                                child:  Text(
                                                  ":${daySchedule.subjects[index].homework}",
                                                  maxLines: null,
                                                  overflow: TextOverflow.visible,
                                                  style: const TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),

                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "Close",
                                      style: TextStyle(
                                          color: AppColors.appBarColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.appBarColor.withOpacity(0.2),
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        topLeft: Radius.circular(8))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          //border: Border.all(color: Color(0xff0b6fbe)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(daySchedule.day,style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),),
                                        ),
                                      ),
                                      const SizedBox(width: 6,),
                                      Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            //border: Border.all(color: AppColors.appBarColor,)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 4.0,right: 4,bottom: 2),
                                            child: Text(subject.subject,style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400),),
                                          ),),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 4,top: 4),
                                child: Column(
                                  children: [

                                    Row(
                                      children: [
                                        const Text("Materials ",overflow: TextOverflow.ellipsis,style: TextStyle(color: AppColors.appBarColor,
                                            fontSize: 12,fontWeight: FontWeight.w400)),
                                        Expanded(
                                          child: Text(":${subject.books}",overflow: TextOverflow.ellipsis,maxLines:1,
                                              style: const TextStyle(color: Colors.black87,
                                              fontSize: 10,fontWeight: FontWeight.w400)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        const Text("Lesson ",
                                            style: TextStyle(color: AppColors.appBarColor,
                                            fontSize: 12,fontWeight: FontWeight.w400)),

                                        Expanded(
                                          child: Text(":${subject.lessonPlan}",
                                            overflow: TextOverflow.ellipsis,maxLines: 1,
                                            style: const TextStyle(
                                              fontSize: 10,fontWeight: FontWeight.w400,
                                            ),),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        const Text("Homework ",style: TextStyle(color: AppColors.appBarColor,
                                            fontSize: 12,fontWeight: FontWeight.w400)),

                                        Expanded(
                                          child: Text(":${subject.homework}", overflow: TextOverflow.ellipsis, maxLines: 1,
                                              style: const TextStyle(color: Colors.black87,
                                                                                 fontSize: 10,fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),


                            ],
                          )
                        ),
                      );
                    },
                    childCount: selectedDay.value!.subjects.length,
                  ),
                )

                ],
                  ),

              );

            }),
          ],
        ),
      ),
    );
  }
}
