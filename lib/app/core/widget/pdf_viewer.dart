import 'dart:io';
import 'package:alhasanain_app/app/core/values/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get.dart';

class PdfViewerPage extends StatelessWidget {
  final String pdfUrl;
  final String title;

  const PdfViewerPage({
    super.key,
    required this.pdfUrl,
    required this.title,
  });

  Future<void> downloadPdf(BuildContext context) async {
    try {
      // Ask for storage permission
      var status = await Permission.storage.request();
      if (!status.isGranted) {
        Get.snackbar("Permission Denied", "Storage permission is required.");
        return;
      }
      final String fileName = pdfUrl.split("/").last;

      // 📁 Use the Downloads directory
      final Directory downloadsDir = Directory('/storage/emulated/0/Download');
      final String filePath = '${downloadsDir.path}/$fileName';

      final Dio dio = Dio();
      await dio.download(pdfUrl, filePath);

      Get.snackbar(
        "Download Complete",
        "Saved to Downloads folder as $fileName",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar("Download Failed", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => downloadPdf(context),
          ),
        ],
      ),
      body:  SfPdfViewer.network(pdfUrl,),
    );
  }
}
