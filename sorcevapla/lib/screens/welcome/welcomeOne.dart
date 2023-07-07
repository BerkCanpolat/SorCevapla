import 'package:flutter/material.dart';

class WelcomeOne extends StatefulWidget {
  const WelcomeOne({super.key});

  @override
  State<WelcomeOne> createState() => _WelcomeOneState();
}

class _WelcomeOneState extends State<WelcomeOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: kToolbarHeight,
          ),
          Center(
              child: Image.asset(
            "assets/one.png",
            width: 300,
            height: 300,
          )),
          SizedBox(
            height: kToolbarHeight,
          ),
          Container(
            width: 300,
            child: Text(
              "Eğer kafanda bir soru varsa sen sor onlar cevaplasın",
              style: TextStyle(
                fontSize: 25, 
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 1
                ),
            ),
          ),
        ],
      ),
    );
  }
}