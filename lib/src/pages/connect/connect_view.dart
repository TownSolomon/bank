import 'package:bank/src/commons/env.dart';
import 'package:bank/src/translations/translation_service.dart';
import 'package:bank/src/widgets/svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../models/option.dart';
import '../../utils/theme.dart';
import '../../widgets/titlebar.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final options = <Option>[
      Option(
        label: Trs.website,
        subtitle: "https://towns.world",
        onTap: () => launchUrlString("https://towns.world"),
      ),
      Option(
        label: Trs.email,
        subtitle: "townsworlds@gmail.com",
        onTap: () => launchUrlString("mailto:townsworlds@gmail.com"),
      ),
      Option(
        label: Trs.xhs,
        subtitle: "小红书搜索唐思忆",
        onTap: () => launchUrlString(
            "https://www.xiaohongshu.com/user/profile/59d5c617de5fb4309d676210"),
      ),
      Option(
        label: Trs.douyin,
        subtitle: "抖音搜索唐思忆",
        onTap: () => launchUrlString("https://v.douyin.com/iRrLs7Xw"),
      ),
    ];

    if (Env.isGlobal) {
      options.add(
        Option(
          label: Trs.twitter,
          subtitle: "X搜索Towns",
          onTap: () => launchUrlString("https://twitter.com/townsworlds"),
        ),
      );
    }
    options.add(
      Option(
        label: Trs.wechat,
        subtitle: "微信搜索townsworld",
      ),
    );

    return Scaffold(
      appBar: EnterpriseTitleBar.back(
        title: Trs.contactUs,
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
                      title: Text(
                        option.label,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        option.subtitle ?? "",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      trailing: option.onTap == null
                          ? Container(
                        width: 30.w,
                      )
                          : SvgButton(
                              assetName: 'assets/svg/angle-right_line.svg',
                              color: ThemeUtils.themeColor(),
                              onTap: option.onTap,
                            ),
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
