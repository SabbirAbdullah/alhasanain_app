import 'package:alhasanain_app/app/core/base/base_view.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:alhasanain_app/app/core/widget/paging_view.dart';
import 'package:alhasanain_app/app/modules/home_mid/eDiary/controllers/eDiary_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EDairyView extends BaseView<EDairyController>{



  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: "E Dairy");
    throw UnimplementedError();
  }

  @override
  Widget body(BuildContext context) {
    return PagingView(child: Column(children: [
      // Container(
      //   decoration: BoxDecoration(
      //       boxShadow: [
      //         BoxShadow(
      //             color: Colors.grey.shade100,
      //             spreadRadius: 2,
      //             blurRadius: 1
      //         )]
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 8,bottom: 8),
      //     child: Row(children: [
      //
      //       Expanded(
      //         child: Obx(()=>DropdownButtonFormField(
      //           icon: const Icon(Icons.keyboard_arrow_down),
      //           hint: const Text("Subject",
      //               style: TextStyle(fontSize: 12)),
      //           validator: (value) {
      //             if (value == null || value.isEmpty) {
      //               return 'Choose Subject*';
      //             }
      //             return null;
      //           },
      //           decoration:
      //           InputDecoration(
      //             contentPadding: EdgeInsets.only(left:8, right: 8, top: 8, bottom: 8),
      //             filled: true,
      //             fillColor: Colors.white,
      //             focusedBorder: OutlineInputBorder(
      //               borderSide: BorderSide(
      //                 color: Colors.black12,
      //
      //               ),
      //               borderRadius: BorderRadius.circular(8),
      //             ),
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(
      //                 color: Colors.black12,
      //
      //               ),
      //               borderRadius: BorderRadius.circular(8),
      //             ),
      //             border: OutlineInputBorder(
      //               borderSide: BorderSide(
      //                 color: Colors.black12,
      //
      //               ),
      //               borderRadius: BorderRadius.circular(8),
      //             ),
      //           ),
      //
      //           onChanged: (newValue) {
      //             //part = newValue!;
      //           },
      //           items: controller.subjectList.value.map<DropdownMenuItem<String>>((String value) {
      //             return DropdownMenuItem<String>(
      //               value: value,
      //               child: Flexible(
      //                 child: Text(
      //                   value,
      //                   style:  TextStyle(fontSize: 12),
      //                 ),
      //               ),
      //             );
      //           }).toList(),
      //         )),
      //       ),
      //
      //       Expanded(
      //         child: Padding(
      //           padding:  EdgeInsets.only(left: 8.0),
      //           child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(8),
      //               color: Colors.white,
      //               border: Border.all(
      //                 color: Colors.black12,
      //               ),
      //             ),
      //             child:Padding(
      //               padding: EdgeInsets.zero,
      //               child: InkWell(
      //                 onTap: () {
      //                   controller.getStudentEDairyData();
      //
      //                   showDatePicker(
      //                     context: context,
      //                     firstDate: DateTime(2022),
      //                     lastDate: DateTime(2050),
      //                   ).then((date) {
      //                     if (date != null) {
      //                       controller.selectedDate = date;
      //                       controller.clearDiaryData();
      //                       controller.getStudentEDairyData();
      //                       print(date);
      //                     }
      //                   });
      //                 },
      //                 child: SizedBox(
      //                   height: 45,
      //                   child: Row(
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.only(left: 8.0),
      //                         child: Icon(Icons.date_range, size: 20),
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.only(left: 8.0),
      //                         child: Text(
      //                           controller.selectedDate != null ? controller.formatter.format(controller.selectedDate) : "Date",
      //                           style: TextStyle(fontSize: 12),
      //                         ),                          ),
      //                       SizedBox(width: 10),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       )
      //     ],),
      //   ),
      // ),
     Obx(() =>  ListView.builder(
         shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
         itemCount: controller.projectList.length,
         itemBuilder: (context, index) => Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
               color: Colors.white,
               border: Border.all(
                   color: Colors.black12
               ),
             ),
             child: Padding(
                 padding: EdgeInsets.only(left: 16,right: 16.0,bottom: 6.0),
                 child:Column(
                   children: [

                     Theme(
                       data:ThemeData().copyWith(dividerColor: Colors.transparent) ,
                       child: ExpansionTile(
                         tilePadding: EdgeInsets.zero,
                         expandedAlignment: Alignment.bottomLeft,
                         title:Padding(
                           padding: EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
                           child: Text(" ${controller.projectList[index].title}",style: TextStyle(
                               color: Colors.black,
                               fontSize: 16
                           ),),
                         ),
                         children: [
                           Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 16.0),
                                 child: Text("${controller.projectList[index].description}",style: TextStyle(color: Color(0xff565656),fontSize: 12),),
                               ),

                             ],
                           )
                         ],),
                     )
                   ],
                 )
             ),
           ),
         )))
    ],), onLoadNextPage: (){

    });
    throw UnimplementedError();
  }

}


