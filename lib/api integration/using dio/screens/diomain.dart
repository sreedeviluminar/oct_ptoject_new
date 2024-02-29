import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:oct_ptoject_new/api%20integration/using%20dio/controller/datacontroller.dart';
import 'package:oct_ptoject_new/api%20integration/using%20dio/utils/colors.dart';

void main() {
  runApp(GetMaterialApp(home: DioHome()));
}

class DioHome extends StatelessWidget {
  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dio Home"),
        backgroundColor: MyColors.scColor,
      ),
      backgroundColor: MyColors.bgColor,
      floatingActionButton:
      Obx(() => controller.isNetConnected.value ? buildFAB() : Container()),
      body: Obx(() =>
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: controller.isNetConnected.value
                ? (controller.isLoading.value)
                ? Center(child: Lottie.asset(
                "assets/animation/Animation - 1709191722675.json")) : getData()
                : noInternet(),
          )),
    );
  }

  FloatingActionButton buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        controller.isListDown.value
            ? controller.scrollToUp()
            : controller.scrollToDown();
      },
      child: FaIcon(controller.isListDown.value
          ? FontAwesomeIcons.arrowUp
          : FontAwesomeIcons.arrowDown),
    );
  }

  getData() {}

  noInternet() {}
}
