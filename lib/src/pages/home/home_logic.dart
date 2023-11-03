import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  var index = 0.obs;

  var label = "".obs;

  var homeScaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    homeScaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    homeScaffoldKey.currentState?.openEndDrawer();
  }

  void switchTab(int i) {
    index.value = i;
  }

}
