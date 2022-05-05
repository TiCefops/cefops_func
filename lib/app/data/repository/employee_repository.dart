
import 'package:cefops_func/app/data/contratos/get_data_interface.dart';
import 'package:cefops_func/app/data/model/employyees_model.dart';
import 'package:cefops_func/app/data/provider/employee_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeRepository implements IGetData{
 final EmployeePovider _provider=EmployeePovider();
  @override
  Stream<QuerySnapshot> getAllEmployees() {
    return _provider.getAllEmployees();
  }

  @override
  Future<DocumentSnapshot> getEmployeesById(String id) {
    return _provider.getEmployeesById(id);
  }

  @override
  Future<void> createNewEmployee(EmployyeesModel data) {
    return _provider.createNewEmployee(data);
  }

  @override
  Future<void> updateEmployeesById(EmployyeesModel dados) async {
    _provider.updateEmployeesById(dados);
  }

  @override
  Future<void> disableAndEnableEmployeesById({required String id, required bool status})async {
   await _provider.disableAndEnableEmployeesById(id: id, status: status);
  }
}