import 'package:cefops_func/app/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Login ADM"),
            Obx(() {
              return controller.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : IconButton(
                      onPressed: () {
                        controller.loginWithGoogle();
                      },
                      icon: const Icon(Icons.login));
            }),
            Center(child: Obx((){
              return Text(controller.message.value,style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.red,

              ),);
            }),)
          ],
        ),
      ),
    );
  }
}
