// import 'dart:convert';
//
// import 'package:alhasanain_app/app/core/base/base_controller.dart';
// import 'package:alhasanain_app/app/core/model/bulk_fee_body_param.dart';
// import 'package:alhasanain_app/app/core/model/single_fee_body_param.dart';
// import 'package:get/get.dart';
//
// import '../../../core/base/paging_controller.dart';
// import '../../../core/model/fees_query_perameter.dart';
// import '../../../data/model/student_payment_fees_response.dart';
// import '../../../data/repository/pref_repository.dart';
// import '../../../data/repository/student_payment_repository.dart';
// import '../../fees_payment_webview/view/fees_payment_view.dart';
// import '../model/student_fee_payment_ui_data.dart';
//
// class StudentFeesPaymentController extends BaseController {
//
//   final PrefRepository _prefRepository=
//   Get.find(tag: (PrefRepository).toString());
//   List<StudentPaymentFeeUiData>? data=[];
//   List<Map<String, dynamic>>? paymentData=[];
//   final StudentPaymentRepository _repository =
//   Get.find(tag: (StudentPaymentRepository).toString());
//
//   final RxList<StudentPaymentFeeUiData> _githubProjectListController =
//   RxList.empty();
//
//   List<StudentPaymentFeeUiData> get projectList =>
//       _githubProjectListController.toList();
//
//   final pagingController = PagingController<StudentPaymentFeeUiData>();
//
//   var totalAmount=0.obs;
//
//
//   Future<void>makeSinglePayment(StudentPaymentFeeUiData studentPaymentFeeUiData)async{
//     var studentId=  await _prefRepository.getString('id');
//     var studentFees= SelectedFees(
//         id: studentPaymentFeeUiData.id,
//         studentId: studentId,
//         feesInfo: "",
//         feesType: "student Fees",
//         dueDate: studentPaymentFeeUiData.dueDate,
//         amount: studentPaymentFeeUiData.amount.toDouble(),
//         paymentId: studentPaymentFeeUiData.paymentId,
//         paymentMode: '',
//         paymentDate: '',
//         discount: 0,
//         fine: 0,
//         paid: 0,
//         balance: 0,
//         paymentStatus: '',
//         advancePayment: '',
//         status2: 0,
//         status3: 0,
//         session: studentPaymentFeeUiData.session,
//         compile:'',
//         initiateTxn: '',
//         trxID: '',
//         createDate: DateTime.now());
//
//     var singleFee=SingleFeeBodyParam(
//         studentId: studentId,
//         feesId: studentPaymentFeeUiData.id.toString(),
//         cusName: 'user',
//         cusEmail: 'test@gmail.com',
//         cusPhone: studentId,
//         cusAdd1: "CTG",
//         cusAdd2: "CTG",
//         cusCity: "CTG",
//         cusCountry: 'Bangladesh',
//         amount: "${studentPaymentFeeUiData.amount-studentPaymentFeeUiData.paid}",
//         currency: "BDT",
//         desc: [studentFees],
//         selectedFees: [studentFees],
//         ptype: 'quick');
//
//     var makeSinglePaymentService=_repository.makeSinglePayment(singleFee);
//     callDataService(makeSinglePaymentService,onSuccess: _initiatePaymentSuccessResponse);
//
//   }
//
//
//
//   Future<void> makeBulkPayment(String amount,StudentPaymentFeeUiData studentPaymentFeeUiData) async {
//     var studentId=  await _prefRepository.getString('id');
//     var bulkSmsFee=[BulkFee(
//         id: 0,
//         studentId: studentId,
//         feesInfo: '',
//         feesType: '',
//         dueDate: '',
//         amount: double.parse(amount),
//         paymentId: '',
//         paymentMode: '',
//         paymentDate: '',
//         discount: 0,
//         fine: 0,
//         paid: 0,
//         balance: 0,
//         paymentStatus: '',
//         advancePayment: '',
//         status2: 0,
//         status3: 0,
//         session: studentPaymentFeeUiData.session,
//         compile: '',
//         initiateTxn: '',
//         trxID: '',
//         createDate: DateTime.now())];
//     var bulkPaymentBodyData=BulkFeeBodyParam(
//         studentId: studentId,
//         feesID: 'feesID',
//         cusName: 'user',
//         cusEmail: 'user@gmail.com',
//         cusPhone: studentId,
//         cusAdd1: 'CTG',
//         cusAdd2:'CTG' ,
//         cusCity: 'CTG',
//         cusCountry: "Bangladesh",
//         amount: double.parse(amount),
//         currency: 'BDT',
//         desc: bulkSmsFee,
//         selectedFees: bulkSmsFee,
//         ptype: 'quick');
//     var makeBulkPaymentService=_repository.makeBulkPayment(bulkPaymentBodyData);
//     callDataService(makeBulkPaymentService,onSuccess: _initiatePaymentSuccessResponse);
//   }
//
//
//   Future<void> initializePayment() async {
//
//     var studentId=  await _prefRepository.getString('id');
//     StudentFeesQueryPrem studentFeesQueryPrem = StudentFeesQueryPrem(
//       studentId: studentId,
//       add1: "CTG",
//       add2: "CTG",
//       amount: "${totalAmount.value}",
//       city: "CTG",
//       country: "Bangladesh",
//       currency: "BDT",
//       desc: jsonEncode(paymentData),
//       feesId: "feesID",
//       selectedFees: jsonEncode(paymentData),
//       userEmail: "alhasanain@gmail.com",
//       userName: "alhasanain",
//       userPhone: "01111111111",
//     );
//     var githubRepoSearchService =
//     _repository.feesDataInitiate(studentFeesQueryPrem);
//
//     callDataService(
//       githubRepoSearchService,
//       onSuccess: _handlePaymentSuccessResponse,
//     );
//
//     pagingController.isLoadingPage = false;
//   }
//
//   getStudentFees() async {
//     var studentId=  await _prefRepository.getString('id');
//
//
//
//     if (!pagingController.canLoadNextPage()) return;
//
//     pagingController.isLoadingPage = true;
//
//     var githubRepoSearchService = _repository.getStudentFeesData(studentId);
//
//     callDataService(
//       githubRepoSearchService,
//       onSuccess: _handleProjectListResponseSuccess,
//     );
//
//     pagingController.isLoadingPage = false;
//   }
//
//   onRefreshPage() {
//     pagingController.initRefresh();
//     getStudentFees();
//   }
//
//   onLoadNextPage() {
//     logger.i("On load next");
//
//     getStudentFees();
//   }
//
//   void _handleProjectListResponseSuccess(StudentFeesResponse response) {
//
//
//     List<StudentPaymentFeeUiData>? repoList = response.message
//         ?.map((e) {
//       DateTime inputDate = DateTime.parse("${e.dueDate}");
//       String formattedDateString = "${inputDate.day.toString().padLeft(2, '0')}/${inputDate.month.toString().padLeft(2, '0')}/${inputDate.year}";
//       return StudentPaymentFeeUiData(
//         amount: e.amount != null ? e.amount! : 0,
//         paid: e.paid != null ? e.paid! : 0,
//         paymentDate: e.paymentDate != null ? e.paymentDate! : "Null",
//         dueDate: e.dueDate != null ? formattedDateString: "Null",
//         feesInfo: e.feesInfo != null ? e.feesInfo! : "Null",
//         id: e.id != null ? e.id! : 0,
//         advancePayment: e.advancePayment != null ? e.advancePayment! : "Null",
//         discount: e.discount != null ? e.discount! : 0,
//         balance: e.balance != null ? e.balance! : 0,
//         studentId:  e.studentId != null ? e.studentId! : '',
//         compile: e.compile != null ? e.compile! : "Null",
//         feesType: e.feesType != null ? e.feesType! : "Null",
//         fine:  e.fine != null ? e.fine! : 0,
//         initiateTxn: e.initiateTxn != null ? e.initiateTxn! : "Null",
//         feesMonth: e.feesMonth != null ? e.feesMonth! : "Null",
//         session: e.session != null ? e.session! : "Null",
//         trxID:e.trxID != null ? e.trxID! : "Null",
//         paymentId: e.paymentId != null ? e.paymentId! : "Null",
//         paymentMode: e.paymentMode != null ? e.paymentMode! : "Null",
//         paymentStatus: e.paymentStatus != null ? e.paymentStatus! : "Null",
//         status2: e.status2 != null ? e.status2! : 0,
//         status3: e.status3 != null ? e.status3! : 0,
//
//
//       );
//     })
//         .toList();
//
//     if (_isLastPage(pagingController.pageNumber, 1!)) {
//       pagingController.appendLastPage(repoList!);
//     } else {
//       pagingController.appendPage(repoList!);
//     }
//
//     var newList = [...pagingController.listItems];
//
//     newList.forEach((element) => totalAmount.value+=element.amount-element.paid,);
//     _githubProjectListController(newList);
//   }
//
//   bool _isLastPage(int currentPage, int totalCount) {
//     return currentPage >= totalCount;
//   }
//
//   // _handlePaymentSuccessResponse(Map<String, dynamic> response) {
//   //
//   //
//   //   Get.to(()=>FeesPaymentView(paymentUrl: response.values.toList()[1],));
//   // }
//   //
//   //
//   //
//   // _initiatePaymentSuccessResponse(Map<String, dynamic> response) {
//   //   Get.to(()=>FeesPaymentView(paymentUrl: response.values.toList()[1],));
//   // }
//
//
// }
