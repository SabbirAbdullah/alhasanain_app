// import 'package:alhasanain_app/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class FeesPaymentView extends StatefulWidget {
//   const FeesPaymentView({super.key, required this.paymentUrl});
//   final String paymentUrl;
//   @override
//
//   State<FeesPaymentView> createState() => _FeesPaymentViewState();
//
// }
//
// class _FeesPaymentViewState extends State<FeesPaymentView> {
//   @override
//   void initState() {
//     print(widget.paymentUrl);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(body: SafeArea(
//       child: WebViewWidget(
//         controller: WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(Uri.parse('${widget.paymentUrl}')) ..setNavigationDelegate(
//           NavigationDelegate(
//             onProgress: (int progress) {
//
//             },
//             onPageStarted: (String url) {
//
//             },
//             onPageFinished: (String url) {
//
//
//
//             },
//             onWebResourceError: (WebResourceError error) {},
//
//
//             onNavigationRequest: (NavigationRequest request) {
//               if (request.url.contains('success')) {
//                 Get.offAllNamed(Routes.MAIN);
//               }
//               else if(request.url.contains('failure')){
//                 Get.offAllNamed(Routes.MAIN);
//               }
//               else if(request.url.contains('cancel')){
//                 Get.offAllNamed(Routes.MAIN);
//               }
//               return NavigationDecision.navigate;
//             },
//
//           ),
//         ),
//       ),
//     ),);
//   }
// }
