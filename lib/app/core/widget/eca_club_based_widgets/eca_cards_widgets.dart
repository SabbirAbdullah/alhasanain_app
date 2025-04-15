import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../modules/eca/archery_screen/view/archery_view.dart';
import '../../../modules/eca/computer/view/computer_view.dart';
import '../../../modules/eca/debate/view/debate_view.dart';
import '../../../modules/eca/robotics/view/robotics_view.dart';
import 'eca_card.dart';




class ECACardsWidegts extends StatefulWidget {
  const ECACardsWidegts({super.key});

  @override
  State<ECACardsWidegts> createState() => _ECACardsWidegtsState();
}

class _ECACardsWidegtsState extends State<ECACardsWidegts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0,left:10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ECACards(
            title: "Robotics",
            onTap: () {
              Get.to(()=>RoboticsScreen());
            },
            image: 'assets/images/robot.png',
            cardWidthPercentage: 0.23,
          ),
          ECACards(
            title: "Computer",
            onTap: () {
              Get.to(()=>ComputerScreen());
            },
            image: 'assets/images/code.png',
            cardWidthPercentage: 0.23,
          ),
          ECACards(
            title: "Archery",
            onTap: () {
              Get.to(()=>ArcheryScreen());            },
            image: 'assets/images/target.png',
            cardWidthPercentage: 0.23,
          ),
          ECACards(

            title: "Debate",
            onTap: () {
              Get.to(()=>DebateScreen());
            },
            image: 'assets/images/debate.png',
            cardWidthPercentage: 0.23,
          ),
        ],
      ),
    );
  }
}
