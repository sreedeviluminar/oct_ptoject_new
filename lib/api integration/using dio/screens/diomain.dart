import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:oct_ptoject_new/api%20integration/using%20dio/controller/datacontroller.dart';
import 'package:oct_ptoject_new/api%20integration/using%20dio/utils/colors.dart';
import 'package:oct_ptoject_new/api%20integration/using%20dio/utils/const_snackbar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
            child: controller.isNetConnected.value == true
                ? (controller.isLoading.value
                    ? Center(
                        child: Lottie.asset(
                            "assets/animation/Animation - 1709191722675.json",
                            height: 100,
                            width: 200))
                    : getData())
                : noInternet(context),
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

  RefreshIndicator getData(){
    return RefreshIndicator(
        child: ScrollablePositionedList.builder(
            itemScrollController: controller.scrollController,
            itemCount: controller.datas.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: MyColors.bgColor,
                    child: Text(controller.datas[index].id.toString()),
                  ),
                  title: Text(controller.datas[index].title!),
                  subtitle: Text(controller.datas[index].body!),
                ),
              );
            }),
        onRefresh: () {
          return controller.fetchData();
        });
  }

  Center noInternet(BuildContext context) {
    return Center(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/animation/networkerror.json"),
          MaterialButton(onPressed: ()async{
            if(await InternetConnectionChecker().hasConnection == true){
              controller.fetchData();
            }else{
              showCustomSnackBar(context);
            }
          })
        ],
      ),
    );
  }
}
