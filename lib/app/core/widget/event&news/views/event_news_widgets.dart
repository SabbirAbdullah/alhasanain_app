
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

import '../../../values/app_values.dart';
import '../../../values/url.dart';
import '../models/event_ news_ui_data.dart';

class EventNewsWidgets extends StatefulWidget {
  EventNewsWidgets({Key? key, required this.studentEventNews}) : super(key: key);
  final List<EventNewsUiData> studentEventNews;
  @override
  _EventNewsWidgetsState createState() => _EventNewsWidgetsState();
}

class _EventNewsWidgetsState extends State<EventNewsWidgets> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          
          height: 100,
          child: ListView.builder(
            padding: EdgeInsets.only(left:AppValues.halfPadding,right: AppValues.halfPadding),
            itemCount: widget.studentEventNews.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
            return EventNewsCard(eventNewsUiData: widget.studentEventNews[index],);
          },),
        ),
      ],
    );
  }
}

class EventNewsCard extends StatelessWidget {
  const EventNewsCard({Key? key, required this.eventNewsUiData}) : super(key: key);
  final EventNewsUiData eventNewsUiData;
  @override
  Widget build(BuildContext context) {
    DateTime inputDate = DateTime.parse(eventNewsUiData.fromData);
    String formattedDateString = "${inputDate.day.toString().padLeft(2, '0')}/${inputDate.month.toString().padLeft(2, '0')}/${inputDate.year}";
    return  InkWell(
        onTap: () => showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return Dialog.fullscreen(
              child: _dialogContent(context),
            );
          },
        ),
      child: Padding(
        padding: EdgeInsets.only(left: 1.0),
        child: Card(
          elevation: 2,
          color: Colors.white,
          child: SizedBox(
            height: 90,
            width: 180,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppValues.halfPadding),
                  Text(
                    eventNewsUiData.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),

                  SizedBox(height: AppValues.padding_4),

                  Text(
                    formattedDateString,

                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),


                  SizedBox(height: AppValues.padding_4),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppValues.padding_4),
                      child: Text(
                        maxLines: 2,
                        eventNewsUiData.description,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _dialogContent(BuildContext context) {
    DateTime inputDate = DateTime.parse(eventNewsUiData.fromData);
    String formattedDateString = "${inputDate.day.toString().padLeft(2, '0')}/${inputDate.month.toString().padLeft(2, '0')}/${inputDate.year}";

    return SingleChildScrollView(
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
            const EdgeInsets.symmetric(horizontal: AppValues.halfPadding,vertical: AppValues.padding_2),
            child: Text(formattedDateString,style: Theme.of(context).textTheme.titleMedium?.copyWith(color:Colors.blue),),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: AppValues.halfPadding,vertical: AppValues.padding_2),
            child: Text(eventNewsUiData.name,style: Theme.of(context).textTheme.titleLarge,),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: AppValues.halfPadding,vertical: AppValues.padding_2),
            child: Text(eventNewsUiData.description),
          ),
        ],
      ),
    );
  }
}
