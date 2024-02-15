import 'package:flutter/material.dart';

class Hive_Home extends StatefulWidget {
   String? name;
   Hive_Home(this.name, {super.key});

  @override
  State<Hive_Home> createState() => _Hive_HomeState();
}

class _Hive_HomeState extends State<Hive_Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 5,
        title: Text('Welcome ${widget.name}'),
      ),
    );
  }
}
