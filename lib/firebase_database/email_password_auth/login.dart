import 'package:flutter/material.dart';
import 'package:oct_ptoject_new/firebase_database/email_password_auth/register.dart';



class Fire_Login extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Login Page"),
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
            MaterialButton(
              onPressed: () {},
              shape: const StadiumBorder(),
              color: Colors.orange,
              child: const Text("Login Here"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder:(context) => Fire_Register()));
                },
                child: RichText(
                  text: const TextSpan(
                      text: "Not a User???",
                      children: [
                    TextSpan(
                        text: "Register Here!!",
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
