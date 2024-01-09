import 'package:flutter/material.dart';
import 'package:oct_ptoject_new/passing%20data%20between%20screens%20example/statefulpage.dart';
import 'package:oct_ptoject_new/passing%20data%20between%20screens%20example/statelesspage.dart';

void main() {
  runApp(MaterialApp(
    home: DataHome(),
  ));
}

class DataHome extends StatelessWidget {
  String name = "Luminar"; // instance variables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          Screen_Stateless(name: name,phone :987654311)));
                },
                child: const Text("To statelessPage")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          Screen_Stateful(name: name,loca :"Kakkanad")));
                }, child: const Text("To statefullPage")),
          ],
        ),
      ),
    );
  }
}
