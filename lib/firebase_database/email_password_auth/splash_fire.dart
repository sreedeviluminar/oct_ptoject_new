import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oct_ptoject_new/firebase_database/email_password_auth/home.dart';
import 'package:oct_ptoject_new/firebase_database/email_password_auth/login.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAJyk_z0ewu6mO0l5-yI3LQx75KQMOg0W8",
        appId: "1:941207950066:android:c48504c5fe66b9d155b66b",
        messagingSenderId: "",
        projectId: "mygsignin-1649328089383")
  );
  User? user = FirebaseAuth.instance.currentUser;  // to fetch the user who logged in
  runApp(MaterialApp(
    home: user == null ? Fire_Splash(): Fire_Home(),
  ));
}

class Fire_Splash extends StatefulWidget {
  const Fire_Splash({super.key});

  @override
  State<Fire_Splash> createState() => _Fire_SplashState();
}

class _Fire_SplashState extends State<Fire_Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(
          builder: (context) => Fire_Login()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/duck.gif"))),
      ),
    );
  }
}
