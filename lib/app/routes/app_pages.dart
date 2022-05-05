import 'package:cefops_func/app/bindings/adm_binding.dart';
import 'package:cefops_func/app/bindings/home_binding.dart';
import 'package:cefops_func/app/bindings/login_binding.dart';
import 'package:cefops_func/app/pages/adm_page.dart';
import 'package:cefops_func/app/pages/home_page.dart';
import 'package:cefops_func/app/pages/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';


class AppPages {
  static final routes = [
    GetPage(
        name: Routes.INITIAL,
        page: () =>   HomePage(),
        binding: HomePageBinding()
    ),
    GetPage(
        name: Routes.USERINFO,
        page: () =>   HomePage(),
        binding: HomePageBinding()
    ),
    GetPage(
        name: Routes.ADM,
        page: () =>  const AdmPage(),
        binding: AdmBinding()
    ), GetPage(
        name: Routes.LOGIN,
        page: () =>  const LoginPage(),
        binding: LoginBinding()
    ),

  ];
}
