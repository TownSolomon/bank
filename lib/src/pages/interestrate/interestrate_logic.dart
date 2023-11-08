import 'package:bank/src/enums/load.dart';
import 'package:bank/src/models/bank.dart';
import 'package:bank/src/models/page_info.dart';
import 'package:bank/src/utils/toaster.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../apis/bank.dart';
import '../../models/error_model.dart';

class InterestRateLogic extends GetxController {
  var hasMore = false;
  var page = PageRequest(current: 1, size: 10);
  var list = <InterestRateItemModel>[].obs;

  Future<bool> onRefresh() async {
    try {
      page = page.init();
      dio.Response response = await bankApiClient.listInterestrates(page);
      ListInterestRateResponse listBankResponse =
          ListInterestRateResponse.fromJson(response.data);
      hasMore = listBankResponse.page.hasMore;
      list
        ..clear()
        ..addAll(listBankResponse.list);
      return true;
    } on DioException catch (e) {
      ErrorResponse errorResponse = ErrorResponse.fromError(e);
      return false;
    }
  }

  Future<LoadResult> onLoading() async {
    if (!hasMore) {
      return LoadResult.noData;
    }

    try {
      dio.Response response = await bankApiClient.listInterestrates(page.nextPage());
      ListInterestRateResponse listBankResponse =
          ListInterestRateResponse.fromJson(response.data);
      hasMore = listBankResponse.page.hasMore;
      list.addAll(listBankResponse.list);
      return LoadResult.complete;
    } on DioException catch (e) {
      ErrorResponse errorResponse = ErrorResponse.fromError(e);
      Toaster.showError(errorResponse.message);
      return LoadResult.failed;
    }
  }

  Widget delegate(int index) {
    InterestRateItemModel model = list.elementAt(index);

    return  Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Row(
            children: [
              Expanded(
                flex: 50,
                child: Text(model.bank.label),
              ),
              Expanded(
                flex: 40,
                child: Text(model.interestRate.label),
              ),
              Expanded(
                flex: 20,
                child: Text(
                  "${model.interestRate.rate.toStringAsFixed(2)}%",
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
    return InkWell(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 5.r, vertical: 1.r),
        elevation: 1.r,
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Expanded(
              flex: 50,
              child: Text(model.bank.label),
            ),
            Expanded(
              flex: 50,
              child: Text(model.interestRate.label),
            ),
            Expanded(
              flex: 50,
              child: Text(model.interestRate.rate.toStringAsFixed(2)),
            ),
          ],
        ),
        // child: ListTile(
        //   leading: Text(model.bank.label),
        //   title: Text(model.interestRate.label),
        //   trailing: Text(model.interestRate.rate.toStringAsFixed(2)),
        //   minLeadingWidth: 50.w,
        // ),
      ),
    );
  }
}
