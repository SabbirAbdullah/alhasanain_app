// import 'package:alhasanain_app/app/core/values/text_styles.dart';
// import 'package:alhasanain_app/app/modules/authentication/parents_login/parents_forgot_password/otp/views/otp_view.dart';
// import 'package:alhasanain_app/app/modules/authentication/student_login/view/student_login_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../../../core/values/app_colors.dart';
//
// class MobileNumberVerificationView extends StatefulWidget {
//   const MobileNumberVerificationView({super.key});
//
//   @override
//   State<MobileNumberVerificationView> createState() =>
//       _MobileNumberVerificationViewState();
// }
//
// class _MobileNumberVerificationViewState extends State<MobileNumberVerificationView> {
//
//   TextEditingController _mobileTEController=TextEditingController();
//   final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//            Container(
//               height: double.infinity,
//               decoration: BoxDecoration(gradient: AppColors.appBackgroundColor),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       SizedBox(height: 150,),
//
//                       Text("Forgot Password", style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 24
//                       )),
//                       SizedBox(height:8),
//                       Text("Please enter your Mobile Number",
//                           style: Theme.of(context)
//                               .textTheme
//                               .titleMedium
//                               ?.copyWith(fontSize: 16, color: Colors.grey)),
//                       SizedBox(height:50),
//
//                      getTextFormField("Mobile Number",_mobileTEController),
//                       SizedBox(height:26),
//                       Container(
//                         width:289,
//                         height: 50,
//                         child: TextButton(
//                           onPressed:(){Get.to(()=>OTPView());},
//                           style: TextButton.styleFrom(
//                             backgroundColor: AppColors.buttonColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                           ),
//                           child: Text(
//                             "Next",
//                             style: whiteText16
//                           ),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//         );
//   }
//
//
// }
//
// Widget getTextFormField(String title,TextEditingController controller){
//   return  Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         title,
//         style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Color(0xff363636)),
//       ),
//
//       SizedBox(
//         height: 4,
//       ),
//
//
//       Container(
//         child: TextFormField(
//
//           keyboardType: TextInputType.phone,
//           validator: (value){
//             if(value?.isEmpty??true && value! .isPhoneNumber){
//               return 'Please provide your Mobile Nmber';
//             }
//             return null;
//           },
//           controller:  controller,
//           decoration: InputDecoration(
//               fillColor: Colors.white,
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: BorderSide(
//                       color: Colors.grey.shade100
//                   )
//               ),
//               enabledBorder:
//               OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: BorderSide(
//                       color: Colors.grey.shade100
//                   )
//               ),
//
//
//               filled: true,),
//         ),
//       ),
//
//     ],
//   );
// }