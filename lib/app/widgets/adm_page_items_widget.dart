import 'dart:typed_data';

import 'package:cefops_func/app/controller/adm_page_items_widget_controller.dart';
import 'package:cefops_func/app/widgets/singup_new_employee_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class AdmPageItemsWidget {
  Widget employeesItemWidget(QuerySnapshot? data, ByteData imagePlace) {
    Get.lazyPut<AdmPageItemsWidgetController>(() {
      return AdmPageItemsWidgetController();
    });
    AdmPageItemsWidgetController controller = Get.find();

    return ListView.builder(
        itemCount: data?.size,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.2,
                width: Get.width * 0.1,
                child: Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: imagePlace.buffer.asUint8List(),
                    image: "${data?.docs[index].get("linkImg")}",
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    imageScale: 1,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Nome: ${data?.docs[index].get("nome")}"),
                  Text("Cargo: ${data?.docs[index].get("cargo")}"),
                  Text(
                      "Contratado em: ${data?.docs[index].get("dataCotntratado")}"),
                  Text(
                      "Status: ${data?.docs[index].get("ativo") ? "Ativo" : "Inativo"}"),
                  SelectableText.rich(
                    TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Id: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '${data?.docs[index].get("id")}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold,color: Colors.teal),
                            recognizer: TapGestureRecognizer()
                              ..onTap =(){
                                launch('/#/userinfo?userid=${data?.docs[index].get("id")}');
                              }),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            SingupNewEmployeeWidget()
                                .showPopup("EditUser", data: data?.docs[index]);
                          },
                          child: const Text("Editar")),
                      IconButton(onPressed: (){}, icon:const Icon(Icons.qr_code_2)),
                      Obx(() {
                        return controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : TextButton(
                                onPressed: () {
                                  controller.disableAndEnableEmployeesById(
                                      data?.docs[index].get("id"),
                                      data?.docs[index].get("ativo"));
                                },
                                child: Text(data?.docs[index].get("ativo")
                                    ? "Desativar"
                                    : "Ativar"));
                      }),
                    ],
                  )
                ],
              ),
            ],
          ));
        });
  }
}
