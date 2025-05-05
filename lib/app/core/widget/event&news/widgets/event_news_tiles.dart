
import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:alhasanain_app/app/core/values/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../modules/event_and_news/controller/event_news_controller.dart';
import '../../../values/app_values.dart';
import '../../../values/url.dart';
import '../models/event_ news_ui_data.dart';

class EventNewsTiles extends StatelessWidget {
  final EventNewsController  controller = Get.put(EventNewsController());
   EventNewsTiles({
    super.key,
    required this.eventNewsUiData,
  });
  final EventNewsUiData eventNewsUiData;
  @override
  Widget build(BuildContext context) {
    DateTime inputDate = DateTime.parse(eventNewsUiData.fromData);
    String formattedDateString = "${inputDate.day.toString().padLeft(2, '0')}/${inputDate.month.toString().padLeft(2, '0')}/${inputDate.year}";
    return InkWell(
      onTap: () =>Get.to(()=> AllEventNews(eventNewsUiData: eventNewsUiData,)),
      child: Container( 
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(05)),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppValues.radius_8),
                      child: CachedNetworkImage(
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        imageUrl: "${AppUrl.baseImageUrl}${eventNewsUiData.imageLink}",
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // spacing between image and text
                  Expanded( // this prevents right overflow
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventNewsUiData.name,
                          style: blackText16_600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, // optional
                        ),
                        Text(
                          formattedDateString,
                          style: greyText_13_400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, // optional
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.width * .5,
                padding: new EdgeInsets.only(right: 13.0),
                child: Text(
                  eventNewsUiData.description,
                  style: greyText_13_400,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),



            // Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SizedBox(height: 8),
            //     Text(
            //       eventNewsUiData.name,
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //       ),
            //     ),
            //     SizedBox(height: 8),
            //     Flexible(
            //       child: Container(
            //         width: Get.width * .6,
            //         padding: new EdgeInsets.only(right: 13.0),
            //         child: Text(
            //           eventNewsUiData.description,
            //           style: TextStyle(
            //             fontSize: 14,
            //           ),
            //           maxLines: 2,
            //           overflow: TextOverflow.ellipsis,
            //         ),
            //       ),
            //     ),
            //     SizedBox(height: 04),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               eventNewsUiData.fromData,
            //               style: TextStyle(
            //                 fontSize: 10,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }


}

class AllEventNews extends StatelessWidget {
  const AllEventNews({super.key, required this.eventNewsUiData});
  final EventNewsUiData eventNewsUiData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(title: Text("Event & News"),centerTitle: true,),
            CachedNetworkImage(
              width: Get.width,
              height: 350,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: Get.width,
                  height: 350,
                  color: Colors.white, // Optional: You can use any color here
                ),
              ),
              imageUrl: "${AppUrl.baseImageUrl}${eventNewsUiData.imageLink}",
              errorWidget: (BuildContext context, String url, dynamic error) =>
              const Icon(Icons.error),
            ),
            SizedBox(height: AppValues.halfPadding,),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: AppValues.padding,vertical: AppValues.padding_2),
              child: Text(eventNewsUiData.fromData,style: Theme.of(context).textTheme.titleMedium?.copyWith(color:Colors.blue),),
            ),

            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: AppValues.padding,vertical: AppValues.padding_2),
              child: Text(eventNewsUiData.name,style: Theme.of(context).textTheme.titleLarge,),
            ),

            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: AppValues.padding,vertical: AppValues.padding_2),
              child: Text(eventNewsUiData.description),
            ),
          ],
        ),
      )
    );
  }
}

