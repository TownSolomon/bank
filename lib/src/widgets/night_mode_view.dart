
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/data_persistence.dart';

class NightModeItem {
  int value;
  String label;

  NightModeItem({
    required this.value,
    required this.label,
  });
}

class NightModeAlert extends StatefulWidget {

  const NightModeAlert({
    Key? key,
  }) : super(key: key);

  @override
  State<NightModeAlert> createState() => _NightModeAlertState();
}

class _NightModeAlertState extends State<NightModeAlert> {
  final List<NightModeItem> items = [
    NightModeItem(
      label: '跟随系统',
      value: 0,
    ),
    NightModeItem(
      label: '亮色模式',
      value: 1,
    ),
    NightModeItem(
      label: '暗色模式',
      value: 2,
    ),
  ];

  int? selectedValue;

  @override
  void initState() {
    selectedValue = DataPersistence.getNightMode() ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AlertDialog(
        title: Text("暗色模式"),
        content: SizedBox(
          height: 250.h,
          width: 200.w,
          child: ListView(
            children: items
                .map((item) => RadioListTile<int>(
              title: Text(item.label),
              value: item.value,
              groupValue: selectedValue,
              selected: selectedValue == item.value,
              onChanged: (int? value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ))
                .toList(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text("取消"),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: Text("确认"),
            onPressed: () {
              Get.back(result: selectedValue);
            },
          ),
        ],
      ),
    );
  }
}
