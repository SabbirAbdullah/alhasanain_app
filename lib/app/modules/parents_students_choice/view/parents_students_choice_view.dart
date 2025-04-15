import 'package:alhasanain_app/app/core/base/base_view.dart';

import 'package:alhasanain_app/app/core/values/app_values.dart';
import 'package:alhasanain_app/app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controller/parents_students_choice_controller.dart';

class ParentStudentChoiceView extends BaseView<ParentsStudentChoiceController> {
  ParentStudentChoiceView() {
    controller.getStudentParents();
  }
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 0,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: const Color(0x00e6F9FF) ,
    );
    throw UnimplementedError();
  }

  final LinearGradient gradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x00e6F9FF),
      Color(0xffe9fff8),
      Color(0xfff6fece),
    ],
  );

  @override
  Widget body(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(gradient: gradient),
      child: Column(
        children: [
          Container(
            height: screenHeight * .20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset("assets/images/alhasanain-logo.png",
                    height: screenHeight * 0.1, width: screenWidth * 0.6),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Select Student",
            style: titleCenterTextStyle,
          ),
          const SizedBox(
            height: AppValues.padding,
          ),
          Expanded(child: getAvailableStudentList()),
        ],
      ),
    );

    throw UnimplementedError();
  }

  Widget getAvailableStudentList() {
    return Obx(() => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.projectList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                onTap: () => _onTapNavigateStudent(
                    controller.projectList[index].studentId),
                // leading: CircleAvatar(radius: 24,),
                title: Text(
                  "${controller.projectList[index].studentFirstName} ${controller.projectList[index].studentLastName}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black87),
                ),
                subtitle:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppValues.radius),
                          color: Colors.blue[100],
                          border: Border.all(color: Colors.blue
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppValues.halfPadding,vertical: AppValues.padding_2),
                        child: Text(
                          "${controller.projectList[index].studentId}",
                          style: const TextStyle(color: Color(0xff213a59),fontSize: 11),
                        ),
                      ))
                ],),
              ),
            ),
          ),
        ));
  }

  void _onTapNavigateStudent(String studentId) {
    controller.setStudentId(studentId);
    Get.offAllNamed(
      Routes.STUDENT_MAIN,
    );
  }
}
