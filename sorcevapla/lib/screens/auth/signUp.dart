import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sorcevapla/constants/constants.dart';
import 'package:sorcevapla/screens/auth/auth_main.dart';
import 'package:sorcevapla/service/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpLoginState();
}

class _SignUpLoginState extends State<SignUp> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _displayName = TextEditingController();
  bool _isLoading = false;


  void _signUp() async{
    _changLoading();
    bool isvalidate = await signUpValidate(_email.text, _password.text, _name.text);
    if(isvalidate){
      bool isLogined = await AuthMethod().studentSignIn(email: _email.text, password: _password.text, name: _name.text, context: context,displayName: _displayName.text);
      if(isLogined){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AuthMainScreen(),));
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
    _name.dispose();
    _displayName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kToolbarHeight,),
            Text('Kayıt Ol!',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text("Hemen Mail Ve Şifreni Gİrerek Kayıt ol!"),
            SizedBox(height: kToolbarHeight,),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: _email,
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
              textInputAction: TextInputAction.next,
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
            SizedBox(height: 15,),
            TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _name,
              decoration: InputDecoration(
              filled: true,
              labelText: "İsim",
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
              controller: _displayName,
              decoration: InputDecoration(
              filled: true,
              labelText: "Rol",
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
                  onPressed: _signUp, 
                  child: Text('Kayıt Ol',style: TextStyle(color: Colors.black),),
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
            Text("Zaten hesabın var mı?"),
            SizedBox(width: 10,),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthMainScreen(),));
              },
              child: Text("Giriş Yap")),
              ],
            )
          ],
        ),
      ),
    ),
    );
  }
}