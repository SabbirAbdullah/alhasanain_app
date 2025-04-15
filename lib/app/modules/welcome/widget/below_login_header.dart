import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BelowLoginHeader extends StatelessWidget {
  final Function() onStudentLoginPressed;
  final Function() onParentLoginPressed;

  const BelowLoginHeader({
    super.key,
    required this.onStudentLoginPressed,
    required this.onParentLoginPressed,
  });

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.35,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Please Login to continue",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0),
              child: Container(
                width: 289,
                height: 50,
                child: TextButton(
                  onPressed: onStudentLoginPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(('assets/images/vector_student.svg'),),
                      SizedBox(width: 10,),
                      Text(
                        "Student Login",
                        style: whiteText16
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0),
              child: Container(
                width: 289,
                height: 50,
                child: TextButton(
                  onPressed: onParentLoginPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset( ('assets/images/vactor_parents.svg')),
                      SizedBox(width: 10,),
                      Text(
                        "Parent Login",
                        style: whiteText16
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

