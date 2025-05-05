import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar:CustomAppBar(appBarTitleText: 'Terms & Conditions'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Last Updated: 01.03.2025',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to Al Hasanain! These Terms and Conditions ("Terms") govern your use of the Al Hasanain school app (the "App"). By accessing or using the App, you agree to comply with these Terms. If you do not agree with any part of these Terms, please do not use the App.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '1. Use of the App',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '1.1 The App is designed for parents and students of Al Hasanain to access academic and administrative information.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '1.2 Users must use the App responsibly and in accordance with school policies.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '1.3 Unauthorized access, data tampering, or misuse of the App is strictly prohibited.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '2. User Accounts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '2.1 User accounts are created and managed by the school. Parents and students will receive their login credentials from the school administration.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2.2 Users are responsible for keeping their login credentials confidential.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2.3 If unauthorized access or account misuse is suspected, users must notify the school immediately.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '3. Privacy & Data Protection',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '3.1 The App may collect and store student-related information such as attendance, academic records, and payment history.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3.2 All user data is protected and will not be shared with third parties without consent, except as required by law.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3.3 For more details, please refer to our Privacy Policy.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '4. Code of Conduct',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '4.1 Users must not share or post any offensive, inappropriate, or misleading content within the App.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4.2 Any misuse of communication tools, including harassment or false information, is strictly prohibited.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4.3 The school reserves the right to suspend or terminate access to accounts that violate these Terms.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '5. Attendance & Academic Records',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '5.1 Students and parents can view attendance records, academic performance, and school-related updates through the App.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '5.2 Any discrepancies should be reported to school authorities promptly.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '6. Fees & Payment History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '6.1 The App does not support online payments. Parents can only view the status and history of fee payments.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '6.2 Any payment-related inquiries should be directed to the school administration.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '7. App Updates & Modifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '7.1 The school may update or modify the App and its features at any time.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '7.2 Continued use of the App after updates means you accept the changes.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '8. Limitation of Liability',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '8.1 The school is not responsible for any technical issues, data loss, or unauthorized access to accounts.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '8.2 The App is provided "as is" without warranties of any kind.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '9. Termination of Access',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '9.1 The school reserves the right to suspend or terminate access to the App for violations of these Terms.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '11. Contact Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'For any questions regarding this privacy policy, please contact the school administration at info@alhasanain.edu.bd or Call Us 01847422750.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'By using the Al Hasanain App, you agree to these Terms. Thank you for being a part of our school community!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
