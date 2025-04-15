import 'package:flutter/material.dart';

class CopyrightText extends StatelessWidget {
  const CopyrightText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 54.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "AL Hasanain Students & Parents 2025. All rights reserved",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              "Powered by mPair Technologies Ltd.",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
