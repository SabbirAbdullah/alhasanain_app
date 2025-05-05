// views/monthly_progress_view.dart

import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/values/text_styles.dart';
import '../../../../home/model/student_ui_data.dart';
import '../controller/monthly_report_controller.dart';


class MonthlyProgressView extends StatelessWidget {
  final StudentDataResponseUi ? studentDataResponseUi;
  final MonthlyReportController controller = Get.put(MonthlyReportController());

   MonthlyProgressView({super.key,  this.studentDataResponseUi});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: CustomAppBar(appBarTitleText: 'Monthly Report'),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(() => DropdownButtonFormField<String>(
                isExpanded: true,dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(16),
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration:     InputDecoration(
                  hintText: "Select Term",
                  contentPadding: const EdgeInsets.only(left:16, right: 8, top: 8, bottom: 8),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12,

                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12,

                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                value: controller.selectedTerm.value.isEmpty ? null : controller.selectedTerm.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedTerm.value = value;
                    controller.fetchMonthlyProgress(
                        className: studentDataResponseUi!.studentClass,
                        campus: studentDataResponseUi!.campus!,
                        session: studentDataResponseUi!.session!,
                        studentId: studentDataResponseUi!.studentId,
                        startDate: controller.selectedFromDate.value,
                        endDate: controller.selectedToDate.value
                    );
                  }
                },
                // Remove duplicates from terms
                items: controller.terms.toSet().toList().map((term) {
                  return DropdownMenuItem(
                    value: term,
                    child: Text(term),
                  );
                }).toList(),
              )),
              SizedBox(height: 16,),
              if (controller.monthlyProgressList.isNotEmpty) ...[
                Obx(() => DropdownButtonFormField<String>(
                  isExpanded: true,dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  decoration:     InputDecoration(

                    contentPadding: const EdgeInsets.only(left:16, right: 8, top: 8, bottom: 8),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,

                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,

                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  hint: const Text('Select From Date'),
                  value: controller.monthlyProgressList.map((e) => e.fromDate).toSet().contains(controller.selectedFromDate.value)
                      ? controller.selectedFromDate.value
                      : null,
                  items: controller.monthlyProgressList
                      .map((e) => e.fromDate)
                      .toSet()
                      .toList()
                      .map((date) => DropdownMenuItem(
                    value: date,
                    child: Text(date),
                  ))
                      .toList(),
                  onChanged: (val) {
                    controller.selectedFromDate.value = val ?? '';
                    controller.selectedToDate.value = controller.monthlyProgressList
                        .firstWhere((element) => element.fromDate == val)
                        .toDate;
                  },
                ))

              ],
              SizedBox(height: 16,),

              Container(
                height: 50,width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                      Get.to(() => MonthlyReportView(
                        className: studentDataResponseUi!.studentClass,
                        campus: studentDataResponseUi!.campus!,
                        endDate: controller.selectedToDate.value,
                        startDate: controller.selectedFromDate.value,
                        section: studentDataResponseUi!.section,
                        studentId: studentDataResponseUi!.studentId,
                        session: studentDataResponseUi!.session,
                      ));
                    },

                  child: Text('Month Report',style: TextStyle(color: Colors.white),),
                ),
              ),

            ],
          ),
        );
      }),

    );
  }
}


// views/monthly_report_view.dart

class MonthlyReportView extends StatelessWidget {
  final MonthlyReportController controller = Get.put(MonthlyReportController());

  final String className;
  final String section;
  final String campus;
  final String studentId;
  final String startDate;
  final String endDate;
  final String ? session;

  MonthlyReportView({
    required this.className,
    required this.section,
    required this.campus,
    required this.studentId,
    required this.startDate,
    required this.endDate,
    this.session
  });

  @override
  Widget build(BuildContext context) {
    controller.fetchMonthlyReport(
      className: className,
      section: section,
      campus: campus,
      studentId: studentId,
      startDate: startDate,
      endDate: endDate,
    );

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: CustomAppBar(
       appBarTitleText: "Monthly Report",

      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.reports.isEmpty) {
          return const Center(child: Text('No data found'));
        }

        final report = controller.reports.first; // Assuming single report for simplicity

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Student Details', style: text14_600),
                    SizedBox(height: 8,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Light green background like the image
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Student\'s Name : ", style: text12_600,),
                              Expanded(child: Text('${report.studentName}', style: const TextStyle(fontSize: 12))),
                            ],
                          ),
                          Divider(color: Colors.grey.shade300,thickness: 0.5,),

                          Row(
                            children: [
                              Text("ID No : ", style: text12_600,),
                              Expanded(child: Text('${report.studentId}', style: const TextStyle(fontSize: 12))),
                              Text("Examination Term : ", style: text12_600,),
                              Expanded(child: Text('${controller.selectedTerm}',
                                  style: const TextStyle(fontSize: 12))),
                            ],
                          ),
                          Divider(color: Colors.grey.shade300,thickness: 0.5,),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Class : ',
                                    style: text12_600,
                                    children: [
                                      TextSpan(
                                        text: '${className}',
                                        style:  TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text("Month : ", style: text12_600,),

                              Expanded(child: Text('${startDate} -${endDate}',
                                  style: const TextStyle(fontSize: 12))),


                            ],
                          ),
                          Divider(color: Colors.grey.shade300,thickness: 0.5,),

                          Row(
                            children: [
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Section : ',
                                    style: text12_600,
                                    children: [
                                      TextSpan(
                                        text: '${section}',
                                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Session : ',
                                    style: text12_600,
                                    children: [
                                      TextSpan(
                                        text: '${session}',
                                        style:TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          )

                        ],
                      ),
                    )
                      ],
                    ),
                const SizedBox(height: 18),
                Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Subject Based Result', style: text14_600,),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            child: DataTable(
                              headingTextStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                              dataTextStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                              columnSpacing: 15,
                              horizontalMargin: 16,
                              headingRowHeight: 40,
                              headingRowColor: const WidgetStatePropertyAll(Color(0xFFc5d7f2)),
                              dataRowColor: const WidgetStatePropertyAll(Colors.white),
                              columns:  [
                                DataColumn(label: Text('Subject')),
                                DataColumn(label: Text('Homework')),
                                DataColumn(label: Text('${report.subjectData.first.classTestData.first.classtestTitle}')),
                              ],
                              rows: report.subjectData.isNotEmpty
                                  ? report.subjectData.map((subject) => DataRow(cells: [
                                DataCell(Text(subject.subjectName)),
                                DataCell(Text('${subject.doneHomeWork}/${subject.homeWork}')),
                                DataCell(Text('${subject.classTestData.first.obtainMarks}/${subject.classTestData.first.marks}')),

                              ])).toList()
                                  : [
                                const DataRow(cells: [
                                  DataCell(Text('No subjects available')),
                                  DataCell(Text('0/0')),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),

                const SizedBox(height: 18),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text('Attendance Summary', style: text14_600)),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          child: DataTable(
                            headingTextStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                            dataTextStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                            columnSpacing: 15,
                            horizontalMargin: 16,
                            headingRowHeight: 40,
                            headingRowColor: const WidgetStatePropertyAll(Color(0xFFc5d7f2)),
                            dataRowColor: const WidgetStatePropertyAll(Colors.white),
                            columns: const [
                              DataColumn(label: Text('Working Days')),
                              DataColumn(label: Text('Present')),
                              DataColumn(label: Text('Absent')),
                            ],
                            rows: [
                              DataRow(cells: [
                                 DataCell(Text("${report.attendanceData.totalDays}")), // Static as per your screenshot
                                DataCell(Text('${report.attendanceData.present}')),
                                DataCell(Text('${report.attendanceData.absent}')),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),


              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('$title:', style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }
}
