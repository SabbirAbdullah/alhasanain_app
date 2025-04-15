// import 'package:alhasanain_app/app/modules/authentication/student_login/view/student_login_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ForgotPasswordView extends StatefulWidget {
//   const ForgotPasswordView({super.key});
//
//   @override
//   State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
// }
//
// class _ForgotPasswordViewState extends State<ForgotPasswordView> {
//   bool _isObsecure=true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         title: Text(
//           "Forgot Password?",
//           style: TextStyle(
//             fontSize:16,
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
//           onPressed: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (context) => StudentLoginView()));
//           },
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 120,
//               ),
//
//               Text("Change Your Password",
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleLarge
//                       ?.copyWith(fontWeight: FontWeight.w800, fontSize: 24)),
//               SizedBox(height:32),
//               getTextFormField("New Password"),
//               getTextFormField("Confirm Password"),
//               SizedBox(height:20),
//               Container(
//                 width: double.infinity,
//                 height: 60,
//                 child: TextButton(
//                   onPressed:(){Get.offAll(StudentLoginView());},
//                   style: TextButton.styleFrom(
//                     backgroundColor: Color(0xff051f64),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   ),
//                   child: Text(
//                     "Confirm New Password",
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget getTextFormField(String title){
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Color(0xff363636)),
//         ),
//         SizedBox(
//           height: 4,
//         ),
//         TextFormField(obscureText: true,
//          // controller:  controller,
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
//               filled: true, contentPadding: EdgeInsets.all(20)),
//         ),
//       ],);
//   }
// }
