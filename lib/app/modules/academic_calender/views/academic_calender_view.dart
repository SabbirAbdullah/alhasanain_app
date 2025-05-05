import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:alhasanain_app/app/data/model/academic_calender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/academic_calender_controller.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class AcademicCalendarPage extends StatelessWidget {
  final AcademicCalenderController controller =
      Get.put(AcademicCalenderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: 'Academic Calendar'),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => SfCalendar(
              view: CalendarView.month,
              showNavigationArrow: true,
              initialDisplayDate: controller.selectedMonth.value,
              onViewChanged: (ViewChangedDetails details) {
                final middleIndex = (details.visibleDates.length / 2).floor();
                final visibleDate = details.visibleDates[middleIndex];
                controller.onMonthChanged(visibleDate);
              },
              onTap: (CalendarTapDetails details) {
                if (details.appointments != null && details.appointments!.isNotEmpty) {
                  final tappedEvent = details.appointments!.first as AcademicEventModel;
                  showModalBottomSheet(
                    context: Get.context!,
                    builder: (_) => EventDetailsBottomSheet(event: tappedEvent),
                  );
                }
              },
              monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              ),
              dataSource: EventDataSource(controller.events.toList()),
            )),
          ),

        ],
      ),
    );
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<AcademicEventModel> events) {
    appointments = events;
  }

  @override
  DateTime getStartTime(int index) => appointments![index].start;
  @override
  DateTime getEndTime(int index) => appointments![index].end;
  @override
  String getSubject(int index) => appointments![index].title;
  @override
  Color getColor(int index) => _fromHex(appointments![index].color);

  Color _fromHex(String hexColor) {
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
    buffer.write(hexColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class EventDetailsBottomSheet extends StatelessWidget {
  final AcademicEventModel event;

  const EventDetailsBottomSheet({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          Center(
              child: Container(
                  height: 4,
                  width: 40,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2)))),
          ListTile(
            title: Text(event.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Text("Event Type: ${event.eventType}"),
          ),
          ListTile(
            title: const Text("Start"),
            subtitle:
                Text(DateFormat('dd MMM yyyy, hh:mm a').format(event.start)),
          ),
          ListTile(
            title: const Text("End"),
            subtitle:
                Text(DateFormat('dd MMM yyyy, hh:mm a').format(event.end)),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// class AcademicCalendarPage extends StatelessWidget {
//   final AcademicCalenderController controller = Get.put(AcademicCalenderController());
//   AcademicCalendarPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//   controller.fetchAcademicEvent();
//     return Scaffold(
//       appBar: AppBar(title: const Text("Academic Calendar")),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         return SfCalendar(
//           showNavigationArrow: true,
//           view: CalendarView.month,
//           onViewChanged: (ViewChangedDetails details) {
//             if (details.visibleDates.isNotEmpty) {
//               final firstVisibleDate = details.visibleDates.first;
//               // controller.fetchAcademicEvent(firstVisibleDate);
//             }
//           },
//           onTap: (CalendarTapDetails details) {
//             if (details.appointments != null && details.appointments!.isNotEmpty) {
//               final tappedEvent = details.appointments!.first as AcademicEventModel;
//               showModalBottomSheet(
//                 context: Get.context!,
//                 builder: (_) => EventDetailsBottomSheet(event: tappedEvent),
//               );
//             }
//           },
//           dataSource: EventDataSource(controller.events),
//           monthViewSettings: const MonthViewSettings(
//             appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
//           ),
//         );
//       }),
//     );
//   }
// }
// class EventDataSource extends CalendarDataSource {
//   EventDataSource(List<AcademicEventModel> source) {
//     appointments = source;
//   }
//
//   @override
//   DateTime getStartTime(int index) => appointments![index].start;
//
//   @override
//   DateTime getEndTime(int index) => appointments![index].end;
//
//   @override
//   String getSubject(int index) => appointments![index].title;
//
//   @override
//   Color getColor(int index) =>
//       Color(int.parse(appointments![index].color.replaceAll('#', '0xff')));
// }
