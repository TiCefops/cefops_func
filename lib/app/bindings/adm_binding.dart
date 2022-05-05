
import 'package:cefops_func/app/controller/adm_controller.dart';
import 'package:get/get.dart';

class AdmBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdmController>(() {
      return AdmController();
    });
  }
}