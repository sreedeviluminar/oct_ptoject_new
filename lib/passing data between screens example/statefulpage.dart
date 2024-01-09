import 'package:flutter/material.dart';
class Screen_Stateful extends StatefulWidget {
  String? name, loca;
  Screen_Stateful({super.key, this.name, this.loca});
  @override
  State<Screen_Stateful> createState() => _Screen_StatefulState();
}

class _Screen_StatefulState extends State<Screen_Stateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.name} ${widget.loca}'),
      ),
    );
  }
}
