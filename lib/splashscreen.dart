import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAF2FE),
      body: Container(

        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/Logo.png'),
            SizedBox(
              height: 12,
            ),
            Text(
              "AR\nDental Care",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff135699),
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
