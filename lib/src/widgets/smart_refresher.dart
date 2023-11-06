import 'package:bank/src/widgets/refresher_view.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import '../enums/load.dart';

class ObxSmartRefresher extends StatefulWidget {
  final bool initialRefresh;
  final Future<bool> Function() onRefresh;
  final Future<LoadResult> Function() onLoading;
  final Widget Function(int index) delegate;
  final int length;
  final int crossAxisCount;
  final int? preload;

  const ObxSmartRefresher({
    Key? key,
    required this.initialRefresh,
    required this.onRefresh,
    required this.onLoading,
    required this.length,
    required this.delegate,
    required this.crossAxisCount,
    this.preload,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ObxSmartRefresherState();
}

class _ObxSmartRefresherState extends State<ObxSmartRefresher> {
  bool isLoading = false;
  late RefreshController refreshController;
  late VoidCallback loading;

  @override
  void initState() {
    refreshController = RefreshController(
      initialRefresh: widget.initialRefresh,
    );
    loading = () async {
      if (isLoading) {
        return;
      }
      isLoading = true;
      try {
        LoadResult result = await widget.onLoading.call();
        switch (result) {
          case LoadResult.complete:
            refreshController.loadComplete();
            break;
          case LoadResult.failed:
            refreshController.loadFailed();
            break;
          default:
            refreshController.loadNoData();
            break;
        }
      } finally {
        isLoading = false;
      }
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      enablePullUp: true,
      header: Refresher.header(),
      footer: Refresher.footer(),
      onRefresh: () async {
        refreshController.footerMode?.value = LoadStatus.idle;
        refreshController.headerMode?.value = RefreshStatus.refreshing;

        bool success = await widget.onRefresh.call();
        if (success) {
          refreshController.refreshCompleted();
        } else {
          refreshController.loadFailed();
          refreshController.footerMode?.value = LoadStatus.failed;
          refreshController.headerMode?.value = RefreshStatus.failed;
        }
      },
      onLoading: loading,
      child: getChild(),
    );
  }

  Widget getChild() {
    return CustomScrollView(
      slivers: [
        SliverWaterfallFlow(
          gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            collectGarbage: (List<int> garbageList) {},
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              // if (index == widget.length - (widget.preload ?? 1)) {
              //   loading.call();
              // }
              return widget.delegate.call(index);
            },
            childCount: widget.length,
          ),
        )
      ],
    );
  }
}
