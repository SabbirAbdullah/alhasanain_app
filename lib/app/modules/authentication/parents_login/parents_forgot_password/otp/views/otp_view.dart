// import 'package:alhasanain_app/app/modules/authentication/student_login/view/student_login_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// import '../../forgot_password/views/forget_password_view.dart';
//
//
// class OTPView extends StatefulWidget {
//   const OTPView({super.key});
//
//   @override
//   State<OTPView> createState() => _OTPViewState();
// }
//
// class _OTPViewState extends State<OTPView> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     OTPResend();
//   }
//   void OTPResend(){
//     Future.delayed(Duration(seconds: 15)).then((_) =>
//         Get.offAll(()=>ForgotPasswordView())
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 160,
//                   ),
//
//                   Text("Enter your OTP code",
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleLarge
//                           ?.copyWith(fontWeight: FontWeight.w800, fontSize: 24)),
//                   SizedBox(height: 8),
//                   Text("A 4 digit OTP code has been sent",
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleMedium
//                           ?.copyWith(fontSize: 16, color: Colors.grey)),
//                   SizedBox(height: 16),
//                   PinCodeTextField(
//                     length: 4,
//                     obscureText: false,
//                     animationType: AnimationType.fade,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     keyboardType: TextInputType.number,
//                     pinTheme: PinTheme(
//                         shape: PinCodeFieldShape.box,
//                         borderRadius: BorderRadius.circular(5),
//                         fieldHeight: 50,
//                         fieldWidth: 40,
//                         activeFillColor: Colors.white,
//                         inactiveColor: Colors.grey.shade300,
//                         selectedFillColor: Colors.white,
//                         activeColor: Colors.grey.shade300,
//                         inactiveFillColor: Colors.white,
//                         selectedColor: Colors.green),
//                     animationDuration: Duration(milliseconds: 300),
//                     enableActiveFill: true,
//                     onCompleted: (v) {},
//                     onChanged: (value) {},
//                     appContext: context,
//                   ),
//                   SizedBox(height: 8),
//                   Container(
//                     width: double.infinity,
//                     height: 60,
//                     child: TextButton(
//                       onPressed:(){Get.to(()=>ForgotPasswordView());},
//                       style: TextButton.styleFrom(
//                         backgroundColor: Color(0xff051f64),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                       child: Text(
//                         "Submit",
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   RichText(
//                     text: TextSpan(
//                       style: TextStyle(color: Colors.grey),
//                       children: [
//                         TextSpan(text: "This code will expire in "),
//                         TextSpan(
//                             text: "120s",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.blueAccent))
//                       ],
//                     ),
//                   ),
//                   TextButton(
//                       onPressed: () {
//                       },
//                       child: Text("Resend OTP",
//                           style: TextStyle(
//                             fontSize: 16,
//                               fontWeight: FontWeight.bold, color: Colors.grey,)))
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
