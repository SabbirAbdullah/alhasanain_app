import 'package:alhasanain_app/app/data/remote/authentication_remote_data_impl.dart';
import 'package:alhasanain_app/app/data/remote/authentication_remote_data_source.dart';
import 'package:alhasanain_app/app/data/remote/parents_remote_data_source.dart';
import 'package:alhasanain_app/app/data/remote/student_remote_data_impl.dart';
import 'package:alhasanain_app/app/data/remote/student_remote_data_source.dart';
import 'package:get/get.dart';

import '../data/remote/parents_remote_data_impl.dart';
import '../data/remote/payment_fee_data_impl.dart';
import '../data/remote/payment_fee_data_source.dart';


class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<AuthenticationRemoteDataSource>(
          () => AuthenticationRemoteDataImpl(),
      tag: (AuthenticationRemoteDataSource).toString(),
      fenix: true
    );

    Get.lazyPut<StudentRemoteDataSource>(
          () => StudentRemoteDataImpl(),
      tag: (StudentRemoteDataSource).toString(),
        fenix: true
    );


    Get.lazyPut<PaymentFeeDataSource>(
          () => PaymentFeeDataImpl(),
      tag: (PaymentFeeDataSource).toString(),
        fenix: true
    );

    Get.lazyPut<ParentsRemoteDataSource>(
          () => ParetnsRemoteDataImpl(),
      tag: (ParentsRemoteDataSource).toString(),
        fenix: true
    );
    // Get.lazyPut<DailyLessonDataSource>(
    //         () => DailyLessonDataImpl(),
    //     tag: (DailyLessonDataSource).toString(),
    //     fenix: true);
  }
}
