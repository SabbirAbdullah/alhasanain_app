import 'package:alhasanain_app/app/core/base/base_view.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:alhasanain_app/app/core/widget/loading.dart';
import 'package:alhasanain_app/app/modules/home_mid/homework/controllers/homework_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeWorkListView extends BaseView<HomeWorkListController> {
  HomeWorkListView() {
    controller.checkTerm();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: "Home Work");
    throw UnimplementedError();
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      String formattedDate =
                          selectedDate.toIso8601String().split('T')[0];
                      controller.selectedDate.value = formattedDate;
                      controller.fetchHomeworks(formattedDate);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          spreadRadius: 2,
                          blurRadius: 1,
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_outlined),
                        SizedBox(width: 8,),
                        Obx(() {
                          return controller.selectedDate.value.isNotEmpty
                              ? Text(
                                  controller.selectedDate.value,
                                  style: const TextStyle(fontSize: 14),
                                )
                              : const Text(
                                  "Select Date",
                                  style: TextStyle(fontSize: 14),
                                );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: Loading());
            }
            if (controller.homeworks.isEmpty) {
              return const Center(child: Text('No homework found'));
            }
            return ListView.builder(
              itemCount: controller.homeworks.length,
              itemBuilder: (context, index) {
                final homework = controller.homeworks[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12, top: 4, bottom: 4),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade100)),
                    child: ListTile(
                      title: Text(
                        homework.subject!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      subtitle: Text(
                        homework.title!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                      trailing: Text(
                        homework.date!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 10),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );

    // return  Column(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //             boxShadow: [
    //               BoxShadow(
    //                   color: Colors.grey.shade100,
    //                   spreadRadius: 2,
    //                   blurRadius: 1
    //               )]
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 8,bottom: 8),
    //           child: Row(
    //             children: [
    //               Expanded(
    //                 child:
    //                 Container(
    //                     decoration: BoxDecoration(boxShadow: [
    //                       BoxShadow(
    //                         color: Colors.grey.shade100,
    //                         spreadRadius: 2,
    //                         blurRadius: 1,
    //                       )
    //                     ],
    //                       borderRadius: BorderRadius.circular(8),
    //                       color: Colors.white,
    //                       border: Border.all(
    //                         color: Colors.black12,
    //                       ),
    //                     ),
    //                     child: Row(
    //                       children: [
    //                         IconButton(
    //                           icon: Icon(Icons.calendar_today_outlined),
    //                           onPressed: () async {
    //                             // Show date picker
    //                             DateTime? pickedDate = await showDatePicker(
    //                               context: context,
    //                               firstDate: DateTime(2000),
    //                               lastDate: DateTime(2100),
    //                             );
    //
    //                             if (pickedDate != null) {
    //                               // Update the selected date in controller
    //                               controller.setSelectedDate(pickedDate);
    //                               // You can call additional logic here like fetching classwork
    //                               controller.getHomeworkByDate(controller.selectedDate.value);
    //                             }
    //                           },
    //                         ),
    //                         // Display the selected date reactively
    //                         Obx(() {
    //                           return controller.selectedDate.value.isNotEmpty
    //                               ? Text(
    //                             controller.selectedDate.value,
    //                             style: TextStyle(fontSize: 16),
    //                           )
    //                               : Text("Select Date",style: TextStyle(fontSize: 16),);
    //                         }),
    //                       ],
    //                     )
    //                 ),
    //               ),
    //             ],
    //           ),
    //
    //         ),
    //       ),
    //       Expanded(
    //         child: Obx(() {
    //           final matchingHomeworks = controller.matchingHomeworks;
    //           return Container(
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(8),
    //
    //             ),
    //             child: matchingHomeworks.isNotEmpty
    //                 ? ListView.builder(
    //               shrinkWrap: true,
    //               physics: NeverScrollableScrollPhysics(),
    //               itemCount: matchingHomeworks.length,
    //               itemBuilder: (context, index) {
    //                 final classwork = matchingHomeworks[index];
    //                 return homeworkTile(
    //                   chooseTerm: classwork.termName,
    //                   chooseSubject: classwork.subject,
    //                   date: classwork.date, // Show selected date here
    //                   classworkDetails: classwork.title,);
    //               },
    //             )
    //                 : Center(
    //               child: Text(
    //                 'No classwork found.',
    //                 style: TextStyle(fontSize: 16),
    //               ),
    //             ),
    //           );
    //         }),
    //       ),
    //     ],
    //   );
  }
}
// class homeworkTile extends StatelessWidget {
//   const homeworkTile({
//     super.key, required this.chooseSubject, required this.classworkDetails, required this.date, required this.chooseTerm,
//   });
//  final String chooseSubject;
//   final String classworkDetails;
//   final String date;
//   final String chooseTerm;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white,
//         border: Border.all(
//             color: Colors.black12
//         ),
//       ),
//       child: Padding(
//           padding: EdgeInsets.all(16),
//           child:Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     decoration:BoxDecoration(
//                         color: Color(0xff07548a),
//                         borderRadius: BorderRadius.circular(16)
//                     ),
//                     child:Padding(
//                       padding: EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
//                       child: Text(chooseTerm,style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10
//                       ),),
//                     ),
//                   ),
//                   Spacer(),
//                   Text(date,style: TextStyle(color: Color(0xff565656),fontSize: 10),)
//                 ],
//               ),
//
//               Theme(
//                 data:ThemeData().copyWith(dividerColor: Colors.transparent) ,
//                 child: ExpansionTile(
//                   tilePadding: EdgeInsets.zero,
//                   title: Text(chooseSubject,style: TextStyle(fontWeight:FontWeight.bold,color: Color(0xff565656),fontSize: 12),),
//                   children: [
//                     Column(
//                       children: [
//                         Text(classworkDetails,style: TextStyle(color: Color(0xff565656),fontSize: 12),),
//
//                       ],
//                     )
//                   ],),
//               )
//             ],
//           )
//       ),
//     );
//   }
// }
