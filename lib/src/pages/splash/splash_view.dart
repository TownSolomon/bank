import 'package:bank/src/pages/splash/splash_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SplashLogic>();
    return const Scaffold(
      body: Center(
        child: Text("ok"),
      ),
    );
  }
}
