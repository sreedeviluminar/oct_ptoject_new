import 'package:flutter/material.dart';
import 'package:oct_ptoject_new/refractoring%20widget/widgets/mywidget.dart';
void main(){
  runApp(MaterialApp(home: RefractoringHome(),));
}
class RefractoringHome extends StatelessWidget {
  const RefractoringHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refractoring Widget"),
        backgroundColor: Colors.red,
      ),
      body: GridView.builder(
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => ProductWidget(
              bgColor: Colors.black,
              onClick: (){},
              myimage: const AssetImage("assets/images/mango.png"),
              name: "Mango",
              price: "\$200/Kg")),
    );
  }
}
