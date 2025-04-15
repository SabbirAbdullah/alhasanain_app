import 'package:alhasanain_app/app/core/model/bulk_fee_body_param.dart';
import 'package:alhasanain_app/app/core/model/single_fee_body_param.dart';
import 'package:alhasanain_app/app/data/model/student_payment_fees_response.dart';
import 'package:alhasanain_app/app/data/remote/payment_fee_data_source.dart';
import 'package:dio/src/response.dart';

import '../../core/base/base_remote_source.dart';
import '../../core/model/fees_query_perameter.dart';
import '../../network/dio_provider.dart';

class PaymentFeeDataImpl extends BaseRemoteSource
    implements PaymentFeeDataSource{
  @override
  Future<Map<String, dynamic>> feesDataInitiate(StudentFeesQueryPrem studentFeesQueryPrem) {

    var endpoint =
        "${DioProvider.baseUrl}/server/payment/initiatePayment";
    var dioCall = dioClient.post(endpoint, data: studentFeesQueryPrem.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => response.data);
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

  @override
  Future<StudentFeesResponse> getStudentFeesData(String studentId) {
    var endpoint =
        "${DioProvider.baseUrl}/server/feesCollectionById";
    var dioCall = dioClient.post(endpoint, data: {"student_id": studentId});

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseStudentDataResponse(response));
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> makeSinglePayment(SingleFeeBodyParam singleFeeBodyParam) {
    var endpoint =
        "${DioProvider.baseUrl}/server/payment/initiatePayment";
    var dioCall = dioClient.post(endpoint, data: singleFeeBodyParam.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) =>response.data);
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> makeBulkPayment(BulkFeeBodyParam bulkFeeBodyParam) {
    var endpoint =
        "${DioProvider.baseUrl}/server/payment/initiatePayment";
    var dioCall = dioClient.post(endpoint, data: bulkFeeBodyParam.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => response.data);
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

}

_parseStudentDataResponse(Response response) {
  return StudentFeesResponse.fromJson(response.data);
}