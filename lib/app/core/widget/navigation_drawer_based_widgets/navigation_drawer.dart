
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repository/pref_repository.dart';
import '../../../modules/about_alhasanain/view/about_alhasanain.dart';
import '../../../modules/academic_calender/views/academic_calender_view.dart';
import '../../../modules/academic_calender/views/acedmic_calender_view.dart';
import '../../../modules/account_delete/view/delete_view.dart';
import '../../../modules/complain/view/complain.dart';
import '../../../modules/eca/ecaClub/view/ecaClub_view.dart';
import '../../../modules/home/model/student_ui_data.dart';
import '../../../modules/studentInfo/views/student_info_view.dart';
import '../../../routes/app_pages.dart';
import '../../values/app_colors.dart';
import '../../values/text_styles.dart';
import 'drawer_header_info.dart';
import 'nav_drawer_controller.dart';

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
                // widget.userType=="Parents"?ListTile(
                //   leading: Icon(Icons.attach_money),
                //   title: Text('Fees'),
                //   onTap:_onTapNavigateFees,
                // ):Container(),
        
                // ListTile(
                //   leading: Icon(Icons.school),
                //   title: Text('Results'),
                //   onTap: ()=>_onNavigateReportList(widget.studentDataResponseUi),
                // ),
        
                widget.userType=="Parents"? ListTile(
                  leading: Icon(Icons.report_outlined),
                  title: Text('Complain'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Complain()));
                  },
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

  void _logout()async{
   await _prefRepository.remove("token");
   await _prefRepository.remove("id");
   await _prefRepository.remove("type");

  }
  Future<void> _onTapNavigateStudentCT() async {
    _logout();
    Get.offAllNamed(Routes.MAIN,);
  }


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
