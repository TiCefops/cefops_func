import 'package:cefops_func/app/controller/adm_controller.dart';
import 'package:cefops_func/app/widgets/adm_page_items_widget.dart';
import 'package:cefops_func/app/widgets/singup_new_employee_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;


class AdmPage extends GetView<AdmController> {
   const AdmPage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    imageplaceholder();

    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: Get.height * 0.9, minWidth: 400),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              const Center(
                child: Text("Listar Usuários",style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800
                ),),
              ),
              SizedBox(
                height: Get.height * 0.2,
              ),
              Expanded(
                child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: StreamBuilder(
                    stream: controller.getAllFunc(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      return !snapshot.hasData
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : AdmPageItemsWidget().employeesItemWidget(snapshot.data,controller.imageData);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SingupNewEmployeeWidget().showPopup("newUser");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  Future<ByteData > imageplaceholder()async{

    ByteData bytes = await rootBundle.load('assets/images/brasaoAzul.png').then((value) {
      controller.setBytData(value);
      return value;
    });
    return bytes;
  }

}



