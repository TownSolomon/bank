import 'package:bank/src/translations/translation_service.dart';
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
      label: Trs.followSystem,
      value: 0,
    ),
    LanguageItem(
      label: Trs.english,
      value: 1,
    ),
    LanguageItem(
      label: Trs.chinese,
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
      title: Text(
        Trs.languageSetup,
        style: TextStyle(
          fontSize: 14.sp,
        ),
      ),
      content: SizedBox(
        height: 250.h,
        width: 200.w,
        child: ListView(
          children: items
              .map((item) => RadioListTile<int>(
                    title: Text(
                      item.label.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
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
          child: Text(
            Trs.cancel,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text(
            Trs.ok,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          onPressed: () {
            Get.back(result: selectedValue);
          },
        ),
      ],
    );
  }
}
