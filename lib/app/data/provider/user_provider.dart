import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllUserInfoProvider {


  Future<DocumentSnapshot>getAllUserInfo()async{
    User? _auth = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("users");
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection("users")
        .doc(_auth?.uid)
        .get();
    return data;

  }


  Future<void> singUpNewUser() async {
    User? _auth = FirebaseAuth.instance.currentUser;
    CollectionReference instance =
        FirebaseFirestore.instance.collection("users");

    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection("users")
        .doc(_auth?.uid)
        .get();

    if(!data.exists){
      await instance.doc(_auth?.uid).set(
        {
          "uid": _auth?.uid,
          "nomeEmail": _auth?.displayName,
          "email": _auth?.email,
          "ativo": false

        },
      );

    }
    }

}
