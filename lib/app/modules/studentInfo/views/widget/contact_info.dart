
import 'package:alhasanain_app/app/core/values/text_styles.dart';
import 'package:alhasanain_app/app/core/widget/student_info_card_widget.dart';
import 'package:flutter/material.dart';

import '../student_info_view.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    super.key,
    required this.widget,
  });

  final StudentInfo widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

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
                  //Fathers_information
                  InfoCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Father's Name",
                              style: greyDarkTextStyle),
                          
                          Text("${widget.studentDataResponse.fatherName}",
                              style: black14_500),
                        ],
                      ),
                  ),

                  InfoCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Father's Mobile Number",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.fatherContact}",
                              style:black14_500),
                        ],
                      ),
                  ),

                  InfoCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Father's Email",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.fatherEmail}",
                              style: black14_500),
                        ],
                      ),
                  ),
                  
                  //Mothers_information
                  InfoCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Mother's Name",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.motherName}",
                              style: black14_500),
                        ],
                      ),
                  ),

                  InfoCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Mother's Mobile Number",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.motherContact}",
                              style: black14_500),
                        ],
                      ),
                  ),
                  InfoCard(
                   child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Mother's Email",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.motherEmail}",
                              style: black14_500),
                        ],
                      ),
                 ),


                  //Guardian1s_information
                  InfoCard(
                   child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Guardian's Name",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.guardianName1}",
                              style: black14_500),
                        ],
                      ),
                 ),

                  InfoCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Guardian's Contact",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.emergencyCon1}",
                              style: black14_500),
                        ],
                      ),
                  ),

                  InfoCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Relation",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.grealtion1}",
                              style: black14_500),
                        ],
                      ),
                  ),

                  //Address
                  InfoCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Present Address",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.presentAddress}",
                              style: black14_500),
                        ],
                      ),
                  ),

                  InfoCard(
                   child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Permenent Address",
                              style: greyDarkTextStyle),
                          Text("${widget.studentDataResponse.permanentAddress}",
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