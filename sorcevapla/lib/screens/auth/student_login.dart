import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sorcevapla/constants/constants.dart';
import 'package:sorcevapla/screens/auth/signUp.dart';
import 'package:sorcevapla/screens/home/student_home/student_home.dart';
import 'package:sorcevapla/service/auth.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _isLoading = false;

  void _login() async{
    _changLoading();
    bool isValidate = await loginValidate(_email.text, _password.text);
    if(isValidate){
      bool isLogined = await AuthMethod().studentLogin(_email.text, _password.text, context);
      if(isLogined){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => StudentHome(),), (route) => false);
      }
    }
    _changLoading();
  }

  void _changLoading() {
    if(this.mounted){
      setState(() {
        _isLoading = !_isLoading;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kToolbarHeight,),
            Text('Öğrenci',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text("Hemen Mail Ve Şifreni Gİrerek Giriş Yap!"),
            SizedBox(height: kToolbarHeight + 50,),
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
              filled: true,
              labelText: "E-Mail",
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
            ),
            ),
            SizedBox(height: 15,),
            TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              controller: _password,
              decoration: InputDecoration(
              filled: true,
              labelText: "Şifre",
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(12)),
            ),
            ),
            SizedBox(height: kToolbarHeight,),
            Center(
              child: SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  onPressed: _login, 
                  child: Text('Giriş yap',style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                  ),
              ),
            ),
            SizedBox(height: kToolbarHeight,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text("Henüz hesabın yok mu?"),
            SizedBox(width: 10,),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp(),));
              },
              child: Text("Kaydol")),
              ],
            )
          ],
        ),
      ),
    );
  }
}