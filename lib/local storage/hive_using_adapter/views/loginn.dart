import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:oct_ptoject_new/local%20storage/hive_using_adapter/model/users.dart';
import 'package:oct_ptoject_new/local%20storage/hive_using_adapter/service/hiveDB.dart';
import 'package:oct_ptoject_new/local%20storage/hive_using_adapter/views/registerr.dart';

import 'hive_home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UsersAdapter());
  await Hive.openBox<Users>('userdata');
  runApp(GetMaterialApp(home: Hive_Login(),));

}
class Hive_Login extends StatefulWidget {

  @override
  State<Hive_Login> createState() => _Hive_LoginState();
}

class _Hive_LoginState extends State<Hive_Login> {
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
              padding:  EdgeInsets.all(10.0),
              child: Text("LOGIN PAGE"),
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
                  final users = await HiveDB.getallusers();
                  validateLogin(users);
                },
                child: const Text("Login")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(Hive_Register());
                },
                child: const Text("Not a User? Register Here.")),
          ],
        ),
      ),
    );
  }

  void validateLogin(List<Users> users) async{
    final lemail = email_controller.text;
    final lpass  = pass_controller.text;
    //bool userExist = false;
    if(lemail !="" && lpass != ""){
      await Future.forEach(users, (sinleUser) {
        var name = sinleUser.name;
        if(lemail == sinleUser.email && lpass == sinleUser.password){
          Get.offAll(Hive_Home(name));
          Get.snackbar("Success", "User Login Success",backgroundColor: Colors.green);
        }else{
          Get.snackbar("Error", "Invalid login credentials",backgroundColor: Colors.red);
        }
      });
    }else{
      Get.snackbar("Error", "Fields Must not be Empty",backgroundColor: Colors.red);
    }
  }
}
