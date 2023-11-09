import 'package:bank/src/pages/bank/bank_logic.dart';
import 'package:bank/src/pages/interestrate/interestrate_logic.dart';
import 'package:bank/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/smart_refresher.dart';
import '../../widgets/titlebar.dart';

class InterestRatePage extends StatelessWidget {
  const InterestRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<InterestRateLogic>();
    return Scaffold(
      appBar: EnterpriseTitleBar.homeTitle(
        title: "利率排行",
      ),
      backgroundColor: ThemeUtils.backColor(),
      // key: logic.scaffoldKey,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    child: const Row(
                      children: [
                        Expanded(
                          flex: 50,
                          child: Text(
                            "银行",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 40,
                          child: Text(
                            "时间",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 20,
                          child: Text(
                            "利率",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                ],
              ),
            ),
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
