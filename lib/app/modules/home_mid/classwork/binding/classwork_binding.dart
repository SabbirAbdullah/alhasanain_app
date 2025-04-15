import 'package:alhasanain_app/app/modules/home_mid/classwork/controller/classwork_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassworkBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ClassWorkController());
  }
}