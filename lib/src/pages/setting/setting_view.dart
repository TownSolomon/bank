import 'package:bank/src/pages/setting/setting_logic.dart';
import 'package:bank/src/translations/translation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../models/option.dart';
import '../../routes/app_navigator.dart';
import '../../utils/theme.dart';
import '../../widgets/svg_picture.dart';
import '../../widgets/titlebar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SettingLogic>();
    final options = <Option>[
      Option(
        label: Trs.darkMode,
        svg: "assets/svg/lightbulb_line.svg",
        onTap: logic.onNightModeEdit,
      ),
      Option(
        label: Trs.languageSetup,
        svg: "assets/svg/language_line.svg",
        onTap: logic.onLanguageEdit,
      ),
      // Option(
      //   label: "用户协议",
      //   svg: "assets/svg/handshake_line.svg",
      //   // onTap: AppNavigator.startSettingAccount,
      // ),
      // Option(
      //   label: "隐私政策",
      //   svg: "assets/svg/user-shield_line.svg",
      //   // onTap: AppNavigator.startSettingAccount,
      // ),
      Option(
        label: Trs.contactUs,
        svg: "assets/svg/comments_line.svg",
        onTap: AppNavigator.startConnect,
      ),
    ];
    return Scaffold(
      appBar: EnterpriseTitleBar.homeTitle(
        title: Trs.settingsAndInformation,
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
