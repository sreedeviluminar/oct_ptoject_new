import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: Fire_Splash(),
  ));
}
class Fire_Splash extends StatefulWidget {
  const Fire_Splash({super.key});

  @override
  State<Fire_Splash> createState() => _Fire_SplashState();
}

class _Fire_SplashState extends State<Fire_Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/duck.gif"))),
      ),
    );
  }
}
