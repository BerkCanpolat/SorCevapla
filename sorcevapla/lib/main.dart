import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorcevapla/firebase_options.dart';
import 'package:sorcevapla/provider/provider.dart';
import 'package:sorcevapla/screens/home/student_home/student_home.dart';
import 'package:sorcevapla/screens/home/teacher_home/teacher_home.dart';
import 'package:sorcevapla/screens/welcome/splashScreen.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProjectProvider(),)
      ],
      child: MaterialApp(
        title: 'Uygulama',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              User? user = snapshot.data;
              if (user != null) {
                // Kullanıcının oturum açma durumu aktif ise Firestore'dan rolü al
                return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: _firestore.collection("Users").doc(user.uid).get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData && snapshot.data != null) {
                        // Firestore'dan rolü al ve yönlendirme yap
                        String role = snapshot.data?.data()?['displayName'];
                        if (role == 'Ögrenci') {
                          return StudentHome();
                        } else if (role == 'Ögretmen') {
                          return TeacherHome();
                        }
                      }
                    }
                    // Firestore isteği tamamlanana kadar beklerken yüklenme göster
                    return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                );
              } else {
                // Kullanıcı oturum açmamışsa giriş sayfasına yönlendir
                return SplashScreen();
              }
            }
            // Auth durumu beklenirken yüklenme göster
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}