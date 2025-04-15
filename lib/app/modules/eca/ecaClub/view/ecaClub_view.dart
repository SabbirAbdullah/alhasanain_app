import 'package:alhasanain_app/app/modules/eca/archery_screen/view/archery_view.dart';
import 'package:alhasanain_app/app/modules/eca/computer/view/computer_view.dart';
import 'package:alhasanain_app/app/modules/eca/debate/view/debate_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/eca_club_based_widgets/eca_club_grids.dart';
import '../../robotics/view/robotics_view.dart';

class ECAClub extends StatelessWidget {
  const ECAClub({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(        elevation: 1,
          iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
          centerTitle: true,
          backgroundColor: AppColors.appBarColor,

          title: const Text("ECA & Club",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
              ,fontSize:16
          ),),
          leading:const BackButton( color: Colors.white),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Get.to(()=>const RoboticsScreen());
                  },
                    child: const ECAClubGrids(clubName:"Robotics", imageAsset: "assets/images/robot.png")),
                InkWell(  onTap: (){
                  Get.to(()=>const ComputerScreen());
                },child: const ECAClubGrids(clubName:"Computer", imageAsset: 'assets/images/code.png')),
                InkWell(
                    onTap: (){
                      Get.to(()=>const ArcheryScreen());
                    },child: const ECAClubGrids(clubName:"Archery", imageAsset:'assets/images/target.png')),
              ],
            ),    Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(  onTap: (){
                    Get.to(()=>const DebateScreen());
                  },child: const ECAClubGrids(clubName:"Debate", imageAsset:'assets/images/debate.png')),
                ],
              ),
            ),
          ],
        )
    );

  }



}




//gridView_For_ECACLUBGRIDS
// GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 3, // Number of columns
// ),
// itemCount: 4, // Number of items in the grid
// itemBuilder: (BuildContext context, int index) {
// return ECAClubGrids();
// },
// ),