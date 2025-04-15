import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/values/text_styles.dart';
import 'package:alhasanain_app/app/core/widget/login_screen_based_widgets/login_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';



class Aboutalhasanain extends StatelessWidget {
   Aboutalhasanain({super.key});


  @override
  Widget build(BuildContext context) {
    final facebookUrl = 'https://www.facebook.com/BD.AlHasanain?mibextid=ZbWKwL';
    final youtubeUrl = 'https://www.youtube.com/@alhasanainbd';
    final websiteUrl = 'https://alhasanain.com.bd/';

    // void _launchUrl(String url, bool inApp) async {
    //   final uri = Uri.parse(url);
    //
    //   try {
    //     if (await canLaunchUrl(uri)) {
    //       // Check if launching is possible
    //       if (inApp) {
    //         await launchUrl(uri, mode: LaunchMode.inAppWebView);
    //       } else {
    //         await launchUrl(uri, mode: LaunchMode.externalApplication);
    //       }
    //     } else {
    //       throw 'Could not launch $url';
    //     }
    //   } catch (e) {
    //     print('Error launching URL: $e');
    //   }
    // }
    Future<void> openInSystemBrowser(String url) async {
      const platform = MethodChannel('open_browser_channel'); // Custom channel name
      try {
        await platform.invokeMethod('openBrowser', {'url': url});
      } catch (e) {
        throw 'System browser fallback failed: $e';
      }
    }


    void _showErrorNotification(String message) {
      // Replace with your preferred notification method
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: Duration(seconds: 4),
        action: SnackBarAction(
          label: 'Copy Link',
          onPressed: () {
            Clipboard.setData(ClipboardData(text: message));
          },
        ),
      ));
    }


    void _launchUrl(String url, bool inApp) async {
      final uri = Uri.parse(url);

      try {
        // Attempt to check if the URL can be launched
        final canLaunch = await canLaunchUrl(uri);

        if (canLaunch) {
          // If the URL can be launched
          if (inApp) {
            // Open in in-app web view
            await launchUrl(uri, mode: LaunchMode.inAppWebView);
          } else {
            // Open in external application
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        } else {
          // Fallback to external application or notify the user
          print('canLaunchUrl failed, attempting fallback...');
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      } catch (e) {
        print('Error launching URL: $e');
        // Notify the user
        _showErrorNotification('Failed to open the link: $url');
      }
    }

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Al Hasanain',
          style: whiteText16_500,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35,),
            Center(
              child:
                  Image.asset(
                  "assets/images/alhasanain-logo.png",
                    height: 65,
                    width: 208.07,),
                    // Text("SINCE 2011",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.appBarColor),
        
            ),
            SizedBox(height: 40,),
        
            Padding(
              padding: const EdgeInsets.only(left: 27,right: 27),
              child: Container(

                child: Text(
                     """ Welcome to Al Hasanain
        
        An Institution that combines Cambridge curriculum with Islamic education.
        
        Our aim is to provide quality education in English medium while inculcating the teachings of Islam in the hearts and minds of our students.""",
                    style:grayText16_400 ,textAlign: TextAlign.center,
                  ),
              ),
            ),
        
            SizedBox(height: 32,),
        
           Container(
            child: Column(
              children: [
                // Phone Number Row
                GestureDetector(
                  onTap: () async {
                    final Uri phoneUri = Uri(scheme: 'tel', path: '01847422750');
                    if (await canLaunchUrl(phoneUri)) {
                      await launchUrl(phoneUri);
                    } else {
                      print('Could not launch $phoneUri');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 5),
                      Text("+8801847422750",
                        style: TextStyle(
                        color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic, // Italic font
                          decoration: TextDecoration.underline, // Blue underline
                          decorationColor: Colors.blue,
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // Email Row
                GestureDetector(
                  onTap: () async {
                    final Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: 'ahasanainbd@gmail.com',
                    );
                    if (await canLaunchUrl(emailUri)) {
                      await launchUrl(emailUri);
                    } else {
                      print('Could not launch $emailUri');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 5),
                      Text('info@alhasanain.edu.bd',
                          style: TextStyle(
                            color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic, // Italic font
                            decoration: TextDecoration.underline, // Blue underline
                            decorationColor: Colors.blue,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
            SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _launchUrl(facebookUrl,false),
                    child: Image.asset(
                      'assets/images/facebook.png', // Replace with your image path
                      height: 30,
                      width: 30,
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () => _launchUrl(youtubeUrl,false),
                    child: Image.asset(
                      'assets/images/youtube.png', // Replace with your image path
                      height: 40,
                      width: 35,
                    ),
                  ),
                  SizedBox(width: 25),
                  GestureDetector(
                    onTap: () => _launchUrl(websiteUrl,false),
                    child: Image.asset(
                      'assets/images/web.png', // Replace with your image path
                      height: 35,
                      width: 35,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            CopyrightText(),

        
          ],
        ),
      ),
    );
  }


  


}
