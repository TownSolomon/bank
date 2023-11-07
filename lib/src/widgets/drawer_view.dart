import 'package:bank/src/widgets/svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerView extends StatefulWidget {
  final VoidCallback? closeDrawer;

  const DrawerView({
    super.key,
    this.closeDrawer,
  });

  @override
  State<StatefulWidget> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  VoidCallback? closeDrawer;

  @override
  void initState() {
    closeDrawer = widget.closeDrawer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300.w,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                  leading: SvgIcon(
                    assetName: "assets/svg/link-simple_line.svg",
                    width: 22.r,
                    height: 22.r,
                  ),
                  title: Text(
                    "联系作者",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  // onTap: () {
                  //   AppNavigator.startHistoryWorkView();
                  // },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
