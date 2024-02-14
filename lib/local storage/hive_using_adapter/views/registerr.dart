import 'package:flutter/material.dart';
import 'package:oct_ptoject_new/local%20storage/hive_using_adapter/service/hiveDB.dart';

class Hive_Register extends StatefulWidget {
  const Hive_Register({super.key});

  @override
  State<Hive_Register> createState() => _Hive_RegisterState();
}

class _Hive_RegisterState extends State<Hive_Register> {
  final name_controller = TextEditingController();
  final email_controller = TextEditingController();
  final pass_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child:  Text("REGISTRATION PAGE"),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: name_controller,
                decoration: const InputDecoration(
                    hintText: "Name", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: email_controller,
                decoration: const InputDecoration(
                    hintText: "Username", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: pass_controller,
                decoration: const InputDecoration(
                    hintText: "Password", border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(onPressed: () async{
              //fetch all registered users from db
              final reg_users = await HiveDB.getallusers();
            }, child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
