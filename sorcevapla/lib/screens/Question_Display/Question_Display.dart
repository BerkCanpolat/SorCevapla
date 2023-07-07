import 'package:flutter/material.dart';
import 'package:sorcevapla/model/post_model.dart';
import 'package:sorcevapla/screens/Comment/comment_screen.dart';

class QuestionDisplayScreen extends StatelessWidget {
  final PostModel question;

  const QuestionDisplayScreen({required this.question});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(question.name!),
      subtitle: Text(question.questionUser!),
      trailing: ElevatedButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentScreenPage(
          snap: question,
        ),));
      }, child: Text("Yanıtla")),
    );
  }
}