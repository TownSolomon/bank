import 'package:bank/src/pages/splash/splash_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SplashLogic>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Text("让我们一起存钱钱"),
            top: 100.h,
            left: 150.w,
          ),
          Positioned(
            child: Text("唐思忆"),
            top: 500.h,
            left: 150.w,
          ),
          Positioned(
            child: Text("towns.world"),
            top: 530.h,
            left: 150.w,
          ),
        ],
      ),
    );
  }
}
