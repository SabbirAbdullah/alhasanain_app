import 'package:alhasanain_app/app/core/values/text_styles.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../data/model/term_report_model.dart';
import '../../../../home/model/student_ui_data.dart';
import '../../monthly_report/view/monthly_report_view.dart';
import '../controller/result_controller.dart';

class ResultPage extends StatelessWidget {
  final StudentDataResponseUi ? studentDataResponseUi;
  ResultPage({super.key,  this.studentDataResponseUi});

  final ResultController controller = Get.put(ResultController());
  final List<String> terms = ['Mid Term', 'Final Term'];
  final RxString selectedTerm = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: 'Term Report'),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
              value: selectedTerm.value.isEmpty ? null : selectedTerm.value,
              onChanged: (value) {
                if (value != null) {
                  selectedTerm.value = value;
                  controller.checkResultStatus(
                    className: studentDataResponseUi!.studentClass,
                    sectionName: studentDataResponseUi!.section,
                    session: studentDataResponseUi!.session!,
                    resultFor: selectedTerm.value,
                    studentId: studentDataResponseUi!.studentId,
                    campus: studentDataResponseUi!.campus!,
                  );
                }
              },
              items: terms.map((term) => DropdownMenuItem(
                value: term,
                child: Text(term),
              )).toList(),
            )),
            const SizedBox(height: 20),


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
                      // Navigate to the Academic Transcript page
                      Get.to(() => AcademicTranscriptPage());
                    },
                    child: Text('Academic Transcript',style: TextStyle(color: Colors.white),),
                  ),
                ),
            

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }


}



class AcademicTranscriptPage extends StatelessWidget {

  final ResultController controller = Get.put(ResultController());
  @override
  Widget build(BuildContext context) {
    final selectedTerm = Rx<String>(''); // Ensure this is initialized or passed appropriately

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: CustomAppBar(appBarTitleText: 'Academic Transcript'),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.termReportModel.value != null) {
                  final studentReport = controller.termReportModel.value!.message!.first;
                  final subjectResults = studentReport.data!.subjectResult;
                  final gradingMarks = studentReport.data!.gradingMarks;
                  final attendance = studentReport.data!.attendanceData;
                  final performance = studentReport.data!.studentPerformance;

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildSectionHeader('Student Details'),
                        _buildStudentDetails(studentReport),
                        const SizedBox(height: 20),
                        _buildSectionHeader('Performance Level'),
                        _buildPerformanceLevel(gradingMarks!),

                        const SizedBox(height: 20),

                        _buildSectionHeader('Subject Based Results'),
                        _buildSubjectResults(subjectResults!),

                        const SizedBox(height: 20),

                        if (attendance != null) ...[
                          _buildSectionHeader('Attendance Summary'),
                          _buildAttendanceSummary(attendance),
                        ],

                        const SizedBox(height: 20),

                        if (performance != null) ...[
                          _buildSectionHeader('Performance Summary'),
                          _buildPerformanceSummary(performance),
                          const SizedBox(height: 20),
                          _buildSectionHeader('Comments'),
                          _buildComments(performance[0].comments!),
                        ],
                      ],
                    ),
                  );
                }

                return const Center(child: Text('Please select a term to view result'));
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
    );
  }

  Widget _buildCard(Widget child) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue)
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: child,
      ),
    );
  }

  Widget _buildStudentDetails(studentReport) {
    return
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD8EAD8), // Light green background like the image
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Student\'s Name : ", style: text12_600,),
                  Expanded(child: Text('${studentReport.studentName}', style: const TextStyle(fontSize: 12))),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text("ID No. : ", style: text12_600,),
                  Expanded(child: Text('${studentReport.studentId}', style: const TextStyle(fontSize: 12))),

                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text("Examination Term : ", style: text12_600,),

                  Expanded(child: Text('${studentReport.data.subjectResult.first.termName}',
                      style: const TextStyle(fontSize: 12))),
                ],
              ),

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
                            text: '${studentReport.data.subjectResult.first.className}',
                            style:  TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Section : ',
                        style: text12_600,
                        children: [
                          TextSpan(
                            text: '${studentReport.data.subjectResult.first.section}',
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
                            text: '${studentReport.data.subjectResult.first.session}',
                            style:TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              ),

            ],
          ),
        );

  }

  Widget _buildPerformanceLevel(List gradingMarks) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingTextStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
        dataTextStyle: TextStyle(fontWeight:
        FontWeight.w400,fontSize: 11),
        columnSpacing: 20,

        horizontalMargin: 10,headingRowHeight: 40,
        headingRowColor: WidgetStatePropertyAll(Color(0x8097C5E1)) ,
        dataRowColor: WidgetStatePropertyAll(Color(0xFFD8EAD8)) ,
        columns: const [
          DataColumn(label: Text('Performance')),
          DataColumn(label: Text('Grade')),
          DataColumn(label: Text('Marks')),
          DataColumn(label: Text('Description')),
        ],
        rows: gradingMarks.map<DataRow>((mark) {
          return DataRow(cells: [
            DataCell(Text(mark.performance)),
            DataCell(Text(mark.grade)),
            DataCell(Text("${mark.minNumber} - ${mark.maxNumber}")),
            DataCell(
              Text(
                mark.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }

  Widget _buildSubjectResults(List subjectResults) {
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingTextStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
          dataTextStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
          columnSpacing: 15,
          horizontalMargin: 16,
          headingRowHeight: 40,
          headingRowColor: const WidgetStatePropertyAll(Color(0x8097C5E1)),
          dataRowColor: const WidgetStatePropertyAll(Color(0xFFD8EAD8)),
          columns: const [
            DataColumn(label: Text('Subject')),
            DataColumn(label: Text('Total Marks')),
            DataColumn(label: Text('Grade')),
            DataColumn(label: Text('Performance')),
            DataColumn(label: Text('Progress')),
          ],
          rows: subjectResults.map<DataRow>((subject) {
            return DataRow(cells: [
              DataCell(Expanded(child: Text(subject.subject ?? ''))),
              DataCell(Text('${subject.grandObtainMarks ?? 0}')),
              DataCell(Text(subject.grade ?? '')),
              DataCell(Text(subject.performance ?? '')),
              DataCell(
                SizedBox(
                  width: 80, // fixed width for the progress bar
                  child: LinearProgressIndicator(
                    value: (subject.grandObtainMarks / 100).clamp(0.0, 1.0),
                    backgroundColor: Colors.white,
                    color: Colors.blue.shade300,
                    minHeight: 6,
                  ),
                ),
              ),
            ]);
          }).toList(),
        ),
      );

  }


  Widget _buildAttendanceSummary(List<AttendanceData> attendance) {
    final attendanceData = attendance.isNotEmpty ? attendance[0] : AttendanceData();

    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:  DataTable(
            headingTextStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
            dataTextStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
            columnSpacing: 20,

            horizontalMargin: 16,
            headingRowHeight: 40,
            headingRowColor: const WidgetStatePropertyAll(Color(0x8097C5E1)),
            dataRowColor: const WidgetStatePropertyAll(Color(0xFFD8EAD8)),
            columns: const [
              DataColumn(label: Text('Working Days')),
              DataColumn(label: Text('Present')),
              DataColumn(label: Text('Absent')),
              DataColumn(label: Text('Progress')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('${attendanceData.totalDays ?? 0}')),
                DataCell(Text('${attendanceData.present ?? 0}')),
                DataCell(Text('${attendanceData.absent ?? 0}')),
                DataCell(
                  SizedBox(
                    width: 80,
                    child: LinearProgressIndicator(
                      value: ((attendanceData.present ?? 0) / (attendanceData.totalDays ?? 1)).clamp(0.0, 1.0),
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue,
                      minHeight: 6,
                    ),
                  ),
                ),
              ]),
            ],
          ),

      );

  }
  Widget _buildPerformanceSummary(List<StudentPerformance> performance) {
    return Container(
      width: double.infinity,
      child: DataTable(
        headingTextStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
        dataTextStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
        columnSpacing: 20,
        horizontalMargin: 10,
        headingRowHeight: 40,
        headingRowColor: const WidgetStatePropertyAll(Color(0x8097C5E1)),
        dataRowColor: const WidgetStatePropertyAll(Color(0xFFD8EAD8)),
        columns: const [
          DataColumn(label: Text('Performance On')),
          DataColumn(label: Expanded(child: Text('Progress Bar'))),
        ],
        rows: [
          DataRow(cells: [
            const DataCell(Text('Punctuality')),
            DataCell(
              _buildProgressBar(performance.first.punctuality),
            ),
          ]),
          DataRow(cells: [
            const DataCell(Text('Behavior')),
            DataCell(
              _buildProgressBar(performance.first.behavior),
            ),
          ]),
          DataRow(cells: [
            const DataCell(Text('Cleanliness')),
            DataCell(
              _buildProgressBar(performance.first.cleanliness),
            ),
          ]),
          DataRow(cells: [
            const DataCell(Text('Handwriting')),
            DataCell(
              _buildProgressBar(performance.first.handwriting),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildProgressBar(String? value) {
    double progress = double.tryParse(value ?? '0') ?? 0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: progress / 100, // Now properly converted
          backgroundColor: Colors.grey.shade300,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          minHeight: 8,
        ),
        const SizedBox(height: 4),
        Text('${progress.toStringAsFixed(0)}%', style: const TextStyle(fontSize: 10)),
      ],
    );
  }





  //
  // Widget _buildPerformanceSummary(List<StudentPerformance> performance) {
  //   return _buildCard(
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text('Punctuality: ${performance.first.punctuality}%', style: const TextStyle(fontSize: 16)),
  //         Text('Behavior: ${performance.first.behavior}%', style: const TextStyle(fontSize: 16)),
  //         Text('Cleanliness: ${performance.first.cleanliness}%', style: const TextStyle(fontSize: 16)),
  //         Text('Handwriting: ${performance.first.handwriting}%', style: const TextStyle(fontSize: 16)),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildComments(String comment) {
    return _buildCard(
      Text(
        comment,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
