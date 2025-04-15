// import 'package:alhasanain_app/app/core/base/base_view.dart';
//
// import 'package:alhasanain_app/app/core/values/app_values.dart';
//
// import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../core/values/app_colors.dart';
// import '../../../core/values/text_field_decoration.dart';
// import '../../../core/values/text_styles.dart';
// import '../controller/student_fees_payment_controller.dart';
// import '../widget/fees_card.dart';
// import '../widget/fliter_card.dart';
//
//
// class StudentFeesPaymentView extends BaseView<StudentFeesPaymentController> {
//   StudentFeesPaymentView() {
//     controller.getStudentFees();
//   }
//   @override
//   PreferredSizeWidget? appBar(BuildContext context) {
//     return CustomAppBar(
//       appBarTitleText: 'Student Fees',
//     );
//   }
//   @override
//   Widget body(BuildContext context) {
//     return Column(
//       children: [
//         filterCard(),
//         Obx(
//               () => Expanded(
//             child: ListView.separated(
//               separatorBuilder: (context, index) => SizedBox(
//                 height: 10,
//               ),
//               itemCount: controller.projectList.length,
//               itemBuilder: (context, index) {
//                 var dataModel = controller.projectList[index];
//                 return FeesCard(
//                   dataModel: dataModel,
//                   callback: () => controller.makeSinglePayment(dataModel),
//                 );
//               },
//             ),
//           ),
//         ),
//         Card(
//           elevation: 4,
//           margin: EdgeInsets.zero,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(AppValues.radius_zero)),
//           color: Colors.white,
//           shadowColor: Colors.grey,
//           surfaceTintColor: Colors.grey,
//           child: Padding(
//             padding: const EdgeInsets.all(AppValues.padding),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Obx(() => Text(
//                   "Total Dues: ${controller.totalAmount.value} BDT",
//                   style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.red),
//                 )),
//                 // ElevatedButton(
//                 //     style: ElevatedButton.styleFrom(
//                 //         backgroundColor: AppColors.appBarColor),
//                 //     onPressed: () {
//                 //       makeBulkPayment(context);
//                 //     },
//                 //     child: Text(
//                 //       "Pay Dues",
//                 //       style: whiteText16,
//                 //     ))
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
//   // makeBulkPayment(BuildContext context) {
//   //   var amountController = TextEditingController();
//   //   return showDialog<String>(
//   //     context: context,
//   //     builder: (BuildContext context) => Dialog(
//   //       shape: RoundedRectangleBorder(
//   //           borderRadius: BorderRadius.circular(AppValues.radius_12)),
//   //       child: Padding(
//   //         padding: const EdgeInsets.symmetric(
//   //             horizontal: AppValues.padding, vertical: AppValues.padding_4),
//   //         child: Column(
//   //           mainAxisSize: MainAxisSize.min,
//   //           mainAxisAlignment: MainAxisAlignment.center,
//   //           children: <Widget>[
//   //             const SizedBox(height: AppValues.padding),
//   //             Align(
//   //                 alignment: Alignment.centerLeft,
//   //                 child: Text(
//   //                   "Confirm Payment",
//   //                   style: titleStyle,
//   //                 )),
//   //             const SizedBox(height: AppValues.padding),
//   //             Align(
//   //                 alignment: Alignment.centerLeft,
//   //                 child: Wrap(
//   //                   children: [
//   //                     Text(
//   //                       'Total Dues: ',
//   //                       style: subtitleTextStyle,
//   //                     ),
//   //                     Text(
//   //                       "${controller.totalAmount.value} BDT".toString(),
//   //                       style: greenAmountStyle,
//   //                     ),
//   //                   ],
//   //                 )),
//   //             const SizedBox(height: AppValues.halfPadding),
//   //             Align(
//   //                 alignment: Alignment.centerLeft,
//   //                 child: Text('Amount', style: subtitleTextStyle)),
//   //             const SizedBox(height: AppValues.halfPadding),
//   //             TextField(
//   //               decoration: lightBorderTextFieldDecoration,
//   //               controller: amountController,
//   //             ),
//   //             const SizedBox(height: AppValues.halfPadding),
//   //             Align(
//   //               alignment: Alignment.bottomRight,
//   //               child: ElevatedButton(
//   //                 style: ElevatedButton.styleFrom(
//   //                     backgroundColor: AppColors.appBarColor,
//   //                     shape: RoundedRectangleBorder(
//   //                         borderRadius:
//   //                         BorderRadius.circular(AppValues.radius_8))),
//   //                 onPressed: () {
//   //                   if (double.parse(amountController.text) <=
//   //                       controller.totalAmount.value) {
//   //                     Get.back();
//   //                     controller.makeBulkPayment(
//   //                         amountController.text, controller.projectList[0]);
//   //                   } else {
//   //                     showToast('Payment amount exceeds');
//   //                   }
//   //                 },
//   //                 child: const Text(
//   //                   'Pay Now',
//   //                   style: whiteText14,
//   //                 ),
//   //               ),
//   //             ),
//   //             const SizedBox(height: AppValues.halfPadding),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//
//
//
// }
