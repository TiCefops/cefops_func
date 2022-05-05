import 'package:cefops_func/app/controller/adm_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownWidget {
  AdmController controller = Get.find();

  Widget setStatus() {
    return Obx(
       () {
        return DropdownButton<String>(
          value:  controller.defaultValueForEmployeeStatus.value,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            controller.setAndConverterUserStatus(newValue!);
            controller.defaultValueForEmployeeStatus.value=newValue;
          },
          items: <String>['Inativo', 'Ativo']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      }
    );
  }
}
