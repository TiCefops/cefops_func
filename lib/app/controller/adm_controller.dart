
import 'dart:typed_data';

import 'package:cefops_func/app/data/model/employyees_model.dart';
import 'package:cefops_func/app/data/repository/employee_repository.dart';
import 'package:cefops_func/app/routes/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AdmController extends GetxController {
  User? user= FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    if(user?.uid==null){
      Get.offAndToNamed(Routes.LOGIN);

    };
  }
  final EmployeeRepository _repository = EmployeeRepository();
  RxString url = "".obs;
  RxString imgUrl =
      "https://firebasestorage.googleapis.com/v0/b/funceas.appspot.com/o/defaultimage.png?alt=media&token=209b92eb-a4dc-4588-a4a7-c25edaf00445"
          .obs;
  RxBool employeeStatus = false.obs;
  RxString defaultValueForEmployeeStatus = "Inativo".obs;
  RxBool loading = false.obs;
  late ByteData imageData;

  Future<void> uploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      loading.value = true;
      Uint8List? fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;
      Reference reference =
          FirebaseStorage.instance.ref('cefops/func/$fileName');
      await reference.putData(fileBytes!).then((p0) => loading.value = false);
      imgUrl.value = await reference.getDownloadURL();
      loading.value = false;
    } else {}
  }

  Future<void> deletUpload() async {
    await FirebaseStorage.instance.refFromURL(imgUrl.value).delete();
  }

  void setAndConverterUserStatus(String value) {
    switch (value) {
      case "Ativo":
        employeeStatus.value = true;
        break;
      case "inativo":
        employeeStatus.value = false;
    }
  }

  Stream<QuerySnapshot> getAllFunc() async* {
    yield* _repository.getAllEmployees();

  }

  Future<void> createNewUser(
      {required String nome,
      required String cargo,
      required String dataCadastro}) async {
    EmployyeesModel data = EmployyeesModel();
    data.nome=nome;
    data.cargo=cargo;
    data.dataCotntratado=dataCadastro;
    data.ativo=employeeStatus.value;
    data.linkImg=imgUrl.value;
    _repository.createNewEmployee(data);
  }
  setBytData(ByteData data){
    imageData=data;
    update();

  }

  Future<void> updateUser( {required String nome,required String id,
    required String cargo,
    required String dataCadastro})async{
    EmployyeesModel data = EmployyeesModel();
    data.nome=nome;
    data.cargo=cargo;
    data.dataCotntratado=dataCadastro;
    data.ativo=employeeStatus.value;
    data.linkImg=imgUrl.value;
    data.id=id;
    _repository.updateEmployeesById(data);
  }


}
