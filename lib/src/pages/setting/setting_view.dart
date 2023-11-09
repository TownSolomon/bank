import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/option.dart';
import '../../utils/theme.dart';
import '../../widgets/svg_picture.dart';
import '../../widgets/titlebar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final options = <Option>[
      Option(
        label: "联系我们",
        svg: "assets/svg/link-simple_line.svg",
        // onTap: AppNavigator.startSettingAccount,
      ),
      Option(
        label: "联系我们",
        svg: "assets/svg/link-simple_line.svg",
        // onTap: AppNavigator.startSettingAccount,
      ),
    ];
    return Scaffold(
      appBar: EnterpriseTitleBar.homeTitle(
        title: "设置与信息",
      ),
      backgroundColor: ThemeUtils.backColor(),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, int index) {
              Option option = options.elementAt(index);
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                leading: SvgIcon(
                  assetName: option.svg!,
                  width: 22.r,
                  height: 22.r,
                ),
                title: Text(
                  option.label,
                  style: TextStyle(
                    // fontSize: 17.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onTap: option.onTap,
              );
            }, childCount: options.length),
          ),
        ],
      ),
    );
  }
}
