import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sorcevapla/constants/constants.dart';
import 'package:sorcevapla/model/post_model.dart';
import 'package:uuid/uuid.dart';

class StoreMethod{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<bool> postAdd(
    String questionUser,
    String uid,
    String name,
    BuildContext context,
  ) async{
    try {
        showLoaderDialog(context);
        Navigator.of(context,rootNavigator: true).pop;
      String postId = Uuid().v1();

      PostModel denemeQuestion = PostModel(userUid: uid,postID: postId, questionUser: questionUser,name: name);

      _firestore.collection("userQuestion").doc(postId).set(denemeQuestion.toJson());

      Navigator.of(context).pop;
      return true;
    }on FirebaseException catch (e) {
      Navigator.of(context,rootNavigator: true).pop;
      Navigator.of(context).pop;
      showMessage(e.code.toString());
    }
    return false;
  }




  Future<void> comments(String text,String name,String postID,String uid) async{
    try {
      if(text.isNotEmpty){
        String commentId = Uuid().v1();
        await _firestore.collection("userQuestion").doc(postID).collection("userComments").doc(commentId).set({
          "text":text,
          "commentId":commentId,
          "name":name,
          "uid":uid,
          "datePublished":DateTime.now(),
        });
      }
    } catch (e) {
      e.toString();
    }
  }
}