import 'package:alhasanain_app/app/core/base/base_view.dart';

import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widget/loading.dart';
import '../controller/classwork_controller.dart';


class ClassWorkView extends BaseView<ClassWorkController>{

  ClassWorkView(){

    controller.checkTerm();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context){
    return CustomAppBar(appBarTitleText: "Class Work");
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    String formattedDate = pickedDate.toIso8601String().split('T')[0];
                    controller.selectedDate.value = formattedDate;
                    controller.fetchClassworks(formattedDate);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(boxShadow: [
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
                    ),),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today_outlined),

                      const SizedBox(width: 10),
                      Obx(() {
                        return Text(
                          controller.selectedDate.isEmpty ? 'Select a date' : controller.selectedDate.value,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: Loading());
                }
                if (controller.classworks.isEmpty) {
                  return const Center(child: Text('No classwork found'));
                }
                return ListView.builder(
                  itemCount: controller.classworks.length,
                  itemBuilder: (context, index) {
                    final classwork = controller.classworks[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 4.0,bottom: 4,left: 4,right: 4),
                      child: Container(

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white, ),
                        child: ListTile(
                          title: Text(classwork.subject!,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black87),),
                          subtitle: Text(classwork.title!,style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.black87),),
                          trailing: Text(classwork.date!,style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Colors.black87),),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

          ],
        ),
    );

  }
}

extension on Rx<DateTime> {

}
class classworkTile extends StatelessWidget {
  const classworkTile({
    super.key,
    required this.chooseSubject,
    required this.classworkDetails,
    required this.date,
    required this.chooseTerm,
  });

  final String chooseSubject;
  final String classworkDetails;
  final String date;
  final String chooseTerm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(color: Colors.black12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff07548a),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                      child: Text(
                        chooseTerm,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    date,
                    style: const TextStyle(color: Color(0xff565656), fontSize: 10),
                  )
                ],
              ),
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    chooseSubject,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xff565656), fontSize: 12),
                  ),
                  children: [
                    Column(
                      children: [
                        Text(
                          classworkDetails,
                          style: const TextStyle(color: Color(0xff565656), fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class classworkTile extends StatelessWidget {
//   const classworkTile({
//     super.key, required this.chooseSubject, required this.classworkDetails, required this.date, required this.chooseTerm,
//   });
//   final String chooseSubject;
//   final String classworkDetails;
//   final String date;
//   final String chooseTerm;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical:4),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: Colors.white,
//           border: Border.all(
//               color: Colors.black12
//           ),
//         ),
//         child: Padding(
//             padding: EdgeInsets.all(16),
//             child:Column(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       decoration:BoxDecoration(
//                           color: Color(0xff07548a),
//                           borderRadius: BorderRadius.circular(16)
//                       ),
//                       child:Padding(
//                         padding: EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
//                         child: Text(chooseTerm,style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 10
//                         ),),
//                       ),
//                     ),
//                     Spacer(),
//                     Text(date,style: TextStyle(color: Color(0xff565656),fontSize: 10),)
//                   ],
//                 ),
//
//                 Theme(
//                   data:ThemeData().copyWith(dividerColor: Colors.transparent) ,
//                   child: ExpansionTile(
//                     tilePadding: EdgeInsets.zero,
//                     title: Text(chooseSubject,style: TextStyle(fontWeight:FontWeight.bold,color: Color(0xff565656),fontSize: 12),),
//                     children: [
//                       Column(
//                         children: [
//                           Text(classworkDetails,style: TextStyle(color: Color(0xff565656),fontSize: 12),),
//
//                         ],
//                       )
//                     ],),
//                 )
//               ],
//             )
//         ),
//       ),
//     );
//   }
// }
//
// Expanded(
//   child:
//
//   DropdownButtonFormField(
//     icon: const Icon(Icons.keyboard_arrow_down),
//     hint: const Text("Subject",
//         style: TextStyle(fontSize: 12)),
//     validator: (value) {
//       if (value == null || value.isEmpty) {
//         return 'Choose Subject*';
//       }
//       return null;
//     },
//     decoration:
//     InputDecoration(
//       contentPadding: EdgeInsets.only(left:16, right: 8, top: 8, bottom: 8),
//       filled: true,
//       fillColor: Colors.white,
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Colors.black12,
//
//         ),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Colors.black12,
//         ),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       border: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Colors.black12,
//
//         ),
//         borderRadius: BorderRadius.circular(8),
//       ),
//     ),
//
//     onChanged: (newValue) {
//       //part = newValue!;
//     },
//     items: <String>[
//       "Bangla",
//       "English",
//     ].map<DropdownMenuItem<String>>((String value) {
//       return DropdownMenuItem<String>(
//         value: value,
//         child: Text(
//           value,
//           style:  TextStyle(fontSize: 16),
//         ),
//       );
//     }).toList(),
//   ),
// ),