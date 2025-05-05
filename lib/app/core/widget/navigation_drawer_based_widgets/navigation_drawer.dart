
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repository/fcm_token_repository.dart';
import '../../../data/repository/pref_repository.dart';
import '../../../modules/about_alhasanain/view/about_alhasanain.dart';
import '../../../modules/academic_calender/views/academic_calender_view.dart';
import '../../../modules/academic_calender/views/acedmic_calender_view.dart';
import '../../../modules/account_delete/view/delete_view.dart';
import '../../../modules/complain/view/complain.dart';
import '../../../modules/eca/ecaClub/view/ecaClub_view.dart';
import '../../../modules/home/model/student_ui_data.dart';
import '../../../modules/home_mid/result/result_view.dart';
import '../../../modules/home_mid/result/term_report/view/term_report.dart';
import '../../../modules/incident_report/view/incident_view.dart';
import '../../../modules/studentInfo/views/student_info_view.dart';
import '../../../routes/app_pages.dart';
import '../../values/app_colors.dart';
import '../../values/text_styles.dart';
import 'drawer_header_info.dart';
import 'nav_drawer_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key, required this.studentDataResponseUi, required this.userType}) : super(key: key);
  final StudentDataResponseUi studentDataResponseUi;
  final String userType;

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  final NavDrawerController controller=NavDrawerController();

  final PrefRepository _prefRepository=  Get.find(tag: (PrefRepository).toString());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.pageBackground,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Column(
              children: [
                SizedBox(height: 10,),
                DrawerHeaderWidget(studentName: "${widget.studentDataResponseUi.studentFirstName} ${widget.studentDataResponseUi.studentLastName} ",
                  studentClass: "${widget.studentDataResponseUi.studentClass}",),
                ListTile(
                  leading: Icon(Icons.person_2_rounded),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => StudentInfo(studentDataResponse: widget.studentDataResponseUi,)));
                  },
                ),
                widget.userType=="Parents"?ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('Fees'),
                  onTap:_onTapNavigateFees,
                ):Container(),
        
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Results'),
                  onTap: (){
                    Get.to(()=>ResultView(studentDataResponseUi: widget.studentDataResponseUi,));

                  }),
        
                widget.userType=="Parents"? ListTile(
                  leading: Icon(Icons.report_outlined),
                  title: Text('Complain'),
                  onTap: () {
                    Get.to(()=>Complain(studentDataResponseUi: widget.studentDataResponseUi))
;                  },
                ):Container(),
                ListTile(
                  leading: Icon(Icons.school_outlined),
                  title: Text('ECA & Club'),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => ECAClub()));
                  },
                ),
                // ListTile(
                //   leading: Icon(Icons.memory),
                //   title: Text('Hifdh'),
                //   onTap: () {
                //     // Navigator.of(context)
                //     //     .push(MaterialPageRoute(builder: (context) => HifdhScreen()));
                //   },
                // ),
                ListTile(
                  leading: Icon(Icons.newspaper),
                  title: Text('Event &News'),
                  onTap: ()=>_navigateEventNews(widget.studentDataResponseUi),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_month),
                  title: Text('Academic Calender'),
                  onTap: () =>Get.to(()=>AcademicCalendarPage())
                  // onTap: () =>_navigateAcademicCalender(widget.studentDataResponseUi),
                ),
                widget.userType=="Parents"? ListTile(
                    leading: Icon(Icons.report_problem_outlined),
                    title: Text('Incident Report'),
                    onTap: () =>Get.to(()=>IncidentView(studentDataResponseUi: widget.studentDataResponseUi,))
                  // onTap: () =>_navigateAcademicCalender(widget.studentDataResponseUi),
                ): Container(),
        
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('About AL Hasanain'),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Aboutalhasanain()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip_outlined),
                  title: Text('Privacy and policies'),
                  onTap: () {
                    Get.toNamed(Routes.PRIVACY_POLICY);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.insert_drive_file_outlined),
                  title: Text('Terms & Conditions'),
                  onTap: () {
                    Get.toNamed(Routes.TERMS_CONDITION);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete_forever),
                  title: Text('Request Account Delete'),
                  onTap: () {
                    Get.to(()=>DeleteAccountPage());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Log out'),
                  onTap:_onTapNavigateStudentCT,
                ),
        
              ],
            ),
        
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Developed by mPair Technologies Ltd.",style: greyText_13_400,)],
              ),
        
        
            ]
          ),
        ),
      ),
    );
  }
  Future<void> _logout() async {
    try {
      // Delete the FCM token from device
      await FirebaseMessaging.instance.deleteToken();
      print('✅ FCM token cleared from device');

      // Clear app stored data
      await _prefRepository.remove("token");
      await _prefRepository.remove("id");
      await _prefRepository.remove("type");
      await _prefRepository.remove("fcm_token");

      // Optionally: you can also hit an API to remove token server-side if needed
    } catch (e) {
      print('❌ Error while logout: $e');
    }
  }

  Future<void> _onTapNavigateStudentCT() async {
    await _logout();
    Get.offAllNamed(Routes.MAIN);
  }



  // final FcmRepository fcmRepository =  Get.put(FcmRepository());
  Future<void> clearFcmToken() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
      print('FCM token cleared');
    } catch (e) {
      print('Error clearing FCM token: $e');
    }
  }

  // Future<void> clearToken() async {
  //
  //   String? token = null;
  //   var user = await _prefRepository.getString("id");
  //   var type = await _prefRepository.getString("type");
  //
  //   if (user.isNotEmpty && type.isNotEmpty) {
  //     final success = await fcmRepository.updateDeviceToken(user, type, token!);
  //     if (success) {
  //       print('✅ FCM token sent successfully');
  //     } else {
  //       print('❌ Failed to send FCM token');
  //     }
  //   } else {
  //     print('⚠️ User info not found');
  //   }
  // }



 void _onTapNavigateFees(){
    Get.toNamed(Routes.PARENTS_STUDENT_PAYMENT_VIEW,);
  }


  void _navigateEventNews(StudentDataResponseUi studentDataResponseUi){
    Get.toNamed(Routes.EVENT_AND_NEWS,arguments: studentDataResponseUi);
  }
  void _navigateAcademicCalender(StudentDataResponseUi studentDataResponseUi){
    Get.toNamed(Routes.ACADEMIC_CALENDER_VIEW,arguments: studentDataResponseUi);
  }
}
