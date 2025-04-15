
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/values/app_colors.dart';

class ParentsLoginWidget{
  static Widget getTextFormField(String title,TextEditingController controller,bool isObsecure){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 4,
        ),
        Container( height:50,
          width: Get.width*.85,
          child: TextFormField(
            cursorColor: AppColors.appBarColor,
            obscureText: isObsecure,
            controller:  controller,
            decoration: InputDecoration(
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: Colors.grey.shade100
                  )
              ),
              enabledBorder:
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: Colors.grey.shade100
                  )
              ),


              filled: true,),
          ),
        ),
      ],);
  }




  static Widget topView(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0,right: 32,left:32),
      child: Center(
        child: Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(('assets/images/vactor_parents.svg'),color: Colors.black,),
            const SizedBox(width: 10,),
            const Text(
              "Parents Login",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
  //
  // static Widget forgetPassword(){
  //   return  Container(
  //     width: 300,height: 50,
  //     child: Row(mainAxisAlignment: MainAxisAlignment.end,
  //
  //       children: [
  //         TextButton(
  //           onPressed: () {
  //             try {
  //               Get.to(() => MobileNumberVerificationView());
  //             } catch (e) {
  //               print('Error navigating to ForgotPasswordView: $e');
  //             }
  //           },
  //           child: Text(
  //             "Forgot Password?",
  //             style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.appBarColor),
  //           ),
  //
  //         ),
  //       ],
  //     ),
  //   );
  // }

  static Widget alhasanainBanner(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset("assets/images/alhasanain-logo.png",
            height:Get.height*0.1, width: Get.width*0.6),
      ],
    );
  }

}


