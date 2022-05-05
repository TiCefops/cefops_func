
import 'package:cefops_func/app/data/repository/employee_repository.dart';
import 'package:get/get.dart';

class AdmPageItemsWidgetController extends GetxController{
  final EmployeeRepository _repository = EmployeeRepository();
  RxBool isLoading=false.obs;


  Future<void> disableAndEnableEmployeesById(String id, bool status)async{
      isLoading.value=true;
  await  _repository.disableAndEnableEmployeesById(id: id, status: !status);
      isLoading.value=false;
  }
}