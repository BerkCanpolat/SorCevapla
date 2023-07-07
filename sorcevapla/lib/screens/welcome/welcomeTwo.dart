import 'package:flutter/material.dart';

class WelcomeTwo extends StatelessWidget {
  const WelcomeTwo({super.key});

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
            "assets/two.png",
            width: 300,
            height: 300,
          )),
          SizedBox(
            height: kToolbarHeight,
          ),
          Container(
            width: 300,
            child: Text(
              "Bu uygulamayı kullanmanıza daha fazla yardımcı olacak daha birçok harika özellik",
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