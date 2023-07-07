import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel{
   String? userUid;
   String? name;
   String? postID;
   String? questionUser;

  PostModel({
    required this.name,
    required this.userUid,
    required this.questionUser,
    required this.postID,
  });

  Map<String,dynamic> toJson() => {
    "name":name,
    "userUid":userUid,
    "questionUser":questionUser,
    "postID":postID,
  };

  static PostModel fromSnap(DocumentSnapshot documentSnapshot){
    var snap = documentSnapshot.data() as Map<String,dynamic>?;

    return PostModel(
      name: snap?["name"],
      userUid: snap?["userUid"],
      questionUser: snap?["questionUser"],
      postID: snap?["postID"],
    );
  }

  factory PostModel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return PostModel(
      userUid: data['userUid'],
      name: data['name'],
      postID: data['postID'],
      questionUser: data['questionUser'],
    );
  }
}