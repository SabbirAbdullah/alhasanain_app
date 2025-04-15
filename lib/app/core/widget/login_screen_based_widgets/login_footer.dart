import 'package:flutter/material.dart';

class CopyrightText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "AL Hasanain 2024. All rights reserved",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                "Powered by mPair Technologies Ltd.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
