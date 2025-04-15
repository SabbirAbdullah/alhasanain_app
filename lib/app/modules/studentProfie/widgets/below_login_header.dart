import 'package:alhasanain_app/app/core/values/app_values.dart';
import 'package:flutter/material.dart';

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
    // final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * 0.25,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Select Student Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize:18),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0),
              child: SizedBox(
                width: double.infinity,

                child: TextButton(
                  onPressed: onStudentLoginPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(AppValues.padding),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 20,
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Text(
                              "Shihab Hossain",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff363636)),
                            ),
                            Text(
                              "ET-173645",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                color: Color(0xff565656)),
                                    ),
                          ],
                        ),
                      ],
                    ),
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
