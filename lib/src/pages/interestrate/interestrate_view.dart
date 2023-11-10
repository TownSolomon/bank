import 'package:bank/src/enums/bank.dart';
import 'package:bank/src/pages/interestrate/interestrate_logic.dart';
import 'package:bank/src/utils/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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

    List<DropdownMenuItem<int>> rateTypeItems = [
      DropdownMenuItem<int>(
        value: null,
        child: Text(
          "全部",
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
      )
    ];

    rateTypeItems.addAll(
      RateType.values
          .map((RateType item) => DropdownMenuItem<int>(
                value: item.value,
                child: Text(
                  item.label.tr,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ))
          .toList(),
    );

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
                  Row(
                    children: [
                      DropDownButton(
                        title: "类型",
                        items: rateTypeItems,
                        onChanged: (int? value) {
                          logic.rateType = value;
                          logic.onRefresh();
                        },
                      ),
                      DropDownButton(
                        title: "时间",
                        items: RateDuration.values
                            .map((RateDuration item) => DropdownMenuItem<int>(
                                  value: item.value,
                                  child: Text(
                                    item.label.tr,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (int? value) {
                          logic.rateDuration = value;
                          logic.onRefresh();
                        },
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 20.w,
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          flex: 30,
                          child: Text(
                            "银行",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 30,
                          child: Text(
                            "类型",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 20,
                          child: Text(
                            "时间",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: Text(
                            "利率",
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

class DropDownButton extends StatefulWidget {
  final List<DropdownMenuItem<int>> items;
  final String title;
  final Function(int? value) onChanged;

  const DropDownButton({
    super.key,
    required this.items,
    required this.title,
    required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        isExpanded: true,
        hint: Text(
          widget.title,
          style: TextStyle(
            fontSize: 13.sp,
          ),
        ),
        items: widget.items,
        value: selectedValue,
        onChanged: (int? value) {
          setState(() {
            selectedValue = value;
            widget.onChanged.call(value);
          });
        },
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: 50.h,
          width: 140.w,
          decoration: BoxDecoration(
            color: ThemeUtils.backColor(),
          ),
        ),
        alignment: AlignmentDirectional.center,
        menuItemStyleData: MenuItemStyleData(
          height: 50.h,
        ),
      ),
    );
  }
}
