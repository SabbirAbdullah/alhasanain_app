import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';
import '../model/student_fee_payment_ui_data.dart';

class FeesCard extends StatelessWidget {
  const FeesCard({super.key, required this.dataModel, required this.callback});
  final StudentPaymentFeeUiData dataModel;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppValues.halfPadding, vertical: AppValues.padding_2),
      child: Container(
        decoration: boxDecorationStyle,
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding_2),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dataModel.balance == 0
                    ?Text("৳ ${dataModel.amount}",
                      style: greenAmountStyle
                    )
                        :Row(
                          children: [
                            Text("৳ ${dataModel.amount} ",style:greenAmountStyle ,),
                            Text("(Due: ${dataModel.balance})",style:redAmountStyle ,)
                          ],
                        ),
                    dataModel.balance == 0
                    ?Container(padding: EdgeInsets.only(left: 8,right: 8),
                      decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(50)),
                      child: Text("Paid",style: TextStyle(color: Colors.white,fontSize: 11),),)
                        : Container(padding: EdgeInsets.only(left: 8,right: 8),
                      decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(50)),
                      child: Text("Due",style:  TextStyle(color: Colors.white,fontSize: 11),),)
                  ],
                ),
                Text(
                  "${dataModel.feesType}",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            subtitle: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("Fees Month: ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12)),
                Text(
                  dataModel.feesMonth=='Null'?'N/A':"${getMonthName(dataModel.feesMonth)}",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                ),

                Text(", Due Date: ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12)),
                Text(
                  "${dataModel.dueDate}",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                ),
              ],
            ),
            // trailing: dataModel.paid == "${dataModel.amount}"
            //     ? Card(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //         horizontal: AppValues.padding),
            //     child: Text(
            //       "Paid",
            //       style: whiteText12,
            //     ),
            //   ),
            //   color: Colors.green,
            // )
            //     : InkWell(
            //   onTap: () {
            //     payNowDialog(context);
            //   },
            //   child: Card(
            //     color: AppColors.appBarColor,
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //           horizontal: AppValues.halfPadding,
            //           vertical: AppValues.padding_2),
            //       child: Text(
            //         "Pay Now",
            //         style: whiteText12,
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }

  payNowDialog(BuildContext context) {
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
              Container(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(dataModel.feesType),
                  trailing: Text(
                    "${dataModel.amount} BDT",
                    style: greenAmountStyle,
                  ),
                ),
              ),
              const SizedBox(height: AppValues.padding),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: AppColors.appBarColor,
              //         shape: RoundedRectangleBorder(
              //             borderRadius:
              //             BorderRadius.circular(AppValues.radius_8))),
              //     onPressed: () {
              //       Navigator.pop(context);
              //       callback();
              //     },
              //     child: const Text(
              //       'Pay Now',
              //       style: whiteText14,
              //     ),
              //   ),
              // ),
              const SizedBox(height: AppValues.padding),
            ],
          ),
        ),
      ),
    );
  }
  String getMonthName(String dateString) {
    DateTime date = DateTime.parse(dateString + '-01');
    String monthName = DateFormat.MMMM().format(date);
    return monthName;
  }


}
