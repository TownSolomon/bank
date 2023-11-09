import 'package:bank/src/pages/bank/bank_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../../widgets/smart_refresher.dart';
import '../../widgets/titlebar.dart';

class BankPage extends StatelessWidget {
  const BankPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<BankLogic>();
    return Scaffold(
      backgroundColor: ThemeUtils.backColor(),
      appBar: EnterpriseTitleBar.homeTitle(
        title: "银行列表",
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
          delegate: logic.delegate,
          crossAxisCount: 1,
        )),
      ),
    );
  }
}
