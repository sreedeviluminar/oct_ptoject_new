import 'package:flutter/material.dart';
import 'package:oct_ptoject_new/mediaquery_widget/largeScreen.dart';
import 'package:oct_ptoject_new/mediaquery_widget/smallScreen.dart';

void main() {
  runApp(MyPage());
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// fetch the theme of device
    bool isDarkTheme = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.light() : ThemeData.dark(),
      home: Screenn(),
    );
  }
}

class Screenn extends StatelessWidget {
  var orientation, height, width;
  bool? isLargeScreen;

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    isLargeScreen = width > 600;
    return Scaffold(
        body: isLargeScreen == true
            ? LargeScreen()
            : SmallScreen()

        // body: orientation == Orientation.portrait?
        //   Container(
        //         color: Colors.blue,
        //         height: height / 2,
        //         width: width / 2,
        //       )
        //     : Container(
        //         color: Colors.purple,
        //         height: height / 2,
        //         width: width / 4,
        //       ),
        );
  }
}
