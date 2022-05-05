import 'package:cefops_func/app/controller/adm_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dropdown_widget.dart';
import 'form_widget.dart';

class SingupNewEmployeeWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  AdmController controller = Get.find();

  showPopup(String page,{QueryDocumentSnapshot? data}) {
    if(page=="newUser"){
      return Get.defaultDialog(

          title: "Novo Funcionario",
          content: SizedBox(
            width: Get.width * 0.5,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width * 0.1,
                    height: Get.height * 0.2,
                    child: Obx(() {
                      return Image.network(
                        controller.imgUrl.value,
                        width: Get.width * 0.05,
                        fit: BoxFit.cover,
                      );
                    }),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: Obx(() {
                      return controller.loading.value
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                        onPressed: () {
                          controller.uploadImage();
                        },
                        child: const Text("Enviar Nova foto"),
                      );
                    }),
                  ),
                  formWidget(label: "Nome Completo", controller: nameController),
                  formWidget(label: "Cargo", controller: positionController),
                  formWidget(
                      label: "Data De Contratação", controller: dateController),
                  DropDownWidget().setStatus(),
                ],
              ),
            ),
          ),
          textCancel: "Cancelar",
          textConfirm: "Salvar",
          onConfirm: () async{
            if(_formKey.currentState!.validate()){
              await controller.createNewUser(nome: nameController.text,
                  cargo: positionController.text,
                  dataCadastro: dateController.text);
              controller.imgUrl.value="https://firebasestorage.googleapis.com/v0/b/funceas.appspot.com/o/defaultimage.png?alt=media&token=209b92eb-a4dc-4588-a4a7-c25edaf00445";
              Get.back();
            }
          },
          onCancel: (){
            if (page=="newUser") {
              if(controller.imgUrl.value !="https://firebasestorage.googleapis.com/v0/b/funceas.appspot.com/o/defaultimage.png?alt=media&token=209b92eb-a4dc-4588-a4a7-c25edaf00445"){
                controller.deletUpload();
                controller.imgUrl.value="https://firebasestorage.googleapis.com/v0/b/funceas.appspot.com/o/defaultimage.png?alt=media&token=209b92eb-a4dc-4588-a4a7-c25edaf00445";

              }
            }
          }

      );

    }else{
      nameController.text=data?.get("nome");
      dateController.text=data?.get("dataCotntratado");
      positionController.text=data?.get("cargo");
      controller.imgUrl.value=data?.get("linkImg");
      controller.employeeStatus.value=data?.get("ativo");
      return Get.defaultDialog(
          title: "Novo Funcionario",
          content: SizedBox(
            width: Get.width * 0.5,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width * 0.1,
                    height: Get.height * 0.2,
                    child: Obx(() {
                      return Image.network(
                        controller.imgUrl.value,
                        width: Get.width * 0.05,
                        fit: BoxFit.cover,
                      );
                    }),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: Obx(() {
                      return controller.loading.value
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                        onPressed: () {
                          controller.uploadImage();
                        },
                        child: const Text("Enviar Nova foto"),
                      );
                    }),
                  ),
                  formWidget(label: "Nome Completo", controller: nameController),
                  formWidget(label: "Cargo", controller: positionController),
                  formWidget(
                      label: "Data De Contratação", controller: dateController),
                  DropDownWidget().setStatus(),
                ],
              ),
            ),
          ),
          textCancel: "Cancelar",
          textConfirm: "Salvar",
          onConfirm: () async{
            if(_formKey.currentState!.validate()){
              await controller.updateUser(nome: nameController.text,
                  cargo: positionController.text,
                  dataCadastro: dateController.text, id: data?.get("id"));
              controller.imgUrl.value="https://firebasestorage.googleapis.com/v0/b/funceas.appspot.com/o/defaultimage.png?alt=media&token=209b92eb-a4dc-4588-a4a7-c25edaf00445";
              Get.back();
            }
          },
          onCancel: (){
            if (page=="EditUser") {
              if(controller.imgUrl.value !="https://firebasestorage.googleapis.com/v0/b/funceas.appspot.com/o/defaultimage.png?alt=media&token=209b92eb-a4dc-4588-a4a7-c25edaf00445"){

               if(controller.imgUrl.value==data?.get("linkImg")){

               }else{
                 controller.deletUpload();
               }

              }

            }
            controller.imgUrl.value="https://firebasestorage.googleapis.com/v0/b/funceas.appspot.com/o/defaultimage.png?alt=media&token=209b92eb-a4dc-4588-a4a7-c25edaf00445";
          }

      );

    }
    }
    }



