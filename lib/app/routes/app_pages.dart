import 'package:alhasanain_app/app/modules/academic_calender/bindings/academic_calender_binding.dart';
import 'package:alhasanain_app/app/modules/authentication/parents_login/binding/parents_login_bindings.dart';
import 'package:alhasanain_app/app/modules/authentication/parents_login/view/parents_login_view.dart';
import 'package:alhasanain_app/app/modules/authentication/student_login/binding/student_login_bindings.dart';
import 'package:alhasanain_app/app/modules/daily_lesson/binding/daily_lesson_binding.dart';
import 'package:alhasanain_app/app/modules/event_and_news/view/event_news_view.dart';
import 'package:alhasanain_app/app/modules/home_mid/CT/bindings/ct_binding.dart';
import 'package:alhasanain_app/app/modules/home_mid/CT/views/ct_view.dart';
import 'package:alhasanain_app/app/modules/home_mid/classwork/views/classwork_view.dart';
import 'package:alhasanain_app/app/modules/home_mid/eDiary/bindings/eDiary_binding.dart';
import 'package:alhasanain_app/app/modules/home_mid/eDiary/views/eDiary_view.dart';
import 'package:alhasanain_app/app/modules/home_mid/homework/bindings/homework_binding.dart';
import 'package:alhasanain_app/app/modules/home_mid/homework/views/homework_view.dart';

import 'package:alhasanain_app/app/modules/parents_students_choice/binding/parents_studens_choice_binding.dart';
import 'package:alhasanain_app/app/modules/privacy_policies/terms_condition.dart';
import 'package:alhasanain_app/app/modules/privacy_policies/views/privacy_policy.dart';
import 'package:alhasanain_app/app/modules/student_fees_payment/binding/student_fees_payment_bindings.dart';
import 'package:alhasanain_app/app/modules/welcome/binding/welcome_bindings.dart';
import 'package:alhasanain_app/app/modules/welcome/view/welcome_view.dart';
import '../modules/academic_calender/views/acedmic_calender_view.dart';
import '../modules/authentication/student_login/view/student_login_view.dart';
import '../modules/daily_lesson/view/daily_lesson.dart';
import '../modules/event_and_news/binding/envent_news_bindings.dart';
import '../modules/home_mid/attendence/bindings/attendence_binding.dart';
import '../modules/home_mid/attendence/views/attendence_view.dart';
import '../modules/home_mid/classroutine/bindings/classroutine_binding.dart';
import '../modules/home_mid/classroutine/views/classroutine_view.dart';
import '../modules/home_mid/classwork/binding/classwork_binding.dart';

import '../modules/parents_students_choice/view/parents_students_choice_view.dart';
import '../modules/student_fees_payment/view/student_fees_payment_view.dart';
import '/app/modules/favorite/bindings/favorite_binding.dart';
import '/app/modules/favorite/views/favorite_view.dart';
import '/app/modules/home/bindings/home_binding.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/other/bindings/other_binding.dart';
import '/app/modules/other/views/other_view.dart';
import '/app/modules/settings/bindings/settings_binding.dart';
import '/app/modules/settings/views/settings_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;
  static const STUDENT = Routes.STUDENT_MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => WelcomeVIew(),
      binding: WelcomeBindings(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    // GetPage(
    //   name: _Paths.SETTINGS,
    //   page: () => SettingsView(),
    //   binding: SettingsBinding(),
    // ),
    GetPage(
      name: _Paths.OTHER,
      page: () => OtherView(),
      binding: OtherBinding(),
    ),

    GetPage(
      name: _Paths.STUDENT_LOGIN,
      page: () => StudentLoginView(),
      binding: StudentLoginBindings(),
    ),
    GetPage(
      name: _Paths.PARENTS_LOGIN,
      page: () => ParentsLoginView(),
      binding: ParentsLoginBindings(),
    ),

    GetPage(
      name: _Paths.STUDENT_MAIN,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),


    GetPage(
      name: _Paths.STUDENT_HOMEWORK_LIST,
      page: () => HomeWorkListView(),
      binding: HomeWorkListBindings(),
    ),

    GetPage(
      name: _Paths.STUDENT_CT_LIST,
      page: () => CtScreen(),
      binding: CTListBindings(),
    ),

    GetPage(
      name: _Paths.STUDENT_ATTENDENCE,
      page: () => AttendanceScreen(),
      binding: AttendenceBinding(),
    ),

    GetPage(
      name: _Paths.STUDENT_DAIRY,
      page: () => EDairyView(),
      binding: EDiryBingings(),
    ),

    GetPage(
      name: _Paths.CLASS_WORK,
      page: () => ClassWorkView(),
      binding: ClassworkBinding(),
    ),
    GetPage(
      name: _Paths.CLASS_ROUTINE,
      page: () => ClassroutineView(),
      binding: ClassRoutineBinding(),
    ),

    GetPage(
      name: _Paths.PARENTS_STUDENT_CHOISE,
      page: () => ParentStudentChoiceView(),
      binding: ParentsStudentChoiceBinding(),
    ),

    // GetPage(
    //   name: _Paths.PARENTS_STUDENT_PAYMENT_VIEW,
    //   page: () => StudentFeesPaymentView(),
    //   binding: StudentFeesPaymentBindings(),
    // ),
    GetPage(
      name: _Paths.EVENT_AND_NEWS,
      page: () => EventNewsView(),
      binding: EventNewsBindings(),
    ),

    // GetPage(
    //   name: _Paths.STUDENT_REPORT_LIST,
    //   page: () => ResultScreenView(),
    //   binding: ResultListBindings(),
    // ),


    // GetPage(
    //   name: _Paths.PRESCHOOL_PROGRESS_REPORT,
    //   page: () => ProgressReportView(),
    //   binding: ProgressReportBindings(),
    // ),
    GetPage(
      name: _Paths.ACADEMIC_CALENDER_VIEW,
      page: () => AcademicCalenderView(),
      binding: AcademicCalenderBindings(),
    ),
    GetPage(
        name: _Paths.PRIVACY_POLICY,
        page: () =>PrivacyPolicyPage()
    ),
    GetPage(
        name: _Paths.PRIVACY_POLICY,
        page: () =>PrivacyPolicyPage()
    ),
    GetPage(
        name: _Paths.TERMS_CONDITION,
        page: () =>TermsAndConditionsPage()
    ),
    GetPage(
      name: _Paths.DAILY_LESSON,
      page: () => DailyLesson(),
      binding: DailyLessonBinding(),
    ),

  ];
}