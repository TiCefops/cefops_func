import 'package:cefops_func/app/controller/home_controller.dart';
import 'package:get/get.dart';


class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController();
    });
  }
}