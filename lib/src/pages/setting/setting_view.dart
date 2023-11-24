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
        label: "暗色模式",
        svg: "assets/svg/lightbulb_line.svg",
        // onTap: AppNavigator.startSettingAccount,
      ),
      Option(
        label: "多语言",
        svg: "assets/svg/language_line.svg",
        // onTap: AppNavigator.startSettingAccount,
      ),
      Option(
        label: "用户协议",
        svg: "assets/svg/handshake_line.svg",
        // onTap: AppNavigator.startSettingAccount,
      ),
      Option(
        label: "隐私政策",
        svg: "assets/svg/user-shield_line.svg",
        // onTap: AppNavigator.startSettingAccount,
      ),
      Option(
        label: "联系我们",
        svg: "assets/svg/comments_line.svg",
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
            delegate: SliverChildBuilderDelegate(
              (context, int index) {
                Option option = options.elementAt(index);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: SvgIcon(
                        assetName: option.svg!,
                        width: 29.r,
                        height: 29.r,
                      ),
                      title: Text(
                        option.label,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onTap: option.onTap,
                    ),
                    const Divider(),
                  ],
                );
              },
              childCount: options.length,
            ),
          ),
        ],
      ),
    );
  }
}
