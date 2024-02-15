import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oct_ptoject_new/local%20storage/hive_using_adapter/model/users.dart';
import 'package:oct_ptoject_new/local%20storage/hive_using_adapter/service/hiveDB.dart';
import 'package:oct_ptoject_new/local%20storage/hive_using_adapter/views/loginn.dart';

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
            ElevatedButton(
                onPressed: () async {
                  //fetch all registered users from db
                  final reg_users = await HiveDB.getallusers();
                  validateSignUp(reg_users);
                },
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }

  void validateSignUp(List<Users> users) async {
    final email = email_controller.text;
    final pwd = pass_controller.text;
    final name = name_controller.text;
    bool userExist = false;
    final validateEmail =
        EmailValidator.validate(email); // result will be in bool
    if (email != "" && pwd != "" && name != "") {
      if (validateEmail == true) {
        await Future.forEach(users, (singleUser) {
          if (singleUser.email == email) {
            userExist = true;
          } else {
            userExist = false;
          }
        });
        if (userExist == true) {
          Get.snackbar("Failed", "User Already Exist!!!!!",
              colorText: Colors.red, backgroundColor: Colors.red[100]);
        } else {
          if (pwd.length < 6) {
            Get.snackbar("Error", "Password length should be >= 6",
                colorText: Colors.red, backgroundColor: Colors.red[100]);
          } else {
            final user = Users(email: email, password: pwd, name: name);
            await HiveDB.addUser(user);
            Get.snackbar("Success", "User Registration Success!!!!",
                colorText: Colors.white, backgroundColor: Colors.green[800]);
            Get.to(Hive_Login());
          }
        }
      } else {
        Get.snackbar("Invalid Data", "Invalid Email address",
            colorText: Colors.red, backgroundColor: Colors.red[100]);
      }
    } else {
      Get.snackbar("Empty Fields", "Fields MustNot be empty",
          colorText: Colors.red, backgroundColor: Colors.red[100]);
    }
  }
}
