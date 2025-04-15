import 'package:alhasanain_app/app/core/model/bulk_fee_body_param.dart';
import 'package:alhasanain_app/app/core/model/single_fee_body_param.dart';
import 'package:alhasanain_app/app/data/model/student_payment_fees_response.dart';
import 'package:alhasanain_app/app/data/repository/student_payment_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../core/model/fees_query_perameter.dart';
import '../remote/payment_fee_data_source.dart';


class StudentPaymentRepositoryImpl extends StudentPaymentRepository{


  final PaymentFeeDataSource _remoteSource =
  Get.find(tag: (PaymentFeeDataSource).toString());


  @override
  Future<Map<String, dynamic>> feesDataInitiate(StudentFeesQueryPrem studentFeesQueryPrem) {
    return _remoteSource.feesDataInitiate(studentFeesQueryPrem);
    throw UnimplementedError();
  }

  @override
  Future<StudentFeesResponse> getStudentFeesData(String studentId) {
    return _remoteSource.getStudentFeesData(studentId);
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> makeBulkPayment(BulkFeeBodyParam bulkFeeBodyParam) {
    return _remoteSource.makeBulkPayment(bulkFeeBodyParam);
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> makeSinglePayment(SingleFeeBodyParam singleFeeBodyParam) {
   return _remoteSource.makeSinglePayment(singleFeeBodyParam);
    throw UnimplementedError();
  }

}