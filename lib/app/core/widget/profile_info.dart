
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/home/model/student_ui_data.dart';
import '../values/app_colors.dart';
import '../values/app_values.dart';
import '../values/url.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key, required this.studentDataResponseUi});
  final StudentDataResponseUi studentDataResponseUi;
  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        color: Colors.white,
        elevation: .5, // Adjust the elevation to your preference
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(

          width:screenWidth*AppValues.percentage_9,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:"${AppUrl.baseImageUrl}${widget.studentDataResponseUi.studentImage}",
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.asset("assets/images/student.png", height: 53,width: 53,),
                    height: 53,
                    width: 53,
                  ),
                ),
                SizedBox(width: 16,),


                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width*.65,
                      child: Text(
                        "${widget.studentDataResponseUi.studentFirstName} ${widget.studentDataResponseUi.studentLastName} ",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,color: AppColors.studentNameColor),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.shade50, // Set the background color to blue
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 4.0,
                                  bottom: 4.0,
                                  left: 10.0,
                                  right: 10.0),
                              child: Text(
                                "${widget.studentDataResponseUi.studentClass}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    // Set the text color to white
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 6,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.shade50, // Set the background color to blue
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 4.0,
                                  bottom: 4.0,
                                  left: 10.0,
                                  right: 10.0),
                              child: Text(
                                "${widget.studentDataResponseUi.section}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    // Set the text color to white
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 6,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.shade50, // Set the background color to blue
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 4.0,
                                  bottom: 4.0,
                                  left: 10.0,
                                  right: 10.0),
                              child: Text(
                                "${widget.studentDataResponseUi.studentId}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    // Set the text color to white
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}