import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_field_decoration.dart';
import '../../../core/values/text_styles.dart';
import '../controller/student_fees_payment_controller.dart';

abstract class MakePayment extends BaseView<StudentFeesPaymentController> {
  StudentFeesPaymentView() {
    controller.getStudentFees();
  }

  makeBulkPayment(BuildContext context) {
    var amountController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius_12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppValues.padding, vertical: AppValues.padding_4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: AppValues.padding),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirm Payment",
                    style: titleStyle,
                  )),
              const SizedBox(height: AppValues.padding),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    children: [
                      Text(
                        'Total Dues: ',
                        style: subtitleTextStyle,
                      ),
                      Text(
                        "${controller.totalAmount.value} BDT".toString(),
                        style: greenAmountStyle,
                      ),
                    ],
                  )),
              const SizedBox(height: AppValues.halfPadding),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Amount', style: subtitleTextStyle)),
              const SizedBox(height: AppValues.halfPadding),
              TextField(
                decoration: lightBorderTextFieldDecoration,
                controller: amountController,
              ),
              const SizedBox(height: AppValues.halfPadding),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appBarColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppValues.radius_8))),
                  onPressed: () {
                    if (double.parse(amountController.text) <=
                        controller.totalAmount.value) {
                      Get.back();
                      controller.makeBulkPayment(
                          amountController.text, controller.projectList[0]);
                    } else {
                      showToast('Payment amount exceeds');
                    }
                  },
                  child: const Text(
                    'Pay Now',
                    style: whiteText14,
                  ),
                ),
              ),
              const SizedBox(height: AppValues.halfPadding),
            ],
          ),
        ),
      ),
    );
  }
}
