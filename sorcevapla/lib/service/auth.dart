import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorcevapla/constants/constants.dart';
import 'package:sorcevapla/model/user_model.dart';

class AuthMethod{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<UserModel> userDetails() async{
    DocumentSnapshot<Map<String,dynamic>> querySnapshot = await 
    _firestore.collection("Users")
    .doc(_auth.currentUser!.uid)
    .get();

    return UserModel.fromJson(querySnapshot.data()!);
  }

  Future<bool> studentSignIn({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
    required String displayName,
  }) async{
    try {
      if(email.isNotEmpty || password.isNotEmpty){
        showLoaderDialog(context);
        Navigator.of(context,rootNavigator: true).pop;
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        UserModel userModel = UserModel(userId: userCredential.user!.uid, email: email, password: password,name: name,displayName: displayName);


        _firestore.collection("Users").doc(userCredential.user!.uid).set(userModel.toJson());
      }
      Navigator.of(context).pop;
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.of(context,rootNavigator: true).pop;
      Navigator.of(context).pop;
      showMessage(e.code.toString());
    }
    return false;
  }


  Future<bool> studentLogin(
    String email,
    String password,
    BuildContext context,
  ) async{
    try {
      if(email.isNotEmpty || password.isNotEmpty){
        showLoaderDialog(context);
        Navigator.of(context,rootNavigator: true).pop;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      }
      Navigator.of(context).pop;
      return true;
    }on FirebaseException catch (e) {
      Navigator.of(context,rootNavigator: true).pop;
      Navigator.of(context).pop;
      showMessage(e.code.toString());
    }
    return false;
  }
}