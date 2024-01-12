import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SliverEx(),
  ));
}

class SliverEx extends StatelessWidget {
  var images = [
    "assets/images/icon.png",
    "assets/images/logingirl.png",
    "assets/images/mango.png",
    "assets/images/icon.png",
    "assets/images/logingirl.png",
    "assets/images/mango.png",
    "assets/images/icon.png",
    "assets/images/logingirl.png",
    "assets/images/mango.png",
    "assets/images/icon.png",

  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          title: const Text("SliverExample"),
          bottom: AppBar(
            title: Container(
              width: double.infinity,
                      height: 40,
                      color: Colors.white,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Search Here",
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.camera_alt),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                          Card(
                            child: ListTile(
                              leading: Image.asset(images[index]),
                              title: Text("Product"),
                              trailing: Icon(Icons.shopping_cart),
                            ),
                          ),
                      childCount: 10),
                ),
                SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      color: Colors.black,
                      child: GridView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Image.asset("assets/images/logingirl.png")),
                    const Text(
                      "Login Girl",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          ),
                    )
                ),
                SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) =>
                        Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/images/mango.png"),
                              const Text(
                                "Mango",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const Text("\$200/kg",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ))
                            ],
                          ),
                        ),
                        childCount: 10
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2)),


              ],
            )));
  }
}
