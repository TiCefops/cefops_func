

import 'package:cefops_func/app/data/model/employyees_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IGetData{
  Future<DocumentSnapshot> getEmployeesById(String id);
  Future<void> updateEmployeesById(EmployyeesModel dados);
  Future<void> disableAndEnableEmployeesById({required String id, required bool status});
  Future<void> createNewEmployee(EmployyeesModel data);
  Stream<QuerySnapshot> getAllEmployees();

}