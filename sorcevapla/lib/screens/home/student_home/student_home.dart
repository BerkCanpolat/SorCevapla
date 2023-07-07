import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorcevapla/model/post_model.dart';
import 'package:sorcevapla/provider/provider.dart';
import 'package:sorcevapla/screens/Question_Display/Question_Display.dart';
import 'package:sorcevapla/screens/home/add_question/add_question.dart';
import 'package:sorcevapla/screens/welcome/splashScreen.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentUserGet();
  }

  studentUserGet() async{
    ProjectProvider projectProvider = Provider.of(context,listen: false);
    await projectProvider.userProviderDetails();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soru Cevap Uygulaması - Öğrenci'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SplashScreen()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _firestore.collection("userQuestion").where('userUid', isEqualTo: _auth.currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<PostModel> denemeQuestions = snapshot.data!.docs.map((e) => PostModel.fromDocument(e)).toList();
          return ListView.builder(
            itemCount: denemeQuestions.length,
            itemBuilder: (context, index) {
              return QuestionDisplayScreen(question: denemeQuestions[index]);
            },
          );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddQuestionScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}