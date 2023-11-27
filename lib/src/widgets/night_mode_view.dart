import 'package:bank/src/translations/translation_service.dart';
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
      label: Trs.followSystem,
      value: 0,
    ),
    NightModeItem(
      label: Trs.lightMode,
      value: 1,
    ),
    NightModeItem(
      label: Trs.darkMode,
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
        title: Text(
          Trs.darkMode,
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
                        item.label,
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
      ),
    );
  }
}
