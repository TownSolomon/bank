import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SvgButton extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final double? size;
  final Color? color;
  final double? boxSize;
  final Color? boxColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final double? borderRadius;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;

  const SvgButton({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.size,
    this.boxSize,
    this.boxColor,
    this.color,
    this.padding,
    this.margin,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? 1000.r),
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      child: Container(
        padding: padding ?? EdgeInsets.zero,
        margin: margin ?? EdgeInsets.zero,
        height: boxSize ?? 44.r,
        width: boxSize ?? 44.r,
        decoration: BoxDecoration(
          color: boxColor ?? Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
            child: SvgIcon(
          assetName: assetName,
          color: color,
          width: width,
          height: height,
          size: size,
        )),
      ),
    );
  }
}

class SvgIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final double? size;
  final Color? color;

  const SvgIcon({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    ColorFilter? colorFilter;
    if (color != null) {
      colorFilter = ColorFilter.mode(
        color!,
        BlendMode.srcIn,
      );
    } else if (Get.theme.iconTheme.color != null) {
      colorFilter = ColorFilter.mode(
        Get.theme.iconTheme.color!,
        BlendMode.srcIn,
      );
    }
    return SvgPicture.asset(
      assetName,
      colorFilter: colorFilter,
      width: width ?? size ?? 25.r,
      height: height ?? size ?? 25.r,
    );
  }
}
