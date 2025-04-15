

import 'package:flutter/material.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: "Privacy Policy",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)
            ),

            TextSpan(
              text: "\n \nWelcome to our student portal. We value your privacy and are committed to protecting your personal information. This privacy policy outlines how we collect, use, and safeguard your information.",
              style: TextStyle(color: Colors.black54)
            ),

            TextSpan(
                text: "\n \nInformation Collection",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)
            ),

            TextSpan(
                text: "\n \nWe collect personal information from students and parents to provide and improve our services. The types of information we collect include:",
                style: TextStyle(color: Colors.black54)
            ),

            TextSpan(
                text: "\n\n   Name \n   Contact Information (email, phone number)\n   Student ID\n   Academic Records\n   Attendance Records",
                style: TextStyle(color: Colors.black54)
            ),

            TextSpan(
                text: "\n \nUse of Information",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)
            ),


            TextSpan(
                text: "\n \nWe use the collected information for various purposes, including:",
                style: TextStyle(color: Colors.black54)
            ),

            TextSpan(
                text: "\n\n   Providing and maintaining our student portal services \n   Communicating with students and parents\n   Tracking academic and attendance records\n   Improving our services and developing new features",
                style: TextStyle(color: Colors.black54)
            ),

            TextSpan(
                text: "\n \nInformation Sharing",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)
            ),

            TextSpan(
                text: "\n \nWe do not share your personal information with third parties except in the following cases:",
                style: TextStyle(color: Colors.black54)
            ),

            TextSpan(
                text: "\n\n   With your consent \n   To comply with legal obligations\n   To protect and defend our rights and property\n   To prevent or investigate possible wrong doing in connection with our services",
                style: TextStyle(color: Colors.black54)
            ),

            TextSpan(
                text: "\n \nData Security",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)
            ),

            TextSpan(
                text: "\n \nWe implement appropriate security measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction.",
                style: TextStyle(color: Colors.black54)
            ),

            TextSpan(
                text: "\n \nYour Rights",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)
            ),

            TextSpan(
                text: "\n \nYou have the right to access, correct, or delete your personal information. If you have any concerns about how we handle your data, please contact us.",
                style: TextStyle(color: Colors.black54)
            ),

            TextSpan(
                text: "\n \nChanges to This Privacy Policy",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)
            ),

            TextSpan(
                text: "\n \nWe may update our privacy policy from time to time. We will notify you of any changes by posting the new policy on this page.",
                style: TextStyle(color: Colors.black54)
            ),

            TextSpan(
                text: "\n \nContact Us",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)
            ),

            TextSpan(
                text: "\n \nIf you have any questions about this privacy policy, please contact us at:Email: support@alhasanain.com.bd\n \n",
                style: TextStyle(color: Colors.black54)
            ),




          ]
        ),
    );
  }
}
