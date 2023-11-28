import 'package:bank/src/pages/splash/splash_logic.dart';
import 'package:bank/src/translations/translation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final logic = Get.find<SplashLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Center(
              child: Text(
                Trs.splash,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Positioned(
            left: 225.w,
            top: 440.h,
            child: Text(
              Trs.buffett,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
