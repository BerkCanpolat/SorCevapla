import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorcevapla/model/post_model.dart';
import 'package:sorcevapla/model/user_model.dart';
import 'package:sorcevapla/provider/provider.dart';
import 'package:sorcevapla/screens/Comment/widget/comment_widget.dart';
import 'package:sorcevapla/service/store.dart';

class CommentScreenPage extends StatefulWidget {
  final PostModel snap;
  const CommentScreenPage({super.key,required this.snap});

  @override
  State<CommentScreenPage> createState() => _CommentScreenPagetState();
}

class _CommentScreenPagetState extends State<CommentScreenPage> {

  TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<ProjectProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("userQuestion").doc(widget.snap.postID).collection('userComments').orderBy('datePublished', descending: false).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => CommentWidget(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  controller: _text,
                  decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
                      ),
                ),
              ),
              SizedBox(width: 12,),
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text("Paylaş"),
                  onPressed: () async {
                    await StoreMethod().comments(_text.text, user!.name!, widget.snap.postID!, user.userId!);
                    setState(() {
                      _text.text = "";
                    });
                  }
                  ),
            ],
          ),
        ),
      ),
    ); 
  }
}