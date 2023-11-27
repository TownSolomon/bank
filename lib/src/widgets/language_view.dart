
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/data_persistence.dart';

class LanguageItem {
  int value;
  String label;

  LanguageItem({
    required this.value,
    required this.label,
  });
}

class LanguageAlert extends StatefulWidget {

  const LanguageAlert({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageAlert> createState() => _LanguageAlertState();
}

class _LanguageAlertState extends State<LanguageAlert> {
  final List<LanguageItem> items = [
    LanguageItem(
      label: '跟随系统',
      value: 0,
    ),
    LanguageItem(
      label: '英语',
      value: 1,
    ),
    LanguageItem(
      label: '中文',
      value: 2,
    ),
  ];

  int? selectedValue;

  @override
  void initState() {
    selectedValue = DataPersistence.getLanguage() ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("多语言"),
      content: SizedBox(
        height: 250.h,
        width: 200.w,
        child: ListView(
          children: items
              .map((item) => RadioListTile<int>(
            title: Text(item.label.tr),
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
    );
  }
}
