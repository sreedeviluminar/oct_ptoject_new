import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:oct_ptoject_new/api%20integration/using%20dio/service/dioservice.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../model/datamodel.dart';

class DataController extends GetxController {
  RxList<DataModel> datas = RxList();
  RxBool isLoading = true.obs;
  RxBool isListDown = false.obs;
  RxBool isNetConnected = true.obs;

  var scrollController = ItemScrollController();

  /// to check the internet connectivity
  void isInternetConnected() async {
    isNetConnected.value = await InternetConnectionChecker().hasConnection;
  }

  ///to fetch all the values from api
  fetchData() async {
    isInternetConnected();
    isLoading.value = true;
    var response = await DioService().getData();
    if (response.statusCode == 200) {
      response.data.forEach((data) {
        datas.add(DataModel.fromJson(data));
      });
    }
  }

  ///goto end of the listview
  scrollToDown() {
    scrollController.scrollTo(
        index: datas.length,
        duration: const Duration(seconds: 4),
        curve: Curves.bounceInOut);
  }

  ///goto top of the listview
  scrollToUp() {
    scrollController.scrollTo(
        index: 0,
        duration: const Duration(seconds: 4),
        curve: Curves.slowMiddle);
  }

  @override
  void onInit() {
    fetchData();
    isInternetConnected();
    super.onInit();
  }
}
