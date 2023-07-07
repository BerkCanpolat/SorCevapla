import 'package:flutter/material.dart';

class WelcomeThree extends StatelessWidget {
  const WelcomeThree({super.key});

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
            "assets/three.png",
            width: 300,
            height: 300,
          )),
          SizedBox(
            height: kToolbarHeight,
          ),
          Container(
            width: 300,
            child: Text(
              "Bütün sorularınızın cevap SorCevapla'da",
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