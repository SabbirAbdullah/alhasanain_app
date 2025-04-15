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
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.25,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Login to continue",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0),
              child: Container(
                width: double.infinity,
                height: 60,
                child: TextButton(
                  onPressed: onStudentLoginPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    "Student Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
                width: double.infinity,
                height: 60,
                child: TextButton(
                  onPressed: onParentLoginPressed,
                  style: TextButton.styleFrom(
                    side: BorderSide(color: Colors.indigo),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    "Parent Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
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
