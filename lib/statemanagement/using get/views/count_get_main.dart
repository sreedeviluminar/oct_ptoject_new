import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oct_ptoject_new/statemanagement/using%20get/controller/countCntrl.dart';

void main() {
  runApp(MaterialApp(
    home: GetCountMain(),
  ));
}

class GetCountMain extends StatelessWidget {
  const GetCountMain({super.key});

  @override
  Widget build(BuildContext context) {
    //creating an instance of controller(or register the controller
    // inside this widget tree)
    final CountCntrl countcontroller = Get.put(CountCntrl());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getx Counter"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Counter using Getx",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Obx(() => Text("Count = ${countcontroller.count}")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    countcontroller.increment();
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.add),
                  ),
                ),
                InkWell(
                  onTap: () {
                    countcontroller.decrement();
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.minimize_rounded),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
