
import 'package:cefops_func/app/auth/auth.dart';
import 'package:cefops_func/app/data/repository/all_user_info_repository.dart';
import 'package:cefops_func/app/routes/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final AllUserInfoRepository _repository = AllUserInfoRepository();
  User? user;
  RxBool loading = false.obs;
  RxBool userActive=false.obs;
  RxString message="".obs;


  Future<void> loginWithGoogle() async {
    loading.value = true;
    await Authentication.signInWithGoogle().then(
          (value) async {
        if (value!.uid != null) {
          await _repository.singUpNewUser().onError(
                (error, stackTrace) {
              loading.value = false;
            },
          );

          DocumentSnapshot dados=await _repository.getUserInfo();
          if(dados.get("ativo")==false){
            message.value="Conta aguardando   liberação";
          }
          else{
            Get.offAndToNamed(Routes.ADM);
          }

        }
      },
    ).onError((error, stackTrace) {
      loading.value = false;
    });
    loading.value = false;
  }
}