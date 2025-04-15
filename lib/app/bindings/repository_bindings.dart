
import 'package:alhasanain_app/app/data/repository/authentication_repository.dart';
import 'package:alhasanain_app/app/data/repository/authentication_repository_impl.dart';
import 'package:alhasanain_app/app/data/repository/pref_repository.dart';
import 'package:alhasanain_app/app/data/repository/pref_repository_impl.dart';
import 'package:alhasanain_app/app/data/repository/student_data_repository.dart';
import 'package:alhasanain_app/app/data/repository/student_data_repository_impl.dart';
import 'package:get/get.dart';

import '../data/repository/parents_repository.dart';
import '../data/repository/paretns_repository_impl.dart';
import '../data/repository/student_payment_repository.dart';
import '../data/repository/student_payment_repository_impl.dart';
class RepositoryBindings implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl(),
      tag: (AuthenticationRepository).toString(),
        fenix: true
    );

    Get.lazyPut<PrefRepository>(
          () => PrefRepositoryImpl(),
      tag: (PrefRepository).toString(),
        fenix: true
    );


    Get.lazyPut<StudentDataRepository>(
          () => StudentDataRepositoryImpl(),
      tag: (StudentDataRepository).toString(),
        fenix: true
    );

    Get.lazyPut<StudentPaymentRepository>(
          () => StudentPaymentRepositoryImpl(),
      tag: (StudentPaymentRepository).toString(),
        fenix: true
    );

    Get.lazyPut<ParentsRepository>(
          () => ParentsRepositoryImpl(),
      tag: (ParentsRepository).toString(),
        fenix: true
    );

    // Get.lazyPut<DailyLessonRepository>(
    //         () => DailyLessonImpl(),
    //     tag: (DailyLessonRepository).toString(),
    //     fenix: true);


  }
}
