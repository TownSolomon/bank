import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/theme.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
    this.index = 0,
    required this.items,
  }) : super(key: key);
  final int index;
  final List<BottomBarItem> items;

  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    var items = widget.items;
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: ThemeUtils.appBarColor(),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.5),
            offset: const Offset(0, -0.1),
          ),
        ],
      ),
      child: Row(
        children: List.generate(
            items.length,
            (index) => _buildItemView(
                  i: index,
                  item: items.elementAt(index),
                )).toList(),
      ),
    );
  }

  Widget _buildItemView({required int i, required BottomBarItem item}) =>
      Expanded(
        child: GestureDetector(
          onTap: () {
            if (item.onClick != null) item.onClick!(i);
          },
          behavior: HitTestBehavior.translucent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 10.h,
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 15.r,
                    fontWeight:
                        i == widget.index ? FontWeight.bold : FontWeight.normal,
                    color: i == widget.index ? ThemeUtils.themeColor() : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class BottomBarItem {
  final String label;
  final Function(int index)? onClick;

  BottomBarItem({
    required this.label,
    this.onClick,
  });
}
