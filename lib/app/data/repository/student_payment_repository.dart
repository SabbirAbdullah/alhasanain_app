import '../../core/model/bulk_fee_body_param.dart';
import '../../core/model/fees_query_perameter.dart';
import '../../core/model/single_fee_body_param.dart';
import '../model/student_payment_fees_response.dart';

abstract class StudentPaymentRepository{
  Future<StudentFeesResponse>getStudentFeesData(String studentId);
  Future<Map<String,dynamic>> feesDataInitiate(StudentFeesQueryPrem studentFeesQueryPrem);
  Future<Map<String,dynamic>>makeSinglePayment(SingleFeeBodyParam singleFeeBodyParam);
  Future<Map<String,dynamic>>makeBulkPayment(BulkFeeBodyParam bulkFeeBodyParam);
}