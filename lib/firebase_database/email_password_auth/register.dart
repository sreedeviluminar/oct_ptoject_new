import 'package:flutter/material.dart';
import 'package:oct_ptoject_new/firebase_database/email_password_auth/login.dart';

class Fire_Register extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Registration Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                    hintText: "Enter Your email", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: pass,
                decoration: const InputDecoration(
                    hintText: "Enter Your Password",
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent, shape: StadiumBorder()),
                onPressed: () {},
                child: const Text("Register Here")),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Fire_Login()));
                },
                child: RichText(
                  text:
                      const TextSpan(text: "Already Registered???", children: [
                    TextSpan(
                        text: "Login Here!!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15))
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
