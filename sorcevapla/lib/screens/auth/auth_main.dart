import 'package:flutter/material.dart';
import 'package:sorcevapla/screens/auth/student_login.dart';
import 'package:sorcevapla/screens/auth/teacher_login.dart';

class AuthMainScreen extends StatefulWidget {
  const AuthMainScreen({super.key});

  @override
  State<AuthMainScreen> createState() => _AuthMainScreenState();
}

class _AuthMainScreenState extends State<AuthMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
                TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  indicatorWeight: 4,
                  tabs: [
                    Tab(child: Text("Öğrenci"),),
                    Tab(child: Text("Öğretmen"),),
                  ],
                ),
              Expanded(
                child: TabBarView(
                  children: [
                    StudentLogin(),
                    TeacherLogin(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      );
  }
}