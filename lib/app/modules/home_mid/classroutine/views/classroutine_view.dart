import 'package:alhasanain_app/app/core/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/values/app_colors.dart';
import '../controllers/class_routine_controller.dart';

class ClassroutineView extends StatelessWidget {
  final ClassRoutineController controller = Get.put(ClassRoutineController());

  ClassroutineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Routine"),
        centerTitle: true,
      ),
      backgroundColor: AppColors.pageBackground,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: Loading());
        }

        if (controller.routineDays.isEmpty) {
          return const Center(child: Text('No Data Found'));
        }
        if (controller.periods.isEmpty) {
          return const Center(child: Text('No Data Found'));
        }
        return DefaultTabController(
          length: controller.routineDays.length,
          child: Column(
            children: [
              TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                labelColor: AppColors.appBarColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.appBarColor,
                tabs: controller.routineDays.map((routineDay) {
                  return Tab(text: routineDay.day); // Display day name in Tab
                }).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: controller.routineDays.map((routineDay) {
                    return ListView.builder(
                      itemCount: routineDay.periods.length,
                      itemBuilder: (context, index) {
                        final routine = routineDay.periods[index];
                        final period = controller.periods.firstWhere(
                              (p) => p.id == routine.periodId, // Match by ID
                          orElse: () => null!,
                        );

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 4,bottom: 4),
                              child: Container(
                                decoration: BoxDecoration( color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade100)),

                                child: ListTile(
                                  leading: period != null
                                      ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                          Text(
                                            "${period.startTime} - ${period.endTime}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10
                                            ),
                                          ),
                                      Text(
                                        period.name,
                                        style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                                      ),

                                    ],
                                  )
                                      : const Text("N/A"),
                                  title: Text(routine.subjectId,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
                                  subtitle: Text(
                                      'Teacher: ${routine.fName} ${routine.lName}',style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),

              ),

              // Expanded(
              //   child: Obx(() {
              //     if (controller.isLoading.value) {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //
              //     if (controller.periods.isEmpty) {
              //       return const Center(child: Text('No data found'));
              //     }
              //     return ListView.builder(
              //       itemCount: controller.periods.length,
              //       itemBuilder: (context, index) {
              //         final period = controller.periods[index];
              //         return Card(
              //           margin: const EdgeInsets.all(8.0),
              //           child: ListTile(
              //             title: Text(period.name),
              //             subtitle: Text(
              //               '${period.type} | ${period.startTime} - ${period.endTime}',
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   }),
              // ),
            ],
          ),
        );
      }),
    );
  }
}


//
// TabBar(
// indicatorColor: AppColors.appBarColor,
// labelColor: AppColors.appBarColor,
// tabs: [
// Tab(
// text: "Sun",
// ),
// Tab(
// text: "Mon",
// ),
// Tab(
// text: "Tue",
// ),
// Tab(
// text: "Wed",
// ),
// Tab(
// text: "Thu",
// ),
// ],
// ),
// Expanded(
// child: TabBarView(children: [
// Obx(() => controller.projectList.isEmpty
// ? Container()
//     : Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// Expanded(
// child: ListView.builder(
// itemCount: controller.projectList
//     .where((element) =>
// element.dayName == "SUN")
//     .length,
// itemBuilder: (context, index) {
// var dayFilter = controller.projectList
//     .where((element) =>
// element.dayName == "SUN")
//     .toList();
//
// return Padding(
// padding:
// const EdgeInsets.only(bottom: 8.0),
// child: ClassRoutineCardWidget(
// period: "0${dayFilter[index]?.slotName} ",
// subject:   "${dayFilter[index]?.subjectName}",
// teacher: "${dayFilter[index]?.teacherFname} ${controller.projectList[0]?.teacherLname}"
// )
// );
// }))
// ],
// ))),
//
// Obx(() => controller.projectList.isEmpty
// ? Container()
//     : Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// Expanded(
// child: ListView.builder(
// itemCount: controller.projectList
//     .where((element) =>
// element.dayName == "MON")
//     .length,
// itemBuilder: (context, index) {
// var dayFilter = controller.projectList
//     .where((element) =>
// element.dayName == "MON")
//     .toList();
//
// return Padding(
// padding:
// const EdgeInsets.only(bottom: 8.0),
// child:ClassRoutineCardWidget(
// period: "${dayFilter[index]?.slotName} ",
// subject:   "${dayFilter[index]?.subjectName}",
// teacher: "${dayFilter[index]?.teacherFname} ${controller.projectList[0]?.teacherLname}"
// )
// );
// }))
// ],
// ))),
//
// Obx(() => controller.projectList.isEmpty
// ? Container()
//     : Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// Expanded(
// child: ListView.builder(
// itemCount: controller.projectList
//     .where((element) =>
// element.dayName == "TUE")
//     .length,
// itemBuilder: (context, index) {
// var dayFilter = controller.projectList
//     .where((element) =>
// element.dayName == "TUE")
//     .toList();
//
// return Padding(
// padding:
// const EdgeInsets.only(bottom: 8.0),
// child: ClassRoutineCardWidget(
// period: "${dayFilter[index]?.slotName} ",
// subject:   "${dayFilter[index]?.subjectName}",
// teacher: "${dayFilter[index]?.teacherFname} ${controller.projectList[0]?.teacherLname}"
// )
// );
// }))
// ],
// ))),
//
// Obx(() => controller.projectList.isEmpty
// ? Container()
//     : Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// Expanded(
// child: ListView.builder(
// itemCount: controller.projectList
//     .where((element) =>
// element.dayName == "WED")
//     .length,
// itemBuilder: (context, index) {
// var dayFilter = controller.projectList
//     .where((element) =>
// element.dayName == "WED")
//     .toList();
//
// return Padding(
// padding:
// const EdgeInsets.only(bottom: 8.0),
// child:ClassRoutineCardWidget(
// period: "${dayFilter[index]?.slotName} ",
// subject:   "${dayFilter[index]?.subjectName}",
// teacher: "${dayFilter[index]?.teacherFname} ${controller.projectList[0]?.teacherLname}"
// )
// );
// }))
// ],
// ))),
//
// Obx(() => controller.projectList.isEmpty
// ? Container()
//     : Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// Expanded(
// child: ListView.builder(
// itemCount: controller.projectList
//     .where((element) =>
// element.dayName == "THU")
//     .length,
// itemBuilder: (context, index) {
// var dayFilter = controller.projectList
//     .where((element) =>
// element.dayName == "THU")
//     .toList();
//
// return Padding(
// padding: const EdgeInsets.all(5),
// child: ClassRoutineCardWidget(
// period: "${dayFilter[index]?.slotName} ",
// subject:   "${dayFilter[index]?.subjectName}",
// teacher: "${dayFilter[index]?.teacherFname} ${controller.projectList[0]?.teacherLname}",
//
// )
// );
// }))
//
//
//
// ],
// ))),
//
// Obx(() => controller.projectList.isEmpty
// ? Container()
//     : Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(8),
// color: Colors.white,
// ),
// width: double.infinity,
// child: Row(children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(8),
// color: Colors.red),
// child: Column(children: [
// Text(
// "${controller.projectList[0]?.className}",
// style: TextStyle(
// color: Colors.white, fontSize: 16),
// ),
// //Text("9:30 AM",style: TextStyle(color: Colors.white,fontSize: 16),),
// ]),
// ),
// ),
// Column(children: [
// Text(
// "${controller.projectList[0]?.subjectName}",
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// fontSize: 18),
// ),
// Text(
// "${controller.projectList[0]?.teacherFname}",
// style: TextStyle(fontSize: 16),
// ),
// Text(
// "${controller.projectList[0]?.teacherLname}",
// style: TextStyle(fontSize: 16),
// ),
// ]),
// ])),
// )),
// Text("Second Day Routine"),
// Text("Third Day Routine"),
// Text("Third Day Routine"),
// Text("Third Day Routine")
// ]),
// )