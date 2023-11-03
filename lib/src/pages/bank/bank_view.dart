import 'package:bank/src/pages/bank/bank_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/smart_refresher.dart';
import '../../widgets/titlebar.dart';

class BankPage extends StatelessWidget {
  const BankPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<BankLogic>();
    return Scaffold(
      appBar: EnterpriseTitleBar.back(
        title: "测试",
        leftTile: "",
      ),
      // key: logic.scaffoldKey,
      body: NestedScrollView(
        floatHeaderSlivers: false,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
          ];
        },
        body: Obx(() => ObxSmartRefresher(
          initialRefresh: true,
          onRefresh: logic.onRefresh,
          onLoading: logic.onLoading,
          length: logic.list.length,
          delegate: logic.delegate1,
          crossAxisCount: 1,
        )),
      ),
    );
  }
}
