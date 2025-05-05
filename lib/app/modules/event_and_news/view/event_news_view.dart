import 'package:alhasanain_app/app/core/base/base_view.dart';
import 'package:alhasanain_app/app/core/widget/custom_app_bar.dart';
import 'package:alhasanain_app/app/core/widget/paging_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/widget/event&news/widgets/event_news_tiles.dart';
import '../controller/event_news_controller.dart';

class EventNewsView extends BaseView<EventNewsController> {

  final EventNewsController  controller = Get.put(EventNewsController());
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Event & News',
    );
  }

  @override
  Widget body(BuildContext context) {
    return PagingView(
      onRefresh: () => controller.getEventNewsData(
          controller.studentDataResponseUi.studentSession,
          controller.studentDataResponseUi.studentClass),
      onLoadNextPage: () {},
      child: Obx(() => controller.eventNewsDataList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/empty.png",
                    height: 100,
                  ),
                  Text("No Event & News Available")
                ],
              ),
            )
          : ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.eventNewsDataList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 08.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(08)),
                    margin: EdgeInsets.only(right: 9.0, left: 9.0, top: 12.0),
                    child: EventNewsTiles(
                      eventNewsUiData: controller.eventNewsDataList[index],
                    ),
                  ),
                );
              },
            )),
    );
    throw UnimplementedError();
  }
}
