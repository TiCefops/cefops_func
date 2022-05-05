

import 'package:cefops_func/app/controller/login_controller.dart';
import 'package:get/get.dart';




class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController();
    });
  }
}