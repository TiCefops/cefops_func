import 'package:cefops_func/app/data/contratos/get_data_interface.dart';
import 'package:cefops_func/app/data/model/employyees_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeePovider implements IGetData {
  @override
  Stream<QuerySnapshot> getAllEmployees() async* {
    CollectionReference data = FirebaseFirestore.instance.collection("funcionarios");
    yield* data.orderBy('nome').snapshots();
  }

  @override
  Future<DocumentSnapshot> getEmployeesById(String id) async {
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection("funcionarios")
        .doc(id)
        .get();
    return data;
  }

  @override
  Future<void> createNewEmployee(
      EmployyeesModel data) async {
    CollectionReference instance =
        FirebaseFirestore.instance.collection("funcionarios");
    await instance.add({
      "ativo": data.ativo,
      "nome": data.nome,
      "linkImg": data.linkImg,
      "dataCotntratado": data.dataCotntratado,
      "cargo": data.cargo
    }).then((value) {
      instance.doc(value.id).update(
        {"id": value.id},
      );
      return value;
    });

  }

  @override
  Future<void> updateEmployeesById(EmployyeesModel dados)async {
     await FirebaseFirestore.instance
        .collection("funcionarios")
        .doc(dados.id)
        .update({
       "cargo":dados.cargo,
       "ativo":dados.ativo,
       "dataCotntratado":dados.dataCotntratado,
       "linkImg":dados.linkImg,
       "nome":dados.nome,




     });



  }

  @override
  Future<void> disableAndEnableEmployeesById({required String id, required bool status})async {
    await FirebaseFirestore.instance
        .collection("funcionarios")
        .doc(id)
        .update({
      "ativo": status
    });
  }
}
