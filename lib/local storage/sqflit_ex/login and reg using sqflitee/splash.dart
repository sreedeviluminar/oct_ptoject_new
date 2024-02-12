import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'loginsignup.dart';

void main() {
  runApp(MaterialApp(
    home: SqfliteSplash(),
  ));
}

class SqfliteSplash extends StatefulWidget {
  @override
  State<SqfliteSplash> createState() => _SqfliteSplashState();
}

class _SqfliteSplashState extends State<SqfliteSplash> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginSignUp()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/peakpx.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  GradientText(
                    'PUNCH',
                    style: GoogleFonts.poppins(
                        fontSize: 50.0, fontWeight: FontWeight.bold),
                    colors: [
                      Colors.green,
                      Colors.black,
                      Colors.red,
                      Colors.blue
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'PUNCH',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: '.EARN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple)),
                        TextSpan(
                            text: '.REPEAT!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
