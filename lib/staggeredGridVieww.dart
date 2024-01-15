import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    home: Stg_Grid(),
  ));
}

class Stg_Grid extends StatelessWidget {
   var ccount =[2,2,2,2,2,2];
   var mcount=[3,2,3,1,3,2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate( 6,
              (index) => StaggeredGridTile.count(
                crossAxisCellCount: ccount[index],
                mainAxisCellCount: mcount[index],
                child: Card(
                  color:
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  child: Column(
                    children: [
                      Expanded(
                          child: Image.asset("assets/images/logingirl.png")),
                      const Text(
                        "LOGIN GIRL",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
