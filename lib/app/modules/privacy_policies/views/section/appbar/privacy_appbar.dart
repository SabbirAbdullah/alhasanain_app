import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PrivacyAppbar extends StatefulWidget {
  const PrivacyAppbar({super.key});

  @override
  State<PrivacyAppbar> createState() => _PrivacyAppbarState();
}

class _PrivacyAppbarState extends State<PrivacyAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
            )),
        Gap(10),
        Text(
          "Privacy and Policies",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            height: 0,
          ),
        )
      ],
    );
  }
}
