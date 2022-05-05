

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget formWidget({required String label,required TextEditingController controller}){
  return SizedBox(
    width: Get.width*0.45,
    child: TextFormField(
      controller: controller,

      decoration: InputDecoration(
        label:Text(label),

      )
    ),
  );
}