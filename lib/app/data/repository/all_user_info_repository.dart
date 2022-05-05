import 'package:cefops_func/app/data/provider/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllUserInfoRepository{
  final AllUserInfoProvider _provider=AllUserInfoProvider();

  Future<void> singUpNewUser()async{
   await _provider.singUpNewUser();
  }

  Future<DocumentSnapshot> getUserInfo()async{
    DocumentSnapshot data=  await _provider.getAllUserInfo();
    return data;
  }
}