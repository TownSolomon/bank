import 'package:bank/src/utils/rooter.dart';
import 'package:bank/src/widgets/svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../pages/home/home_logic.dart';
import '../utils/theme.dart';

class EnterpriseTitleBar extends StatelessWidget
    implements PreferredSizeWidget {
  const EnterpriseTitleBar({
    Key? key,
    this.height,
    this.left,
    this.center,
    this.right,
    this.backgroundColor,
    this.topPadding = 0.0,
    this.showShadow = true,
  }) : super(key: key);
  final double? height;
  final Widget? left;
  final Widget? center;
  final Widget? right;
  final Color? backgroundColor;
  final double topPadding;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    return _appbar(
      backgroundColor: backgroundColor,
      left: left,
      center: center,
      right: right,
      height: height! + data.padding.top,
      topPadding: data.padding.top,
      showShadow: showShadow,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 50.h);

  static Widget _appbar({
    Color? backgroundColor,
    double? height,
    Widget? left,
    Widget? center,
    Widget? right,
    double topPadding = 0.0,
    bool showShadow = true,
  }) =>
      Container(
        height: height,
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: topPadding),
        decoration: BoxDecoration(
          color: ThemeUtils.appBarColor(),
          boxShadow: showShadow
              ? [
                  const BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 0.1),
                    spreadRadius: 0,
                  )
                ]
              : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: center,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: right,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: left,
            ),
          ],
        ),
      );

  EnterpriseTitleBar.homeTitle({
    Key? key,
    required String title,
    TextStyle? tileStyle,
    TextStyle? subTStyle,
    Function()? onAvatarTap,
    List<Widget> actions = const [],
    Widget? titleView,
    Widget? subTitleView,
  })  : height = 50.h,
        topPadding = 0,
        backgroundColor = null,
        left = null,
        right = null,
        showShadow = false,
        center = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: ThemeUtils.appBarTitleTextStyle(),
            ),
          ],
        ),
        super(key: key);

  EnterpriseTitleBar.back({
    Key? key,
    String? title,
    TextStyle? style,
    String? subTitle,
    TextStyle? subStyle,
    String? leftTile,
    double? height,
    dynamic result,
    this.backgroundColor,
    List<Widget> actions = const [],
    bool showBackArrow = true,
    this.showShadow = true,
  })  : height = height ?? 44.h,
        topPadding = 0,
        left = showBackArrow
            ? Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      RootUtils.backOrHome(res: result);
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      height: 44.h,
                      child: Center(
                        child: null != leftTile
                            ? Text(
                                leftTile,
                                style: ThemeUtils.appBarTitleTextStyle(),
                              )
                            : SvgIcon(
                                assetName: "assets/svg/angle-left_line.svg",
                                color: ThemeUtils.themeColor(),
                              ),
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              )
            : null,
        right = Row(
          mainAxisSize: MainAxisSize.min,
          children: actions,
        ),
        center = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (null != title)
              Text(
                title,
                style: ThemeUtils.appBarTitleTextStyle(),
              ),
            if (null != subTitle)
              Text(
                subTitle,
                style: subStyle ??
                    TextStyle(
                      fontSize: 10.sp,
                      color: const Color(0xFF999999),
                    ),
              ),
          ],
        ),
        super(key: key);

  EnterpriseTitleBar.leftTitle({
    super.key,
    String? title,
    TextStyle? textStyle,
    double? height,
    List<Widget> actions = const [],
    this.backgroundColor,
  })  : //height = height ?? 84.h,
        //topPadding = 40.h,
        height = height ?? 44.h,
        topPadding = 0,
        showShadow = true,
        center = null,
        right = Row(
          mainAxisSize: MainAxisSize.min,
          children: actions,
        ),
        left = Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            title ?? '',
            style: textStyle ??
                TextStyle(
                  color: const Color(0xFF1B72EC),
                  fontSize: 22.sp,
                ),
          ),
        );
}

class TitleImageButton extends StatelessWidget {
  const TitleImageButton({
    Key? key,
    required this.imageStr,
    required this.imageWidth,
    required this.imageHeight,
    this.width,
    this.height,
    this.onTap,
    this.padding,
    this.color,
  }) : super(key: key);
  final String imageStr;
  final double imageWidth;
  final double imageHeight;
  final double? width;
  final double? height;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 44.h,
        padding: padding ?? EdgeInsets.only(left: 10.w, right: 10.w),
        child: Center(
          child: Image.asset(
            imageStr,
            width: imageWidth,
            height: imageHeight,
            color: color,
          ),
        ),
      ),
    );
  }
}
