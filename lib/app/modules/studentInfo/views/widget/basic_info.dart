
import 'package:alhasanain_app/app/core/values/text_styles.dart';
import 'package:alhasanain_app/app/core/widget/student_info_card_widget.dart';
import 'package:flutter/material.dart';

import '../student_info_view.dart';

class BasicInfoWidget extends StatelessWidget {
  const BasicInfoWidget({
    super.key,
    required this.widget,
  });

  final StudentInfo widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 8,bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 6,
                  ),
                  InfoCard(
                    child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Name",
                                    style: greyDarkTextStyle),
                                Text(
                                    "${widget.studentDataResponse.studentFirstName} ${widget.studentDataResponse.studentLastName}",
                                    style: black14_500),
                              ],
                            ),
                  ),

                  InfoCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Section",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.section}",
                              style: black14_500),
                        ],
                      ),
                    ),

                  InfoCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Session",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.studentSession}",
                              style: black14_500),
                        ],
                      ),
                    ),

                  InfoCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Gender",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.gender}",
                              style: black14_500),
                        ],
                      ),
                    ),
                  InfoCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Blood Group",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.bloodGroup}",
                              style: black14_500),
                        ],
                      ),
                    ),

                   InfoCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Date of Birth",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.dob}",
                              style: black14_500),
                        ],
                      ),
                    ),

                  InfoCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Category",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.category}",
                              style: black14_500),
                        ],
                      ),
                    ),

                  InfoCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("House",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.house}",
                              style: black14_500),
                        ],
                      ),
                    ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}