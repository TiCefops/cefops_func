
import 'package:cefops_func/app/data/repository/employee_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  EmployeeRepository repository=EmployeeRepository();
 late DocumentSnapshot dados;
  


  Future<DocumentSnapshot> getEmployeById(String id)async{
    dados= await  repository.getEmployeesById(id);

    return dados;

  }

  String statusCheck(bool status){
    if(status==true){
      return "Ativo";
    }
    else {
      return "Inativo";
    }
  }
  Color colorChange(bool status){
    if(status==true){
      return Colors.green;
    }
    else {
      return Colors.red;
    }
  }


}