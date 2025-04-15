import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DeleteAccountController extends GetxController {
  final String appEmail = "info@alhasanain.edu.bd";

  Future<void> sendDeleteRequest() async {
    final String subject = Uri.encodeComponent("Account Deletion Request");
    final String body = Uri.encodeComponent("Hello,\n\nI would like to request the deletion of my account. Please let us know why you want to delete the account.\n\nThank you.");

    final Uri emailUri = Uri.parse("mailto:$appEmail?subject=$subject&body=$body");

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      Get.snackbar(
        'Error',
        'Could not open email client.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
