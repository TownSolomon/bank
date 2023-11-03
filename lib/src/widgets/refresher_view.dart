import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../commons/env.dart';

class Refresher {
  static Widget header() {
    switch (Env.platform) {
      case CustomPlatform.android:
        return const MaterialClassicHeader(
          color: Colors.black,
        );
      default:
        return const ClassicHeader(
          refreshingText: "",
          releaseText: "",
          idleText: "",
          failedText: "",
          completeText: "",
        );
    }
  }

  static Widget footer() {
    return CustomFooter(
      loadStyle: LoadStyle.ShowWhenLoading,
      builder: (BuildContext context, LoadStatus? mode) {
        Widget data = const CupertinoActivityIndicator();
        if (mode == LoadStatus.noMore) {
          data = const Text("");
        }
        return SizedBox(
          height: 55.0,
          child: Center(child: data),
        );
      },
    );
  }
}

class Refreshing extends StatelessWidget {
  const Refreshing({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 25.r,
        height: 25.r,
        child: const CircularProgressIndicator(strokeWidth: 4),
      ),
    );
  }
}
