import 'package:alhasanain_app/app/core/base/base_view.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/ct_controller.dart';
import '../model/ct_data_ui.dart';

class CtScreen extends BaseView<CTController> {
  final CTController controller = Get.put(CTController());
  CtScreen(){
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: "Class Test");
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        // Dropdown and filter
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                spreadRadius: 2,
                blurRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: Obx(() => DropdownButtonFormField(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    hint: const Text(
                      "Select Term",
                      style: TextStyle(fontSize: 12),
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    value: controller.selectedTerm.value.isNotEmpty
                        ? controller.selectedTerm.value
                        : null,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        controller.updateTerm(newValue);
                     controller.getStudentCTList();
                      }
                    },

                    items: controller.terms
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: const TextStyle(fontSize: 16)),
                      );
                    }).toList(),
                  )),
                ),
                SizedBox(width: 6,),
                // Dropdown for selecting CT
                Expanded(
                  child: Obx(() => DropdownButtonFormField(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    hint: const Text(
                      "Select CT",
                      style: TextStyle(fontSize: 12),
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    value: controller.selectedItem.value.isNotEmpty
                        ? controller.selectedItem.value
                        : null,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        controller.updateSelectedItem(newValue);
                        controller.getStudentCTList();  // 👈 call the function here
                      }
                    },

                    items: controller.items
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: const TextStyle(fontSize: 16)),
                      );
                    }).toList(),
                  )),
                ),

              ],
            ),
          ),
        ),
        // Display subjects and marks
        Expanded(
          child: Obx(() {

            if (controller.selectedItem.isEmpty ) {
              return const Center(
                child: Text(
                  "No data available for the selected CT",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              );
            }
            // Display subjects and marks
            return ListView.builder(
              itemCount: controller.projectList.length,
              itemBuilder: (context, index) {
                // Find the project for this subject
                var project = controller.projectList[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 14.0, left: 14.0, top: 5.0, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  border: Border.all(
                  color: Colors.black12
                  ),
                  ),
                    child: Theme(
                      data: ThemeData().copyWith(dividerColor: Colors.transparent) ,
                      child: ExpansionTile(
                        minTileHeight: 40,
                        initiallyExpanded: true,
                        title: Text(
                          project.subject!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xff565656),
                          ),
                        ),
                        trailing:
                            Text(
                              project.date!,style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff565656),
                            ),
                            ),

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:  16.0,bottom: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Obtain Marks: ",
                                      style: TextStyle(
                                          fontSize: 12, color: Color(0xff565656)),
                                    ),
                                    Text(
                                      project.obtainMarks!.isNotEmpty
                                          ? project.obtainMarks!
                                          : "N/A",
                                      style: const TextStyle(
                                          fontSize: 12, color: Color(0xff565656)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "CT: ",
                                      style: TextStyle(
                                          fontSize: 12, color: Color(0xff565656)),
                                    ),
                                    Text(
                                      project.title!.isNotEmpty
                                          ? project.obtainMarks!
                                          : "N/A",
                                      style: const TextStyle(
                                          fontSize: 12, color: Color(0xff565656)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Total Marks: ",
                                      style: TextStyle(
                                          fontSize: 12, color: Color(0xff565656)),
                                    ),
                                    Text(
                                      project.marks!.isNotEmpty
                                          ? project.marks!
                                          : "N/A",
                                      style: const TextStyle(
                                          fontSize: 12, color: Color(0xff565656)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
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
  }
}


// class classtest_tile extends StatelessWidget {
//   const classtest_tile({
//     super.key,
//   });
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
//           padding: const EdgeInsets.all(16),
//           child:Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     decoration:BoxDecoration(
//                         color: const Color(0xff07548a),
//                         borderRadius: BorderRadius.circular(16)
//                     ),
//                     child:const Padding(
//                       padding: EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
//                       child: Text("",style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10
//                       ),),
//                     ),
//                   ),
//                   const Spacer(),
//                   const Text("12/02/1759",style: TextStyle(color: Color(0xff565656),fontSize: 10),)
//                 ],
//               ),
//               Theme(
//
//                 data:ThemeData().copyWith(dividerColor: Colors.transparent) ,
//                 child: ExpansionTile(
//                   tilePadding: EdgeInsets.zero,
//                   title: const Text("Chapter 2: Thermodynamics",style: TextStyle(fontWeight:FontWeight.bold,color: Color(0xff565656),fontSize: 12),),
//                   children: [
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             const Text("Obtain Marks",style: TextStyle(color: Color(0xff565656),fontSize: 12),),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 4.0,right: 4),
//                               child: SvgPicture.asset("assets/images/arrow.svg",),
//                             ),
//                             const Text("80",style: TextStyle(color: Color(0xff565656),fontSize: 12),),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             const Text("Total Marks",style: TextStyle(color: Color(0xff565656),fontSize: 12),),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 4.0,right: 4),
//                               child: SvgPicture.asset("assets/images/arrow.svg",),
//                             ),   const Text("100",style: TextStyle(color: Color(0xff565656),fontSize: 12),),  ],
//                         )
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