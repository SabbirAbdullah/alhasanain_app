import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/values/text_styles.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:alhasanain_app/app/core/widget/loading.dart';
import 'package:alhasanain_app/app/data/model/incident_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/url.dart';
import '../../home/model/student_ui_data.dart';
import '../controller/incident_controller.dart';

class IncidentView extends StatelessWidget {
  final StudentDataResponseUi ? studentDataResponseUi;
  final IncidentController controller = Get.put(IncidentController());

   IncidentView({super.key,  this.studentDataResponseUi});

  @override
  Widget build(BuildContext context) {
    controller.fetchIncidentReports(studentId:studentDataResponseUi!.studentId,
        campus: studentDataResponseUi!.campus!,
        session: studentDataResponseUi!.session!);
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        title: Text('Incident Reports'),

      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: Loading());
          }
          if (controller.incidentList.isEmpty) {
            return Center(child: Text('No incidents found.'));
          }
          return Expanded(
            child: ListView.builder(
              itemCount: controller.incidentList.length,
              itemBuilder: (context, index) {
                final incident = controller.incidentList[index];
                final imageUrl = incident.media != null
                    ? "${AppUrl.baseImageUrl}${incident.media}"
                    : null;

                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => IncidentDetailPage(incident: incident));
                      },
                      leading: imageUrl != null
                          ? Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover)
                          : Container(width: 50, height: 50, color: Colors.grey[300]),
                      title: Text('${incident.eventDetails}'),
                      subtitle: Text(
                        'Date: ${incident.dateOfOccurrence.contains('T') ? incident.dateOfOccurrence.split('T').first.split('-').reversed.join('-') : ''}',
                      ),

                    ),
                  ),
                );

              },
            ),
          );
        }),
      ),

    );
  }
}


class IncidentDetailPage extends StatelessWidget {
  final IncidentReportModel incident;

  const IncidentDetailPage({super.key, required this.incident});

  @override
  Widget build(BuildContext context) {
    final imageUrl = incident.media != null
        ? "${AppUrl.baseImageUrl}${incident.media}"
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Incident Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Image section
            imageUrl != null
                ? Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            )
                : Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[300],
              child: Center(child: Text('No Image')),
            ),

            // Details section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Event Details:',
                    style: text14_600,
                  ),
                  SizedBox(height: 8),
                  Text(incident.eventDetails ?? 'No details'),

                  SizedBox(height: 16),

                  Text(
                    'Date of Occurrence:',
                    style: text14_600,
                  ),
                  SizedBox(height: 8),
                  Text(incident.dateOfOccurrence.split('T').first),

                  SizedBox(height: 16),

                  Text(
                    'Course of Action:',
                    style: text14_600,
                  ),
                  SizedBox(height: 8),
                  Text(incident.courseOfAction ?? 'No course of action'),

                  SizedBox(height: 16),

                  Text(
                    'Counselor:',
                    style: text14_600,
                  ),
                  SizedBox(height: 8),
                  Text(incident.counselorName ?? 'No counselor name'),

                  SizedBox(height: 16),

                  Text(
                    'Class & Section:',
                    style: text14_600,
                  ),
                  SizedBox(height: 8),
                  Text('${incident.studentClass ?? ''} - ${incident.section ?? ''}'),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
