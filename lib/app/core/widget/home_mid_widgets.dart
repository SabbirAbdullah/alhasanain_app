
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/academic_calender/views/academic_calender_view.dart';
import '../../modules/eca/ecaClub/view/ecaClub_view.dart';
import '../../modules/home/model/student_ui_data.dart';
import '../../modules/home_mid/attendence/views/attendence_view.dart';
import '../../modules/home_mid/classroutine/controllers/class_routine_controller.dart';
import '../../modules/home_mid/classroutine/views/classroutine_view.dart';
import '../../modules/home_mid/eDiary/views/eDiary_view.dart';
import '../../routes/app_pages.dart';
import 'cards.dart';


class HomeMidWidgets extends StatelessWidget {
  final StudentDataResponseUi studentDataResponseUi;
  const HomeMidWidgets({
    super.key, required this.studentDataResponseUi,
  });

  @override
  Widget build(BuildContext context) {
    final ClassRoutineController routineController = Get.put(ClassRoutineController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeCards(
              title: "Attendance",
              onTap:_onTapNavigateAttendance,

              image: 'assets/images/attend.png',
              cardWidthPercentage: 0.31,
            ),
            HomeCards(
              title: "eDiary",
              onTap: _onTapNavigateEDairy,
              image: 'assets/images/diary.png',
              cardWidthPercentage: 0.31,
            ),
            HomeCards(
              title: "Classwork",
              onTap:_onTapNavigateCW,

              image: 'assets/images/cw.png',
              cardWidthPercentage: 0.31,
            ),



          ],
        ),
        SizedBox(height: 4,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeCards(
              title: "Homework",
              onTap:_onTapNavigateStudent,
              image: 'assets/images/hw.png',
              cardWidthPercentage: 0.31,
            ),
            HomeCards(
              title: "Class Test",
              onTap:_onTapNavigateStudentCT,
              image: 'assets/images/ct.png',
              cardWidthPercentage: 0.31,
            ),


            HomeCards(
              title: "Class Routine",
              image: "assets/images/cr.png",
              onTap:(){
                _onTapNavigateClassRoutine();
                routineController.fetchRoutines(studentDataResponseUi.studentClass, studentDataResponseUi.session, studentDataResponseUi.campus, studentDataResponseUi.section);
                routineController.fetchPeriods(studentDataResponseUi.studentClass, studentDataResponseUi.session, studentDataResponseUi.campus,);

              },
              cardWidthPercentage: 0.31,
            ),
          ],
        ),
        SizedBox(height: 4,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeCards(
              title: "ECA & Club",
              onTap:(){Get.to(()=> ECAClub());},

              image: 'assets/images/eca_club.png',
              cardWidthPercentage: 0.31,
            ),

            HomeCards(
              title: "Academic Calender",
              onTap: () =>Get.to(()=>AcademicCalendarPage()),
              image: 'assets/images/academic_calendar.png',
              cardWidthPercentage: 0.31,
            ),

            HomeCards(
              title: "Fees",
              onTap: _onTapNavigateFees,
              image: 'assets/images/salary.png',
              cardWidthPercentage: 0.31,
            ),




          ],
        ),
        SizedBox(height: 16),

      ],
    );
  }
  void _onTapNavigateStudent() {
    Get.toNamed(Routes.STUDENT_HOMEWORK_LIST,arguments: studentDataResponseUi);
  }

  void _onTapNavigateEDairy() {
    Get.toNamed(Routes.STUDENT_DAIRY,arguments: studentDataResponseUi);
  }

  void _onTapNavigateAttendance() {
    Get.toNamed(Routes.STUDENT_ATTENDENCE,arguments: studentDataResponseUi);
  }
  void _onTapNavigateCW() {
    Get.toNamed(Routes.CW,arguments: studentDataResponseUi);
  }

  void _onTapNavigateStudentCT() {
    Get.toNamed(Routes.STUDENT_CT_LIST,arguments: studentDataResponseUi);
  }
  void _onTapNavigateClassRoutine() {
    Get.toNamed(Routes.CLASS_ROUTINE,arguments: studentDataResponseUi);
  }

  void _onTapNavigateFees(){
    Get.toNamed(Routes.PARENTS_STUDENT_PAYMENT_VIEW,);
  }




}


