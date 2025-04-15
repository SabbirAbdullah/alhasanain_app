import 'package:alhasanain_app/app/core/values/app_colors.dart';

import 'package:flutter/material.dart';
import '../../../core/values/url.dart';
import '../../home/model/student_ui_data.dart';
import 'widget/basic_info.dart';
import 'widget/contact_info.dart';

class StudentInfo extends StatefulWidget {
  const StudentInfo({super.key, required this.studentDataResponse});

  final StudentDataResponseUi studentDataResponse;

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColors.appBarColor,
        elevation: 1,
        title:  const Padding(
          padding: EdgeInsets.only(right: 48),
          child: Center(
            child: Text(
              "Student Info",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),

      ),
      body: Column(
        children: [
          Container(color: Colors.white,

            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(

                    radius: 40,
                    backgroundImage: NetworkImage( "${AppUrl.baseImageUrl}${widget.studentDataResponse.studentImage}"),
                  ),
                  const SizedBox(
                    width: 16,
                  ),

                    Flexible(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                                "${widget.studentDataResponse.studentFirstName} ${widget.studentDataResponse.studentLastName}",
                                style: const TextStyle(

                                    fontWeight: FontWeight.w600, fontSize: 16,color: AppColors.studentNameColor),
                                maxLines: null,
                                overflow: TextOverflow.visible,

                              ),

                            const SizedBox(
                              height: 10,
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue.shade100, // Set the background color to blue
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4.0,
                                          bottom: 4.0,
                                          left: 10.0,
                                          right: 10.0),
                                      child: Text(
                                        "${widget.studentDataResponse.studentId}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            // Set the text color to white
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red.shade100, // Set the background color to blue
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4.0,
                                          bottom: 4.0,
                                          left: 10.0,
                                          right: 10.0),
                                      child: Text(
                                        "${widget.studentDataResponse.studentClass}",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green.shade100, // Set the background color to blue
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4.0,
                                          bottom: 4.0,
                                          left: 10.0,
                                          right: 10.0),
                                      child: Text(
                                        "${widget.studentDataResponse.section}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                    ),


                ],
              ),
            ),
          ),

          Container( color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                    dividerColor: Colors.white,
                  tabAlignment: TabAlignment.center,
                  controller: _tabController,
                  labelColor:AppColors.appBarColor,
                  tabs: [
                    const Tab(text: "Basic Info"),
                    const Tab(text: "Contact Info"),
                  ],
                  indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.appBarColor, // Color of the line under the tabs
                        width: 2, // Width of the line
                      ),
                    ),
                  ),
                  indicatorWeight: 0// Set the weight of the active tab indicator
                ),
                Container(
                  color: Colors.grey.shade100, // Color of the line
                  height: 1.0, // Height of the line
                  width: double.infinity, // Span the entire screen width
                ),

              ],
            ),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0.0, 3.0),
                      blurRadius: 5,
                      spreadRadius:1,
                    )
                  ],
                  color: AppColors.pageBackground,
              ),
              // Adjust the percentage as needed, e.g., 40% of screen height
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [
                  BasicInfoWidget(widget: widget),
                  ContactInfoWidget(widget: widget),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


