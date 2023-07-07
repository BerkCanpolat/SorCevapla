import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorcevapla/constants/constants.dart';
import 'package:sorcevapla/model/user_model.dart';
import 'package:sorcevapla/provider/provider.dart';
import 'package:sorcevapla/service/store.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {

final TextEditingController _questionController = TextEditingController();

_postAdd(
  String name,
  String uid,
) async{
  bool isValidate = isPostValidate(_questionController.text);
  if(isValidate){
    bool isPost =   await StoreMethod().postAdd(_questionController.text, uid, name,context);
    Navigator.of(context).pop();
    if(isPost){
      Navigator.of(context).pop();
    }
  }
}

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<ProjectProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Soru Ekle'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _questionController,
            decoration: InputDecoration(
              labelText: 'Sorunuzu girin',
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(onPressed: () => _postAdd(user!.name!, user.userId!), child: Text("Gönder")))
        ],
      ),
    );
  }
}
