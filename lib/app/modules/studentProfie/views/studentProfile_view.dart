import 'package:alhasanain_app/app/core/base/base_view.dart';
import 'package:alhasanain_app/app/modules/welcome/controller/welcome_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import '../../../core/widget/login_screen_based_widgets/below_login_header.dart';
import '../../../routes/app_pages.dart';


class StudentProfileView extends BaseView<WelcomeController>{
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
    throw UnimplementedError();
  }

  final LinearGradient gradient = LinearGradient(
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
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return  Container(
      height: double.infinity,
      decoration: BoxDecoration(gradient: gradient),
      child: Column(
        children: [
          Container(
            height: screenHeight*.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset("assets/images/alhasanain-logo.png",
                    height:screenHeight*0.1, width: screenWidth*0.6),
              ],
            ),
          ),
          if (controller.activeScreen.value == 0)
            Expanded(
                child: BelowLoginHeader(
                 onStudentLoginPressed: _onTapNavigateStudent,
                  onParentLoginPressed:_onTapNavigateParents,
                )),

        ],
      ),
    );
    throw UnimplementedError();
  }


  void _onTapNavigateStudent() {
     // Get.toNamed(Routes.STUDENT_LOGIN,);
  }
  void _onTapNavigateParents() {
   // Get.toNamed(Routes.PARENTS_LOGIN,);
  }
}