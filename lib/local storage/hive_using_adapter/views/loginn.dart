import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:oct_ptoject_new/local%20storage/hive_using_adapter/views/registerr.dart';

void main() async{
  //WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userdata');
  runApp(GetMaterialApp(home: Hive_Login(),));

}
class Hive_Login extends StatefulWidget {

  @override
  State<Hive_Login> createState() => _Hive_LoginState();
}

class _Hive_LoginState extends State<Hive_Login> {
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
            ElevatedButton(onPressed: () {}, child: const Text("Login")),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Get.to(Hive_Register());
            }, child: const Text("Not a User? Register Here.")),

          ],
        ),
      ),
    );
  }
}
