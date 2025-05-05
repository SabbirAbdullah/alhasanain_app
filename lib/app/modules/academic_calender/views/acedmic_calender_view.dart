import "package:alhasanain_app/app/core/values/app_colors.dart";

import "package:alhasanain_app/app/core/widget/custom_app_bar.dart";
import "package:flutter/material.dart";

import "../../../core/base/base_view.dart";
import "../controllers/academic_calender_controller.dart";
import "academic_eventTile_view.dart";

class AcademicCalenderView extends BaseView<AcademicCalenderController> {
 AcademicCalenderView(){
   controller.getMonthAcademicEvents('2025-04');
 }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: "Academic Calender");
  }

  @override
  Widget body(BuildContext context) {
    return DefaultTabController(

      length: 12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          TabBar(
            indicatorColor: AppColors.appBarColor,
            labelColor: AppColors.appBarColor,
            physics: const ScrollPhysics(),
            onTap: (index){
              controller.getMonthAcademicEvents('2025-0${index+1}');
            },
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              padding: EdgeInsets.zero,
              tabs: const [
                Tab(text: "January",),
                Tab(text: "February"),
                Tab(text: "March"),
                Tab(text: "April"),
                Tab(text: "May"),
                Tab(text: "June"),
                Tab(text: "July"),
                Tab(text: "August"),
                Tab(text: "September"),
                Tab(text: "October"),
                Tab(text: "November"),
                Tab(text: "December"),
              ]),
          Expanded(
            child: Container(
              color: AppColors.pageBackground,
              height: MediaQuery.of(context).size.height * 80,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                  children: [
                AcademicEventTile(controller: controller,),
                AcademicEventTile(controller: controller,),
                AcademicEventTile(controller: controller,),
                AcademicEventTile(controller: controller,),
                AcademicEventTile(controller: controller,),
                AcademicEventTile(controller: controller,),
                AcademicEventTile(controller: controller,),
                AcademicEventTile(controller: controller,),
                AcademicEventTile(controller: controller,),
                AcademicEventTile(controller: controller,),
                AcademicEventTile(controller: controller,),
                AcademicEventTile(controller: controller,),
              ]),
            ),
          )
        ],
      ),
    );

  }
}

