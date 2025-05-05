import 'package:alhasanain_app/app/core/base/base_view.dart';
import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/values/app_values.dart';
import 'package:alhasanain_app/app/core/values/text_styles.dart';
import 'package:alhasanain_app/app/core/widget/navigation_drawer_based_widgets/navigation_drawer.dart';
import 'package:alhasanain_app/app/modules/daily_lesson/view/daily_lesson.dart';
import 'package:alhasanain_app/app/modules/exam_schedule/controller/exam_schedule_controller.dart';
import 'package:alhasanain_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:upgrader/upgrader.dart';
import '../../../core/widget/eca_club_based_widgets/eca_cards_widgets.dart';
import '../../../core/widget/event&news/views/event_news_widgets.dart';
import '../../../core/widget/home_mid_widgets.dart';
import '../../../core/widget/profile_info.dart';
import '../../../core/widget/section_titles.dart';
import '../../../routes/app_pages.dart';

import '../../daily_lesson/controllers/day_schedule_controller.dart';

import '../../eca/ecaClub/view/ecaClub_view.dart';
import '../../exam_schedule/view/exam_schedule_view.dart';
import '../../notification/controller/notification_controller.dart';
import '../../notification/view/notification_view.dart';

class HomeView extends BaseView<HomeController> {
  HomeView() {
    controller.getStudentData();


  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 0,
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: const Color(0x00e6F9FF),
    );
  }

  @override
  Widget? drawer() {
    return Obx(() => NavDrawer(
          studentDataResponseUi: controller.studentDataList.isEmpty
              ? controller.demoDataUi.value
              : controller.studentDataList[0],
          userType: controller.userType.value,
        ));
  }

  final WeeklyDatesController weeklyDatesController =
      Get.put(WeeklyDatesController());

  final ExamScheduleController examScheduleController =
      Get.put(ExamScheduleController());
  final NotificationController notificationController = Get.put(NotificationController());
  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: UpgradeAlert(
        upgrader: Upgrader(
          minAppVersion: '1.0.3',
          debugDisplayAlways: false,
          countryCode: 'BN',
          debugDisplayOnce: false,
          durationUntilAlertAgain: Duration(seconds: 10),
          messages: EnglishUpgradeMessages(),
        ),
        showLater: false,
        showIgnore: false,
        cupertinoButtonTextStyle: TextStyle(
            color: AppColors.buttonColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
        dialogStyle: UpgradeDialogStyle.cupertino,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00e6F9FF),
                    Color(0xffe9fff8),
                    Color(0xfffff6e2),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: AppValues.padding_6,
                            ),
                            child: InkWell(
                              onTap: openDrawer,
                              child: Image.asset(
                                "assets/images/menu-bar.png",
                                height: 25,
                                width: 40,
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                                "assets/images/alhasanain-logo.png",
                                height: 100,
                                width: Get.width * 0.5),
                          ),
                          const Spacer(
                            flex: 1,
                          ),

                          Stack(
                            children: [
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                    "assets/images/notification-bell.png",
                                    height: AppValues.iconSize_20,
                                    width: AppValues.iconSize_20,
                                  ),
                                ),
                                onTap: () {
                                  notificationController.fetchNotifications(page: 1);
                                  Get.to(() => NotificationHistoryPage(
                                    studentDataResponseUi: controller.studentDataList[0],
                                  ));
                                },
                              ),
                              Obx(() {
                                return controller.unseenCount.value > 0
                                    ? Positioned(
                                  right: 0, // you can adjust right/top values
                                  bottom: 2,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '${controller.unseenCount.value}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                )
                                    : SizedBox(); // empty widget if no unseen notifications
                              }),
                            ],
                          ),
                          SizedBox(width: 8,)

                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => controller.studentDataList.isEmpty
                          ? Container()
                          : ProfileInfo(
                              studentDataResponseUi:
                                  controller.studentDataList[0])),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() => controller.studentDataList.isEmpty
                        ? Container()
                        : HomeMidWidgets(
                            studentDataResponseUi:
                                controller.studentDataList[0],
                          )),
                    SectionHeader(
                        title: "Daily Lesson",
                        onTap: () {
                          weeklyDatesController.fetchWeeklyDates(
                            controller.term.value,
                            controller.studentDataList[0].cId!,
                            controller.studentDataList[0].secId!,
                            controller.studentDataList[0].campus!,
                            controller.studentDataList[0].session!,
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DailyLesson()));
                        }),
                    const SizedBox(
                      height: 8,
                    ),

                    Obx(() {
                      if (controller.isLoading.value) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .1,
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .1,
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  )
                                ],
                              )),
                        );
                      } else if (controller.subjects.isEmpty) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      // onTap: () {
                                      //   showDialog(
                                      //     context: context,
                                      //     builder: (BuildContext context) {
                                      //       return AlertDialog(
                                      //         backgroundColor: AppColors.pageBackground,
                                      //         actionsAlignment: MainAxisAlignment.end,
                                      //         scrollable: true,
                                      //         actionsPadding: const EdgeInsets.only(bottom: 4, right: 8),
                                      //         contentPadding: const EdgeInsets.only(
                                      //             left: 10, right: 10, top: 10, bottom: 6),
                                      //         insetPadding: const EdgeInsets.all(12),
                                      //         shape: const RoundedRectangleBorder(
                                      //             borderRadius: BorderRadius.all(Radius.circular(10))),
                                      //         titlePadding: const EdgeInsets.only(left: 16,top: 10),
                                      //         title: const Text(
                                      //           "Lesson Details",
                                      //           style:
                                      //           TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                                      //         ),
                                      //
                                      //         content:
                                      //         SizedBox(
                                      //           width: MediaQuery.of(context).size.width * .90,
                                      //           child:
                                      //           Column(
                                      //             children: [
                                      //               Padding(
                                      //                 padding: const EdgeInsets.only(left: 4.0),
                                      //                 child: Row(
                                      //                   children: [
                                      //                     Container(
                                      //                       decoration: BoxDecoration(
                                      //                           borderRadius: BorderRadius.circular(15),
                                      //                           border: Border.all(color: AppColors.appBarColor,)
                                      //                       ),
                                      //                       child:  Padding(
                                      //                         padding:  EdgeInsets.only(
                                      //                             top: 4.0, bottom: 4, right: 8, left: 8),
                                      //                         child: Text(
                                      //                           controller.todayDay,
                                      //                           style: const TextStyle(
                                      //                               color: Colors.black87,
                                      //                               fontSize: 12,
                                      //                               fontWeight: FontWeight.w400),
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                     const SizedBox(
                                      //                       width: 6,
                                      //                     ),
                                      //                     Container(
                                      //                       decoration: BoxDecoration(
                                      //                         borderRadius: BorderRadius.circular(15),
                                      //                         //border: Border.all(color: AppColors.appBarColor, width: 1))
                                      //                       ),
                                      //                       child:  const Padding(
                                      //                         padding: EdgeInsets.only(
                                      //                             top: 4.0, bottom: 4, right: 8, left: 8),
                                      //                         child: Text(
                                      //                           "N/A",
                                      //                           style: TextStyle(
                                      //                               color: AppColors.appBarColor,
                                      //                               fontSize: 12,
                                      //                               fontWeight: FontWeight.w500),
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //
                                      //               const SizedBox(
                                      //                 height: 8,
                                      //               ),
                                      //               Row(
                                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                                      //                 children: [
                                      //                   SizedBox(
                                      //                     width: MediaQuery.of(context).size.width * .2,
                                      //                     child: const Padding(
                                      //                       padding: EdgeInsets.only(left: 8.0),
                                      //                       child: Text(
                                      //                         "Materials",
                                      //                         style: TextStyle(
                                      //                             color: AppColors.appBarColor,
                                      //                             fontSize: 12,
                                      //                             fontWeight: FontWeight.w500),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //
                                      //                   const Expanded(
                                      //                     flex: 4,
                                      //                     child: Padding(
                                      //                       padding: EdgeInsets.only(right: 8.0),
                                      //                       child: Text(
                                      //                         ":N/A",
                                      //                         overflow: TextOverflow.visible,
                                      //                         style: TextStyle(
                                      //                             color: Colors.black87,
                                      //                             fontSize: 12,
                                      //                             fontWeight: FontWeight.w400),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //               const SizedBox(
                                      //                 height: 4,
                                      //               ),
                                      //               Row(
                                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                                      //                 children: [
                                      //                   SizedBox(
                                      //                     width: MediaQuery.of(context).size.width * .2,
                                      //                     child: const Padding(
                                      //                       padding: EdgeInsets.only(left: 8.0),
                                      //                       child: Text(
                                      //                         'Lessons',
                                      //                         overflow: TextOverflow.ellipsis,
                                      //                         style: TextStyle(
                                      //                           color:AppColors.appBarColor,
                                      //                           fontSize: 12,
                                      //                           fontWeight: FontWeight.w500,
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //
                                      //                   const Expanded(
                                      //                     flex: 4,
                                      //                     child: Padding(
                                      //                       padding: EdgeInsets.only(right: 8.0),
                                      //                       child: Text(
                                      //                         ":N/A",
                                      //                         overflow: TextOverflow.visible,
                                      //                         maxLines: null, // Adjust as needed
                                      //                         style: TextStyle(
                                      //                           color: Colors.black87,
                                      //                           fontSize: 12,
                                      //                           fontWeight: FontWeight.w400,
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //               const SizedBox(
                                      //                 height: 4,
                                      //               ),
                                      //               Row(
                                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                                      //                 children: [
                                      //                   SizedBox(
                                      //                     width: MediaQuery.of(context).size.width * .2,
                                      //                     child: const Padding(
                                      //                       padding: EdgeInsets.only(left: 8.0),
                                      //                       child: Text(
                                      //                         'Homework',
                                      //                         style: TextStyle(
                                      //                             color: AppColors.appBarColor,
                                      //                             fontSize: 12,
                                      //                             fontWeight: FontWeight.w500),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //
                                      //                   const Expanded(
                                      //                       flex: 4,
                                      //                       child: Padding(
                                      //                         padding: EdgeInsets.only(right: 8.0),
                                      //                         child:  Text(
                                      //                           ":N/A",
                                      //                           maxLines: null,
                                      //                           overflow: TextOverflow.visible,
                                      //                           style: TextStyle(
                                      //                               color: Colors.black87,
                                      //                               fontSize: 12,
                                      //                               fontWeight: FontWeight.w400),
                                      //                         ),
                                      //                       ))
                                      //                 ],
                                      //               ),
                                      //             ],
                                      //           ),
                                      //
                                      //         ),
                                      //         actions: [
                                      //           TextButton(
                                      //             onPressed: () {
                                      //               Navigator.of(context).pop();
                                      //             },
                                      //             child: const Text(
                                      //               "Close",
                                      //               style: TextStyle(
                                      //                   color: AppColors.appBarColor,
                                      //                   fontWeight: FontWeight.w600,
                                      //                   fontSize: 16),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       );
                                      //     },
                                      //   );
                                      // },
                                      child: Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.55,
                                          decoration: BoxDecoration(
                                            color: AppColors.pageBackground,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Image.asset(
                                                "assets/empty.png",
                                                height: 50,
                                                width: 50,
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "No lesson plan for today",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      } else {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.subjects.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showDailyLessonDialog(context, index);
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.55,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors.appBarColor
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6.0),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          //border: Border.all(color: Color(0xff0b6fbe)
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 4.0,
                                                                  bottom: 4,
                                                                  right: 8,
                                                                  left: 4),
                                                          child: Text(
                                                            controller.todayDay,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          //border: Border.all(color: AppColors.appBarColor,)
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 8,
                                                                  left: 8,
                                                                  bottom: 2),
                                                          child: Text(
                                                            controller
                                                                .subjects[index]
                                                                .subject,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Flexible(
                                                          child: Text(
                                                            'Materials:',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .appBarColor,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            controller
                                                                .subjects[index]
                                                                .books,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Flexible(
                                                          flex: 3,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        4.0),
                                                            child: Text(
                                                              'Lessons:',
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .appBarColor,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 9,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        1.0),
                                                            child: Text(
                                                              controller
                                                                  .subjects[
                                                                      index]
                                                                  .lessonPlan,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines:
                                                                  2, // Adjust as needed
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }),

                    // SectionHeader(
                    //   title: "ECA & Club",
                    //   onTap: () {
                    //     Navigator.of(context).push(
                    //         MaterialPageRoute(builder: (context) => const ECAClub()));
                    //   },
                    // ),
                    // const SizedBox(height: 8),
                    // const ECACardsWidegts(),
                    const SizedBox(height: 16),
                    SectionHeader(
                        title: "Event & News", onTap: navigateEventNews),

                    Obx(() => EventNewsWidgets(
                          studentEventNews: controller.eventNewsDataList,
                        )),
                    const SizedBox(height: 16),
                    SectionHeader(
                        title: "Exam Schedule",
                        onTap: () {
                          examScheduleController.fetchSchedule();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ExamSchedulePage()));
                        }),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return SizedBox.shrink();
                      }

                      if (controller.latestExamSchedules.isEmpty) {
                        return Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            decoration: BoxDecoration(
                              color: AppColors.pageBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Image.asset(
                                  "assets/empty.png",
                                  height: 50,
                                  width: 50,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "No exam schedule available",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      // Show latest exam
                      final item = controller.latestExamSchedules.value.first;
                      return Card(
                        color: Colors.white,
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          top: 4, bottom: 4, left: 8, right: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.grey.shade200),
                                      child: item.term == "CT"
                                          ? Text(
                                              "Class Test",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          : Text(
                                              "Class Test",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    item.title ?? 'No title',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                "Published At ${item.date != null ? "${item.date!.toLocal().day.toString().padLeft(2, '0')}-${item.date!.toLocal().month.toString().padLeft(2, '0')}-${item.date!.toLocal().year}" : 'N/A'}",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                        ],
                        ),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showDailyLessonDialog(context, index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.pageBackground,
          actionsAlignment: MainAxisAlignment.end,
          scrollable: true,
          actionsPadding: const EdgeInsets.only(bottom: 4, right: 8),
          contentPadding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 6),
          insetPadding: const EdgeInsets.all(12),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          titlePadding: const EdgeInsets.only(left: 16, top: 10),
          title: const Text(
            "Lesson Details",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * .90,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppColors.appBarColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 4, right: 8, left: 8),
                          child: Text(
                            controller.todayDay,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          //border: Border.all(color: AppColors.appBarColor, width: 1))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 4, right: 8, left: 8),
                          child: Text(
                            controller.subjects[index].subject,
                            style: const TextStyle(
                                color: AppColors.appBarColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Materials',
                          style: TextStyle(
                              color: AppColors.appBarColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          controller.subjects[index].books,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Lessons',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.appBarColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          controller.subjects[index].lessonPlan,
                          overflow: TextOverflow.visible,
                          maxLines: null, // Adjust as needed
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Homework',
                          style: TextStyle(
                              color: AppColors.appBarColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            controller.subjects[index].homework,
                            maxLines: null,
                            overflow: TextOverflow.visible,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Close",
                style: TextStyle(
                    color: AppColors.appBarColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }

  void openDrawer() {
    globalKey.currentState?.openDrawer();
  }

  void navigateEventNews() {
    Get.toNamed(Routes.EVENT_AND_NEWS,
        arguments: controller.studentDataList[0]);
  }
}

class EnglishUpgradeMessages extends UpgraderMessages {
  /// Override the message function to provide custom language localization.
  @override
  String message(UpgraderMessage messageKey) {
    if (languageCode == 'en') {
      switch (messageKey) {
        case UpgraderMessage.body:
          return 'A new version of {{appName}} is available!';
        case UpgraderMessage.buttonTitleIgnore:
          return 'Ignore';
        case UpgraderMessage.buttonTitleLater:
          return 'Later';
        case UpgraderMessage.buttonTitleUpdate:
          return 'Update Now';
        case UpgraderMessage.prompt:
          return 'Do you Want to update?';
        case UpgraderMessage.releaseNotes:
          return 'Release Notes';
        case UpgraderMessage.title:
          return 'Update App';
        default:
          return super.message(messageKey)!;
      }
    }
    // Messages that are not provided above can still use the default values.
    return super.message(messageKey)!;
  }
}
