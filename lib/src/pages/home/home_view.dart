import 'package:bank/src/pages/bank/bank_view.dart';
import 'package:bank/src/pages/interestrate/interestrate_view.dart';
import 'package:bank/src/pages/setting/setting_view.dart';
import 'package:bank/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/bottombar.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    return Scaffold(
      key: logic.homeScaffoldKey,
      backgroundColor: ThemeUtils.backColor(),
      body: Obx(() => Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: logic.index.value,
                  children: const [
                    BankPage(),
                    InterestRatePage(),
                    SettingPage(),
                  ],
                ),
              ),
              BottomBar(
                index: logic.index.value,
                items: [
                  BottomBarItem(
                    label: "银行",
                    onClick: (i) => logic.switchTab(i),
                  ),
                  BottomBarItem(
                    label: "利率",
                    onClick: (i) => logic.switchTab(i),
                  ),
                  BottomBarItem(
                    label: "设置",
                    onClick: (i) => logic.switchTab(i),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
