import 'package:alhasanain_app/app/core/base/base_view.dart';
import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/modules/welcome/controller/welcome_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../widget/below_login_header.dart';
import '../widget/login_footer.dart';

class WelcomeVIew extends BaseView<WelcomeController>{


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(toolbarHeight: 0,
      backgroundColor:  Color(0xffe6f9ff),

    );
    throw UnimplementedError();
  }

  @override
  Widget body(BuildContext context) {

    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(

      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(gradient: AppColors.appBackgroundColor),
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight*.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset("assets/images/alhasanain-logo.png",
                        height:screenHeight*0.5, width: screenWidth*0.6),
                  ],
                ),
              ),
              Spacer(),

              if (controller.activeScreen.value == 0)
                Center(
                  child: BelowLoginHeader(
                    onStudentLoginPressed: _onTapNavigateStudent,
                    onParentLoginPressed:_onTapNavigateParents,
                  ),
                ),

              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CopyrightText()
                ],
              ),
              SizedBox(height: 10,)

            ],
          ),

        ),
    );
    throw UnimplementedError();
  }

  void _onTapNavigateStudent() {
    Get.toNamed(Routes.STUDENT_LOGIN,);
  }
  void _onTapNavigateParents() {
    Get.toNamed(Routes.PARENTS_LOGIN,);
  }
}